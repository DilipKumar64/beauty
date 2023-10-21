import 'package:firebase_auth/firebase_auth.dart';

import '../modals/appoinment_model.dart';
import '../utils/constants.dart';

class NotificationRepository {
  Future<AppoinmentModel?> fetchAppoinmentData() async {
    AppoinmentModel? appoinmentModel;
    final data = await firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (data.exists) {
      final appoinmentId = data.data()?["appoinmentId"];
      if (appoinmentId != null) {
        final appoinmentData = await firebaseFirestore
            .collection('appoinments')
            .doc(appoinmentId)
            .get();
        if (appoinmentData.exists) {
          appoinmentModel = AppoinmentModel.fromJson(appoinmentData.data()!);
        }
      }
    }
    return appoinmentModel;
  }
}
