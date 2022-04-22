import '../../domain/entities/school_entity.dart';
import '../../domain/enums/user_type_enum.dart';

class SchoolModel extends SchoolEntity {
  SchoolModel({
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
  factory SchoolModel.fromEntity(SchoolEntity school) {
    return SchoolModel(
        name: school.name,
        administeredby: school.administeredby,
        avatarUrl: school.avatarUrl,
        city: school.city,
        email: school.email,
        password: school.password,
        position: school.position,
        type: school.type);
  }
  factory SchoolModel.fromJson(Map<String, dynamic> json) {
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
        typ = userTypeEnum.SCHOOL;
    }

    return SchoolModel(
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
