import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({required List<String> news}) : super(news: news);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<String> news = [];
    json['news'].forEach((value) {
      news.add(value.toString());
    });
    return NewsModel(news: news);
  }

  toJson() {
    return {"news": news};
  }
}
