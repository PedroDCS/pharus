import 'package:hive/hive.dart';

import '../../data/datasources/student_datasource_interface.dart';
import '../../data/models/student_model.dart';

class StudentDatasource extends IStudentDatasource {
  @override
  Future<StudentModel> getStudent({required String email}) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    await profilesBox.close();
    return StudentModel.fromJson(Map<String, dynamic>.from(profile));
  }
}
