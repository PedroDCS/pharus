import '../models/company_model.dart';
import '../models/school_model.dart';
import '../models/student_model.dart';

abstract class ISetUsersDatasource {
  setStudents(List<StudentModel> students);
  setSchools(List<SchoolModel> schools);
  setCompanies(List<CompanyModel> companies);
}
