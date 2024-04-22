import 'package:bmi_tracker_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerWithEmailPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      UserModel user = UserModel(
        id: userId,
        name: name,
        email: email,
      );

      await _firestore.collection('users').doc(userId).set(user.toMap());
    } catch (error) {
      print('Error registering user: $error');
      rethrow;
    }
  }

  Future<UserModel?> getUserData(String userId) async {
    try {
      DocumentSnapshot userData =
          await _firestore.collection('users').doc(userId).get();
      if (userData.exists) {
        return UserModel.fromFirestore(userData.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (error) {
      print('Error retrieving user data: $error');
      rethrow;
    }
  }

  Future<UserModel?> signInWithEmailPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = _auth.currentUser;

      if (user != null) {
        return await getUserData(user.uid);
      } else {
        return null;
      }
    } catch (error) {
      print('Error signing in: $error');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print('Error signing out: $error');
      rethrow;
    }
  }
}
