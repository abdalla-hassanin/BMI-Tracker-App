import 'package:bmi_tracker_app/features/app/domain/entities/bmi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BMIModel extends BMI {
  BMIModel({
    required super.id,
    required super.height,
    required super.weight,
    required super.bmi,
    required super.status,
    required super.timestamp,
  });

  factory BMIModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return BMIModel(
      id: data['id'],
      weight: data['weight'],
      height: data['height'],
      bmi: data['bmi'],
      status: data['status'],
      timestamp: data['timestamp'].toDate(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'status': status,
      'timestamp': timestamp,
    };
  }
}
