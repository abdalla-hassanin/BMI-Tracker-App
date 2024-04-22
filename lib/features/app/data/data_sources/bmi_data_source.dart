import 'package:bmi_tracker_app/features/app/data/models/bmi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BMIDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = "user_bmi";

  final String _userId = FirebaseAuth.instance.currentUser!.uid;


  Future<List<BMIModel>> fetchBMIsRealTime() async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(_userId)
          .collection(_collectionName)
          .orderBy('timestamp', descending: true)
          .get();

      return snapshot.docs.map((doc) => BMIModel.fromFirestore(doc)).toList();
    } catch (error) {
      print('Error fetching BMI data: $error');
      rethrow;
    }
  }

  Future<void> addBMIModel(BMIModel bmiModel) async {
    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection(_collectionName)
          .doc(bmiModel.id)
          .set(bmiModel.toMap());
    } catch (error) {
      print('Error adding BMI model: $error');
      rethrow;
    }
  }

  Future<void> deleteBMIModel(String bmiId) async {
    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection(_collectionName)
          .doc(bmiId)
          .delete();
    } catch (error) {
      print('Error deleting BMI model: $error');
      rethrow;
    }
  }
}
