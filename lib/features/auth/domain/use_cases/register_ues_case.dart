import 'package:bmi_tracker_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase{
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<void> call(String email, String password, String name) async {
    try {
      await _repository.registerUser(email, password, name);
    } catch (error) {
      rethrow;
    }
  }
}