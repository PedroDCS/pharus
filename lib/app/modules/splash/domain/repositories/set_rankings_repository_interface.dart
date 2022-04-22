import '../entities/project_entity.dart';

abstract class ISetRankingsRepository {
  setRankings(List<ProjectEntity> rankings);
}
