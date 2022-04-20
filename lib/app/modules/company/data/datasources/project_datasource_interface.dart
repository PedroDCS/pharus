import '../models/project_model.dart';

abstract class IProjectsDatasource {
  Future<List<ProjectModel>> getProjects(
      {required String link, required String email});
}
