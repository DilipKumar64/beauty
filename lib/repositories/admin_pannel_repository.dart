import 'dart:io';

import 'package:beauty/modals/single_service_model.dart';
import 'package:beauty/utils/custom_exception.dart';
import 'package:uuid/uuid.dart';

import '../utils/constants.dart';

class AdminPannelRepository {
  Future<SingleServiceModal?> uploadServicesDetails(
      Map<String, dynamic> data) async {
    try {
      final docRef = firebaseFirestore.collection('services').doc(data['name']);
      await docRef.set(data);
      return SingleServiceModal.fromJson(data);
    } catch (e) {
      throw CustomException(
          message: 'Error in upoloading servce details: ${e.toString()}');
    }
  }

  Future<String?> uploadImageToFirebase(File file) async {
    String imageName = const Uuid().v1();
    final doc = firebaseStorage.child('/serviceImages/$imageName.jpeg');
    try {
      await doc.putFile(file);
      String downLoadUrl = await doc.getDownloadURL();
      return downLoadUrl;
    } catch (e) {
      Exception(e.toString());
      return null;
    }
  }
}
