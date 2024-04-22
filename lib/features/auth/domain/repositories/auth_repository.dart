import 'package:bmi_tracker_app/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> registerUser(String email, String password, String name);
  Future<UserModel?> signInUser(String email, String password);
  Future<void> signOutUser();
}