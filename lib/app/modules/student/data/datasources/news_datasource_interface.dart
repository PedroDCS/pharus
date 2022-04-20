import '../models/news_model.dart';

abstract class INewsDatasource {
  Future<NewsModel> getNews();
}
