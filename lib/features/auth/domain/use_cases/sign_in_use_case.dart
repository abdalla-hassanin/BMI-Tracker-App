import 'package:bmi_tracker_app/features/auth/data/models/user_model.dart';
import 'package:bmi_tracker_app/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<UserModel?> call(String email, String password) async {
    try {
      return await _repository.signInUser(email, password);
    } catch (error) {
      rethrow;
    }
  }
}
