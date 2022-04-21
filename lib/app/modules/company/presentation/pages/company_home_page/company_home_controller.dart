import '../../../data/repositories/news_repository.dart';
import '../../../domain/entities/news_entity.dart';

class CompanyHomeController {
  final _repository = NewsRepository();

  Future<NewsEntity> getNewsListRepository() async {
    var news;
    try {
      news = await _repository
          .getNewsList()
          .onError((error, stackTrace) => throw Error());
    } catch (e) {
      return NewsEntity(
          news: ["Erro ao buscar noticias"], newsLink: ['newsLink']);
    }

    return news;
  }
}
