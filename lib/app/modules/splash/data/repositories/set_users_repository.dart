import '../../domain/entities/company_entity.dart';
import '../../domain/entities/school_entity.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/set_users_repository_interface.dart';
import '../../infra/local/set_users_datasource.dart';
import '../models/company_model.dart';
import '../models/school_model.dart';
import '../models/student_model.dart';

class SetUsersRepository extends ISetUsersRepository {
  final SetUsersDatasource _setUsersDatasource = SetUsersDatasource();

  @override
  setCompanies(List<CompanyEntity> companies) {
    List<CompanyModel> listaux = [];
    for (var element in companies) {
      listaux.add(CompanyModel.fromEntity(element));
    }
    return _setUsersDatasource.setCompanies(listaux);
  }

  @override
  setSchools(List<SchoolEntity> schools) {
    List<SchoolModel> listaux = [];
    for (var element in schools) {
      listaux.add(SchoolModel.fromEntity(element));
    }
    return _setUsersDatasource.setSchools(listaux);
  }

  @override
  setStudents(List<StudentEntity> students) {
    List<StudentModel> listaux = [];
    for (var element in students) {
      listaux.add(StudentModel.fromEntity(element));
    }
    return _setUsersDatasource.setStudents(listaux);
  }
}
