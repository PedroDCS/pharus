import '../models/project_model.dart';

abstract class ISetProjectsDatasource {
  setProjects(List<ProjectModel> projects);
}
