import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../domain/entities/project_entity.dart';
import '../../../../data/repositories/project_repository.dart';

class ProjectsController {
  final _repository = ProjectRepository();

  navigateToDetails(ProjectEntity proj) {
    Modular.to.pushNamed('projectdetails', arguments: proj);
  }

  Future<List<ProjectEntity>> getProjectListRepository(String link) async {
    return await _repository
        .getProjectList(link: link)
        .onError((error, stackTrace) => throw Error());
  }
}
