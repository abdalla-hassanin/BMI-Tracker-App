import '../../data/models/bmi_model.dart';
import '../repositories/bmi_repository.dart';

class AddBMIModelUseCase {
  final BMIRepository _repository;

  AddBMIModelUseCase(this._repository);

  Future<void> call(BMIModel bmiModel) async {
    try {
      await _repository.addBMIModel(bmiModel);
    } catch (error) {
      print('Error adding BMI model in use case: $error');
      rethrow;
    }
  }
}

