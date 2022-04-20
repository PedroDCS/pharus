import '../enums/user_type_enum.dart';

class UserEntity {
  final String name;
  final String email;
  final String password;
  final userTypeEnum type;
  UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.type,
  });
}
