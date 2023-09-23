import 'package:cloud_firestore/cloud_firestore.dart';

class SingleServiceRepository {
  final db = FirebaseFirestore.instance;
  storePaymentJson() async {
    final docRef = db.collection('payments').doc();
    docRef.set({'data': 'hello'});
  }
}
