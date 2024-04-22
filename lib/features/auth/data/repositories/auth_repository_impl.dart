import 'package:bmi_tracker_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:bmi_tracker_app/features/auth/data/models/user_model.dart';
import 'package:bmi_tracker_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> registerUser(String email, String password, String name) async {
    try {
      await _dataSource.registerWithEmailPassword(email, password, name);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> signInUser(String email, String password) async {
    try {
      return await _dataSource.signInWithEmailPassword(email, password);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOutUser() async {
    try {
      await _dataSource.signOut();
    } catch (error) {
      rethrow;
    }
  }
}
