import 'dart:async';

import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository_interface.dart';
import '../../infra/local/projects_datasource.dart';
import '../models/project_model.dart';

class ProjectRepository extends IProjectRepository {
  final ProjectDatasource _projectDatasource = ProjectDatasource();
  @override
  Future<List<ProjectEntity>> getProjectList({required String link}) async {
    return _projectDatasource.getProjects(link: link);
  }

  @override
  Future<void> subscribeProjects(
      {required String email, required ProjectEntity project}) {
    return _projectDatasource.subscribeProjects(
        email: email, project: ProjectModel.fromEntity(project));
  }
}
