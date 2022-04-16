import 'school_entity.dart';

class StudentEntity {
  final String name;
  final String birthDate;
  final String gender;
  final String registration;
  final String phone;
  final String shift;
  final String schoolYear;
  final String studentClass;
  final String avatarUrl;

  final SchoolEntity school;
// escola

  StudentEntity(
    this.name,
    this.birthDate,
    this.gender,
    this.registration,
    this.phone,
    this.shift,
    this.schoolYear,
    this.studentClass,
    this.avatarUrl,
    this.school,
  );
}
