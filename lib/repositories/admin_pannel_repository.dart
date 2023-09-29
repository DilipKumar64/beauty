import 'dart:io';

import 'package:beauty/modals/single_service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminPannelRepository {
  final _db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance.ref();
  Future<SingleServiceModal?> getServicesDetails(
      Map<String, dynamic> data) async {
    return null;
  }

  Future<void> uploadImageToFirebase(File file) async {}
}
