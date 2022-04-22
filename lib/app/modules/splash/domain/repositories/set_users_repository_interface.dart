import '../entities/company_entity.dart';
import '../entities/school_entity.dart';
import '../entities/student_entity.dart';

abstract class ISetUsersRepository {
  setStudents(List<StudentEntity> students);
  setSchools(List<SchoolEntity> schools);
  setCompanies(List<CompanyEntity> companies);
}
