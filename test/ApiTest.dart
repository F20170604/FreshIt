import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Firestore db = Firestore.instance;
  test("test FireStore", () async {
    await db
        .collection('Users')
        .document('rlOv6CVw7IiWb8Hn09r5')
        .updateData({'email': "suman.harsani@gmail.com"}).catchError(
            (onError) => print(onError));
  });
}
