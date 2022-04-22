import '../models/project_model.dart';

abstract class ISetRankingsDatasource {
  setRankings(List<ProjectModel> rankings);
}
