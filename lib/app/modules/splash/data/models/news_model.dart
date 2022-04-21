import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({required List<String> news, required List<String> newsLink})
      : super(news: news, newsLink: newsLink);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<String> news = [];
    List<String> newsink = [];
    json['news'].forEach((value) {
      news.add(value.toString());
    });

    json['newsLink'].forEach((value) {
      newsink.add(value.toString());
    });
    return NewsModel(
      news: news,
      newsLink: newsink,
    );
  }

  toJson() {
    return {
      "news": news,
      "newsLink": newsLink,
    };
  }
}
