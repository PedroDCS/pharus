import '../../../data/repositories/news_repository.dart';
import '../../../domain/entities/news_entity.dart';

class StudentHomeController {
  final _repository = NewsRepository();

  Future<NewsEntity> getNewsListRepository(String link) async {
    return await _repository
        .getNewsList(link: link)
        .onError((error, stackTrace) => throw Error());
  }
}
