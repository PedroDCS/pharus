import 'dart:async';

import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/student_repository_interface.dart';
import '../../infra/local/student_datasource.dart';

class StudentRepository extends IStudentRepository {
  final StudentDatasource _studentDatasource = StudentDatasource();

  @override
  Future<StudentEntity> getStudent({required String email}) {
    return _studentDatasource.getStudent(email: email);
  }
}
