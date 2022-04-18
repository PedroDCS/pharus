import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../../domain/entities/news_entity.dart';

class CompanyNewsFeedCarouselController {
  int current = 0;
  final CarouselController controller = CarouselController();

  List<Widget> getNewsList(NewsEntity newslist) {
    List<Widget> newsList = newslist.news
        .map(
          (item) => Container(
            width: double.infinity,
            color: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            alignment: Alignment.center,
            child: Text(
              item.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
        .toList();

    return newsList;
  }
}
