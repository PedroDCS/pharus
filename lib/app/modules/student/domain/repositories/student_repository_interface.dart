import '../entities/student_entity.dart';

abstract class IStudentRepository {
  Future<StudentEntity> getStudent({required String email});
}
