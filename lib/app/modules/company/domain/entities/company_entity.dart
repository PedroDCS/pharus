import '../enums/user_type_enum.dart';
import 'user_entity.dart';

class CompanyEntity extends UserEntity {
  final String avatarUrl;
  final String administeredby;
  final String position;
  final String city;
  CompanyEntity({
    required this.avatarUrl,
    required this.administeredby,
    required this.position,
    required this.city,
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
}
