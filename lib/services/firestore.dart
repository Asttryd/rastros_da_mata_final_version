import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference plants =
      FirebaseFirestore.instance.collection('plants');

  Stream<QuerySnapshot> getPlantsStream() {
    final plantsStream = plants.orderBy('name').snapshots();

    return plantsStream;
  }
}
