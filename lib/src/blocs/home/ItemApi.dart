import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freshit_flutter/Item.dart';

class ItemAPI extends Equatable {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> getAllUsers() {
    return _firestore.collection('Users').snapshots();
  }

  Stream<QuerySnapshot> getStoredItemForUser(String id) {
    return _firestore.collection('Users/${id}/StoredItems').snapshots();
  }

  Future<String> createNewStoredItem() {
    _firestore
        .collection('Users')
        .document("rlOv6CVw7IiWb8Hn09r5")
        .collection('StoredItems')
        .add({
      "test": "123",
    });
  }
}
