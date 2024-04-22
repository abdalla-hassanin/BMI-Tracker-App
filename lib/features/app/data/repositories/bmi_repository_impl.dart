import 'package:bmi_tracker_app/features/app/data/data_sources/bmi_data_source.dart';
import 'package:bmi_tracker_app/features/app/data/models/bmi_model.dart';

import '../../domain/entities/bmi.dart';
import '../../domain/repositories/bmi_repository.dart';

class BMIRepositoryImpl implements BMIRepository {
  final BMIDataSource bmiDataSource;

  BMIRepositoryImpl(this.bmiDataSource);

  @override
  Future<void> addBMIModel(BMIModel bmi) async {
    try {
      await bmiDataSource.addBMIModel(bmi);
    } catch (error) {
      print('Error adding BMI model to repository: $error');
      rethrow;
    }
  }

  @override
  Future<List<BMI>> fetchBMIsRealTime() {
    try {
      return bmiDataSource.fetchBMIsRealTime();
    } catch (error) {
      print('Error fetching BMI data from repository: $error');
      rethrow;
    }
  }
  @override
  Future<void> deleteBMIModel(String bmiId) async {
    try {
      await bmiDataSource.deleteBMIModel(bmiId);
    } catch (error) {
      print('Error deleting BMI model in repository: $error');
      rethrow;
    }
  }

}


