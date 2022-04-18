import 'dart:async';
import 'package:hive/hive.dart';

import '../../../../data/models/news_model.dart';
import '../../../../domain/entities/news_entity.dart';
import '../../domain/repositories/news_repository_interface.dart';

class NewsRepository extends INewsRepository {
  //final Dio _dio = Dio();

  @override
  Future<NewsEntity> getNewsList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);
    //throw UnimplementedError();
    await Future.delayed(const Duration(seconds: 1));
    var hiveBox = await Hive.openBox("news");
    var news = await hiveBox.get("news");
    hiveBox.close();
    return NewsModel.fromJson(Map<String, dynamic>.from(news));
  }
}
