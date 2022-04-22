import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/set_projects_repository_interface.dart';
import '../../infra/local/set_projects_datasource.dart';
import '../models/project_model.dart';

class SetProjectsRepository extends ISetProjectsRepository {
  final SetProjectsDatasource _setprojectsDatasource = SetProjectsDatasource();

  @override
  setProjects(List<ProjectEntity> projects) {
    List<ProjectModel> listaux = [];
    for (var element in projects) {
      listaux.add(ProjectModel.fromEntity(element));
    }
    return _setprojectsDatasource.setProjects(listaux);
  }
}
