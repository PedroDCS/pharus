import 'package:hive/hive.dart';

import '../enums/user_type_enum.dart';
import 'project_entity.dart';
import 'user_entity.dart';

@HiveType(typeId: 1)
class StudentEntity extends UserEntity {
  final DateTime birthDate;
  final String gender;
  final String registration;
  final String shift;
  final String schoolYear;
  final String schoolName;
  final String schoolId;
  final String studentClass;
  final String city;
  final String avatar;
  final String avatarCircle;
  final List<ProjectEntity>? projectsIDs;
  final List<ProjectEntity>? rankingsIDs;
  StudentEntity({
    required String name,
    required String email,
    required String password,
    required userTypeEnum type,
    required this.birthDate,
    required this.gender,
    required this.registration,
    required this.shift,
    required this.schoolYear,
    required this.schoolName,
    required this.schoolId,
    required this.studentClass,
    required this.city,
    required this.avatar,
    required this.avatarCircle,
    this.projectsIDs,
    this.rankingsIDs,
  }) : super(
          name: name,
          email: email,
          password: password,
          type: type,
        );
}
