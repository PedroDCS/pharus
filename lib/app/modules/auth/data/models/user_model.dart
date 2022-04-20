import '../../domain/entities/user_entity.dart';
import '../../domain/entities/user_type_enum.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String password,
    required userTypeEnum type,
  }) : super(
          name: name,
          email: email,
          password: password,
          type: type,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    userTypeEnum typ;
    switch (json['type']) {
      case 'COMPANY':
        typ = userTypeEnum.COMPANY;
        break;
      case 'SCHOOL':
        typ = userTypeEnum.SCHOOL;
        break;
      case 'STUDENT':
        typ = userTypeEnum.STUDENT;
        break;
      default:
        typ = userTypeEnum.NULL;
    }

    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      type: typ,
    );
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'type': type.toString().split('.')[1],
    };
  }
}
