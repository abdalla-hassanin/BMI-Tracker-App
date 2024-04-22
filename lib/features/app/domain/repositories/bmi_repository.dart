import 'package:bmi_tracker_app/features/app/data/models/bmi_model.dart';
import 'package:bmi_tracker_app/features/app/domain/entities/bmi.dart';

abstract class BMIRepository {
  Future<List<BMI>> fetchBMIsRealTime();
  Future<void> addBMIModel(BMIModel bmi);
  Future<void> deleteBMIModel(String bmiId);
}
