import 'package:hive/hive.dart';

import '../../data/datasources/set_users_datasource_interface.dart';
import '../../data/models/company_model.dart';
import '../../data/models/school_model.dart';
import '../../data/models/student_model.dart';

class SetUsersDatasource extends ISetUsersDatasource {
  @override
  setCompanies(List<CompanyModel> companies) async {
    var hiveUsersBox = await Hive.openBox("users");
    for (var element in companies) {
      if (!hiveUsersBox.containsKey(element.email)) {
        await hiveUsersBox.put(element.email, element.toJson());
      }
    }
  }

  @override
  setSchools(List<SchoolModel> schools) async {
    var hiveUsersBox = await Hive.openBox("users");
    for (var element in schools) {
      if (!hiveUsersBox.containsKey(element.email)) {
        await hiveUsersBox.put(element.email, element.toJson());
      }
    }
  }

  @override
  setStudents(List<StudentModel> students) async {
    var hiveUsersBox = await Hive.openBox("users");
    for (var element in students) {
      if (!hiveUsersBox.containsKey(element.email)) {
        await hiveUsersBox.put(element.email, element.toJson());
      }
    }
  }
}
