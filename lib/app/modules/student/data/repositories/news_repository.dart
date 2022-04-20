import 'dart:async';

import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/news_repository_interface.dart';
import '../../infra/local/news_datasource.dart';

class NewsRepository extends INewsRepository {
  final NewsDatasource _newsDatasource = NewsDatasource();
  @override
  Future<NewsEntity> getNewsList() async {
    return _newsDatasource.getNews();
  }
}
