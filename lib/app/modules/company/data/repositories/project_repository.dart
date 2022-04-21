import 'dart:async';

import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository_interface.dart';
import '../../infra/local/projects_datasource.dart';

class ProjectRepository extends IProjectRepository {
  final ProjectDatasource _projectDatasource = ProjectDatasource();
  @override
  Future<List<ProjectEntity>> getProjectList(
      {required String link, required String email}) async {
    return _projectDatasource.getProjects(link: link, email: email);
  }
}
