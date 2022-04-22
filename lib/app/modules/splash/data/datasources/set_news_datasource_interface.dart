import '../models/news_model.dart';

abstract class ISetNewsDatasource {
  setNews(NewsModel news);
}
