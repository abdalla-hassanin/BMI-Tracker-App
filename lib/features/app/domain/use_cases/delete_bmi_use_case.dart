import '../repositories/bmi_repository.dart';

class DeleteBMIModelUseCase {
  final BMIRepository _repository;

  DeleteBMIModelUseCase(this._repository);


  Future<void> call(String bmiId) async {
    try {
      await _repository.deleteBMIModel(bmiId);
    } catch (error) {
      print('Error deleting BMI entry: $error');
      rethrow;
    }
  }
}

