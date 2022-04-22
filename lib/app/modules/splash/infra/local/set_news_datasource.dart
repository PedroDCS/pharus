import 'package:hive/hive.dart';
import '../../data/datasources/set_news_datasource_interface.dart';
import '../../data/models/news_model.dart';

class SetNewsDatasource extends ISetNewsDatasource {
  @override
  setNews(NewsModel news) async {
    var hiveNewsBox = await Hive.openBox("news");
    await hiveNewsBox.clear();
    if (hiveNewsBox.isEmpty) {
      await hiveNewsBox.put('news', news.toJson());
    }
    hiveNewsBox.close();
  }
}
