import 'package:hive/hive.dart';
import '../../data/datasources/set_rankings_datasource_interface.dart';
import '../../data/models/project_model.dart';

class SetRankingsDatasource extends ISetRankingsDatasource {
  @override
  setRankings(List<ProjectModel> rankings) async {
    var hiveProjectBox = await Hive.openBox("rankings");
    await hiveProjectBox.clear();
    if (hiveProjectBox.isEmpty) {
      for (var element in rankings) {
        await hiveProjectBox.put(element.projectId, element.toJson());
      }
    }
    hiveProjectBox.close();
  }
}
