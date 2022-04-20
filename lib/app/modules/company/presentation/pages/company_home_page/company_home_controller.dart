import '../../../data/repositories/news_repository.dart';
import '../../../domain/entities/news_entity.dart';

class CompanyHomeController {
  final _repository = NewsRepository();

  Future<NewsEntity> getNewsListRepository() async {
    return await _repository
        .getNewsList()
        .onError((error, stackTrace) => throw Error());
  }
}
