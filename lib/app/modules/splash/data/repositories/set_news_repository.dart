import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/set_news_repository_interface.dart';
import '../../infra/local/set_news_datasource.dart';
import '../models/news_model.dart';

class SetNewsRepository extends ISetNewsRepository {
  final SetNewsDatasource _setprojectsDatasource = SetNewsDatasource();

  @override
  setNews(NewsEntity news) {
    return _setprojectsDatasource.setNews(NewsModel.fromEntity(news));
  }
}
