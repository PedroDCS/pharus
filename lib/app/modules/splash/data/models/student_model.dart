import '../../domain/entities/student_entity.dart';
import '../../domain/enums/user_type_enum.dart';

class StudentModel extends StudentEntity {
  StudentModel(
      {required String name,
      required String email,
      required String password,
      required userTypeEnum type,
      required DateTime birthDate,
      required String gender,
      required String registration,
      required String shift,
      required String schoolYear,
      required String schoolName,
      required String schoolId,
      required String studentClass,
      required String city,
      required String avatar,
      required String avatarCircle,
      List<String>? projectsIDs,
      List<String>? rankingsIDs})
      : super(
            name: name,
            email: email,
            password: password,
            type: type,
            birthDate: birthDate,
            gender: gender,
            registration: registration,
            shift: shift,
            schoolYear: schoolYear,
            schoolName: schoolName,
            schoolId: schoolId,
            studentClass: studentClass,
            city: city,
            avatar: avatar,
            avatarCircle: avatarCircle,
            projectsIDs: projectsIDs,
            rankingsIDs: rankingsIDs);

  factory StudentModel.fromJson(Map<String, dynamic> json) {
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
        typ = userTypeEnum.STUDENT;
    }

    return StudentModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      city: json['city'],
      type: typ,
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
      registration: json['registration'],
      shift: json['shift'],
      schoolYear: json['schoolYear'],
      schoolName: json['schoolName'],
      schoolId: json['schoolId'],
      studentClass: json['studentClass'],
      avatar: json['avatar'],
      avatarCircle: json['avatarCircle'],
    );
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'type': type.toString().split('.')[1],
      'birthDate': birthDate.toString(),
      'gender': gender,
      'city': city,
      'registration': registration,
      'shift': shift,
      'schoolYear': schoolYear,
      'schoolName': schoolName,
      'schoolId': schoolId,
      'studentClass': studentClass,
      'avatar': avatar,
      'avatarCircle': avatarCircle,
    };
  }
}
