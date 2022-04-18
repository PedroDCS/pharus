import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../domain/entities/project_entity.dart';
import '../../../../data/repositories/project_repository.dart';

class CompanyProjectsController {
  final _repository = ProjectRepository();

  navigateToDetails(ProjectEntity proj) {
    Modular.to.pushNamed('projectdetails', arguments: proj);
  }

  Future<List<ProjectEntity>> getProjectListRepository(
      String link, String email) async {
    List<ProjectEntity> lista = await _repository
        .getProjectList(link: link)
        .onError((error, stackTrace) => throw Error());
    List<ProjectEntity> listaux = [];

    for (var element in lista) {
      if (element.companyID.toString().compareTo(email) == 0) {
        listaux.add(element);
      }
    }
    return listaux;
  }
}
