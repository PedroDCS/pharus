import 'dart:async';
import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/news_repository_interface.dart';

class NewsRepository extends INewsRepository {
  //final Dio _dio = Dio();

  @override
  Future<NewsEntity> getNewsList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);
    //throw UnimplementedError();
    await Future.delayed(const Duration(seconds: 1));
    return NewsEntity(news: [
      'A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ',
      'A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ',
      'A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!',
    ]);
  }
}
