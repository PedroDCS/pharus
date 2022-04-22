import '../entities/project_entity.dart';

abstract class IProjectRepository {
  Future<List<ProjectEntity>> getProjectList({required String link});
  Future<void> subscribeProjects(
      {required String email, required ProjectEntity project});
}
