import 'package:bmi_tracker_app/features/auth/domain/use_cases/register_ues_case.dart';
import 'package:bmi_tracker_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:bmi_tracker_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:flutter/material.dart';
import 'package:bmi_tracker_app/features/auth/data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUseCase _registerUser;
  final SignInUseCase _signInUser;
  final SignOutUseCase _signOutUser;

  AuthProvider(this._registerUser, this._signInUser, this._signOutUser);

  Future<void> registerUser(String email, String password, String name) async {
    try {
      await _registerUser(email, password, name);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<UserModel?> signInUser(String email, String password) async {
    try {
      final user = await _signInUser(email, password);
      notifyListeners();
      return user;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signOutUser() async {
    try {
      await _signOutUser();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
