import 'package:flutter_modular/flutter_modular.dart';
import '../../../../data/repositories/project_repository.dart';
import '../../../../domain/entities/project_entity.dart';

class CompanyProjectsController {
  final _repository = ProjectRepository();

  navigateToDetails(ProjectEntity proj) {
    Modular.to.pushNamed('projectdetails', arguments: proj);
  }

  Future<List<ProjectEntity>> getProjectListRepository(
      String link, String email) async {
    return await _repository
        .getProjectList(link: link, email: email)
        .onError((error, stackTrace) => throw Error());
  }
}
