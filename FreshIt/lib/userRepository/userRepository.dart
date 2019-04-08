import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    try {
      FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
          email: username, password: password);
      return user.getIdToken();
    } catch (error) {
      throw error.message;
    }
    // await Future.delayed(Duration(seconds: 3));
    // if (username == "mayank.harsani@gmail.com" && password == "12345")
    //   return 'token';
    // throw Exception("Ïnvalid Login details");
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> persistToken() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
