import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshit_flutter/src/models/User.dart';
import 'package:meta/meta.dart';

class HomeRepository extends Equatable {
  final FirebaseUser user;
  final db = Firestore.instance;

  HomeRepository({List props = const [], @required this.user}) : super(props);

  Stream<QuerySnapshot> init() {
    return db
        .collection('Users')
        .document('mayank.harsani@gmail.com')
        .collection('StoredItems')
        .snapshots();
  }
}
