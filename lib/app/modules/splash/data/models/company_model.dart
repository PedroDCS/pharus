import '../../domain/entities/company_entity.dart';
import '../../domain/enums/user_type_enum.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required String avatarUrl,
    required String administeredby,
    required String position,
    required String city,
    required String name,
    required String email,
    required String password,
    required userTypeEnum type,
  }) : super(
          avatarUrl: avatarUrl,
          administeredby: administeredby,
          position: position,
          city: city,
          name: name,
          email: email,
          password: password,
          type: type,
        );
  factory CompanyModel.fromEntity(CompanyEntity company) {
    return CompanyModel(
        name: company.name,
        administeredby: company.administeredby,
        avatarUrl: company.avatarUrl,
        city: company.city,
        email: company.email,
        password: company.password,
        position: company.position,
        type: company.type);
  }
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
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
        typ = userTypeEnum.COMPANY;
    }

    return CompanyModel(
      avatarUrl: json['avatarUrl'],
      administeredby: json['administeredby'],
      position: json['position'],
      city: json['city'],
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
      'avatarUrl': avatarUrl,
      'administeredby': administeredby,
      'position': position,
      'city': city,
    };
  }
}
