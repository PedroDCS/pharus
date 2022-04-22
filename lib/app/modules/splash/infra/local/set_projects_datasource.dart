import 'package:hive/hive.dart';
import '../../data/datasources/set_projects_datasource_interface.dart';
import '../../data/models/project_model.dart';

class SetProjectsDatasource extends ISetProjectsDatasource {
  @override
  setProjects(List<ProjectModel> projects) async {
    var hiveProjectBox = await Hive.openBox("projects");
    await hiveProjectBox.clear();
    if (hiveProjectBox.isEmpty) {
      for (var element in projects) {
        await hiveProjectBox.put(element.projectId, element.toJson());
      }
    }
    hiveProjectBox.close();
  }
}
