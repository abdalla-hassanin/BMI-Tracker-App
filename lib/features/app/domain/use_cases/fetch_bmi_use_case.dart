import '../entities/bmi.dart';
import '../repositories/bmi_repository.dart';

class FetchBMIsUseCase {
  final BMIRepository _repository;

  FetchBMIsUseCase(this._repository);

  Future<List<BMI>> call() {
    try {
      return _repository.fetchBMIsRealTime();
    } catch (error) {
      print('Error fetching BMI data in use case: $error');
      rethrow;
    }
  }
}
