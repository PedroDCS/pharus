import '../entities/project_entity.dart';

abstract class ISetProjectsRepository {
  setProjects(List<ProjectEntity> projects);
}
