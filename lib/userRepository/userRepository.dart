import 'package:freshit_flutter/src/models/User.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();
  Future<FirebaseUser> signInWithEmailAndPassword({
    @required String username,
    @required String password,
  }) async {
    try {
      FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
          email: username, password: password);
      storage.write(key: "email", value: username);
      storage.write(key: "password", value: password);
      return user;
    } catch (error) {
      throw error.message;
    }
    // await Future.delayed(Duration(seconds: 3));
    // if (username == "mayank.harsani@gmail.com" && password == "12345")
    //   return 'token';
    // throw Exception("Ïnvalid Login details");
  }

  Future<void> deleteToken() async {
    storage.deleteAll();
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> persistToken() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<bool> hasToken() async {
    String u = await storage.read(key: "email");
    String p = await storage.read(key: "password");
    print(u);
    print(p);
    if (u != null && p != null) return true;
    return false;
  }

  Future<FirebaseUser> getUserWithToken() async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: await storage.read(key: "email"),
        password: await storage.read(key: "password"));
    print(user);
    return user;
  }
}
