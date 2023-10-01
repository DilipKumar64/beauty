import 'package:beauty/utils/constants.dart';
import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScheduleAppoinmentRepository {
  Future<void> storePaymentInfoToFirebase(GpayPaymentSucessModel data) async {
    try {
      final docRef = firebaseFirestore.collection('payments').doc();
      docRef.set(data.toJson());
      final userDocRef = firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      userDocRef.update({"paymentId": docRef.id});
    } catch (e) {
      Exception(e.toString());
    }
  }

  Future<void> saveAppoinmentDataToFirebase(Map<String, String> data) async {
    final docRef = firebaseFirestore.collection("appoinments").doc();
    await docRef.set(data);
    final userDocRef = firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await userDocRef.update({"appoinmentId": docRef.id});
  }
}
