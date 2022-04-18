import '../../../../../../domain/entities/project_entity.dart';

abstract class IProjectRepository {
  Future<List<ProjectEntity>> getProjectList({required String link});
}
