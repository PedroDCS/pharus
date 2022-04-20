import 'package:hive/hive.dart';

import '../../data/datasources/project_datasource_interface.dart';
import '../../data/models/project_model.dart';

class ProjectDatasource extends IProjectsDatasource {
  @override
  Future<List<ProjectModel>> getProjects(
      {required String link, required String email}) async {
    await Future.delayed(const Duration(seconds: 1));
    var hiveProjectssBox = await Hive.openBox(link);
    var hiveprojects = hiveProjectssBox.toMap();
    List<ProjectModel> auxList = [];
    hiveprojects.forEach((key, value) {
      auxList.add(ProjectModel.fromJson(Map<String, dynamic>.from(value)));
    });
    hiveProjectssBox.close();
    List<ProjectModel> listaux = [];

    for (var element in auxList) {
      if (element.companyID.toString().compareTo(email) == 0) {
        listaux.add(element);
      }
    }
    return listaux;
    // return auxList;
  }
}
