import '../models/student_model.dart';

abstract class IStudentDatasource {
  Future<StudentModel> getStudent({required String email});
}
