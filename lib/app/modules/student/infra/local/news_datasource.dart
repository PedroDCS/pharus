import 'package:hive/hive.dart';

import '../../data/datasources/news_datasource_interface.dart';
import '../../data/models/news_model.dart';

class NewsDatasource extends INewsDatasource {
  @override
  Future<NewsModel> getNews() async {
    var hiveBox = await Hive.openBox("news");
    var news = await hiveBox.get("news");
    hiveBox.close();
    return NewsModel.fromJson(Map<String, dynamic>.from(news));
  }
}
