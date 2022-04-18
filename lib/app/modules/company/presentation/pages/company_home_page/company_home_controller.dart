import '../../../../../domain/entities/news_entity.dart';
import '../../../data/repositories/news_repository.dart';

class CompanyHomeController {
  final _repository = NewsRepository();

  Future<NewsEntity> getNewsListRepository(String link) async {
    return await _repository
        .getNewsList(link: link)
        .onError((error, stackTrace) => throw Error());
  }
}
