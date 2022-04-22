import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/set_rankings_repository_interface.dart';
import '../../infra/local/set_rankings_datasource.dart';
import '../models/project_model.dart';

class SetRankingsRepository extends ISetRankingsRepository {
  final SetRankingsDatasource _setrankingsDatasource = SetRankingsDatasource();

  @override
  setRankings(List<ProjectEntity> rankings) {
    List<ProjectModel> listaux = [];
    for (var element in rankings) {
      listaux.add(ProjectModel.fromEntity(element));
    }
    return _setrankingsDatasource.setRankings(listaux);
  }
}
