import 'package:bq_app/core/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final AuthService instance = AuthService._internal();

  AuthService._internal();

  String? get uid => _auth.currentUser?.uid;

  Future<String?> login(String email, String password) async {
    var userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user?.uid;
  }

  Future<String?> signUp(
      String email, String password, UserModel userModel) async {
    var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore
        .collection("users")
        .doc(userCredential.user?.uid)
        .set(userModel.toMap());

    return userCredential.user?.uid;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<UserModel> getUser() async {
    var user = _auth.currentUser!;

    var userDocument = await _firestore.collection("users").doc(user.uid).get();
    UserModel userModel = UserModel.fromMap(userDocument.data()!);
    return userModel;
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
