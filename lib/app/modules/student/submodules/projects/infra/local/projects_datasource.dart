import 'package:hive/hive.dart';

import '../../data/datasources/project_datasource_interface.dart';
import '../../data/models/project_model.dart';

class ProjectDatasource extends IProjectsDatasource {
  @override
  Future<List<ProjectModel>> getProjects({required String link}) async {
    await Future.delayed(const Duration(seconds: 1));
    var hiveProjectssBox = await Hive.openBox(link);
    var hiveprojects = hiveProjectssBox.toMap();
    List<ProjectModel> auxList = [];
    hiveprojects.forEach((key, value) {
      auxList.add(ProjectModel.fromJson(Map<String, dynamic>.from(value)));
    });
    hiveProjectssBox.close();

    return auxList;
  }

  @override
  Future<void> subscribeProjects(
      {required String email, required ProjectModel project}) async {
    var hiveProjectssBox = await Hive.openBox("projects");
    project.students.add(email);
    hiveProjectssBox.put(project.projectId, project.toJson());
    hiveProjectssBox.close();
  }
}
