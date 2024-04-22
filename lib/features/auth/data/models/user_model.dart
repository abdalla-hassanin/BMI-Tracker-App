import 'package:bmi_tracker_app/features/auth/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required super.id,
    required super.name,
    required super.email,

});

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'] ,
      email: data['email'] ,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }


}