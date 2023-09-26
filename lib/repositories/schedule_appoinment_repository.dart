import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScheduleAppoinmentRepository {
  final db = FirebaseFirestore.instance;
  Future<void> storePaymentInfoToFirebase(GpayPaymentSucessModel data) async {
    try {
      final docRef = db.collection('payments').doc();
      docRef.set(data.toJson());
      final userDocRef =
          db.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
      userDocRef.update({"paymentId": docRef.id});
    } catch (e) {
      Exception(e.toString());
    }
  }

  Future<void> saveAppoinmentDataToFirebase(Map<String, String> data) async {
    final docRef = db.collection("appoinments").doc();
    await docRef.set(data);
    final userDocRef =
        db.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
    await userDocRef.update({"appoinmentId": docRef.id});
  }
}
