import 'package:bmi_tracker_app/features/app/data/models/bmi_model.dart';
import 'package:bmi_tracker_app/features/app/domain/entities/bmi.dart';
import 'package:bmi_tracker_app/features/app/domain/use_cases/delete_bmi_use_case.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../domain/use_cases/add_bmi_use_case.dart';
import '../../domain/use_cases/fetch_bmi_use_case.dart';

class HomeProvider with ChangeNotifier {
  int _height = 150;
  int _weight = 50;
  final AddBMIModelUseCase _addBMIModelUseCase;
  final FetchBMIsUseCase _fetchBMIsUseCase;
  final DeleteBMIModelUseCase _deleteBMIModelUseCase;

  HomeProvider(this._addBMIModelUseCase,
      this._fetchBMIsUseCase,
      this._deleteBMIModelUseCase,);

  // Getters for height, weight, and BMI history
  int get height => _height;

  int get weight => _weight;

  set height(int value) {
    _height = value;
    notifyListeners();
  }

  set weight(int value) {
    _weight = value;
    notifyListeners();
  }

  double calculateBMI() {
    // Calculate BMI
    double heightInMeters = _height / 100;
    double bmi = _weight / (heightInMeters * heightInMeters);

    // Create a new BMI entry
    BMIModel bmiModel = BMIModel(
      id: const Uuid().v4(),
      weight: _weight.toDouble(),
      height: _height.toDouble(),
      bmi: bmi,
      status: _getBmiStatus(bmi),
      timestamp: DateTime.now(),
    );

    addBMIModel(bmiModel);
    return bmi;
  }

  String _getBmiStatus(double bmi) {
    if (bmi > 30) {
      return 'Obese';
    } else if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  Future<List<BMI>> fetchBMIHistory() {
    try {
      return _fetchBMIsUseCase();
    } catch (error) {
      print('Error fetching BMI history: $error');
      rethrow;
    }
  }

  Future<void> addBMIModel(BMIModel bmiModel) async {
    try {
      await _addBMIModelUseCase(bmiModel);
      fetchBMIHistory();
      notifyListeners();
    } catch (error) {
      print('Error adding BMI entry: $error');
      rethrow;
    }
  }

  Future<void> deleteBMIModel(String bmiId) async {
    try {
      await _deleteBMIModelUseCase(bmiId);
      fetchBMIHistory();
      notifyListeners();
    } catch (error) {
      print('Error deleting BMI entry: $error');
      rethrow;
    }
  }


}