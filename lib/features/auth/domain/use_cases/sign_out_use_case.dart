import 'package:bmi_tracker_app/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> call() async {
    try {
      await _repository.signOutUser();
    } catch (error) {
      rethrow;
    }
  }
}