import '../entities/news_entity.dart';

abstract class INewsRepository {
  Future<NewsEntity> getNewsList({required String link});
}
