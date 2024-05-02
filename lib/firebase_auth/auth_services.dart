import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> signInWithEmailPassword(
      String email, dynamic password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'email': email});

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<String> signUpWithEmailPassword({
    required String email,
    required var password,
    required String username,
    required String bio,
  }) async {
    String res = 'some error occoured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _firestore.collection('Users').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'email': email,
          'password': password,
          'username': username,
          'bio': bio,
          'followers': [],
          'following': [],
        });

      res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future signOut() async {
    _auth.signOut();
  }
}
