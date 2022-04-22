import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/entities/news_entity.dart';

class SchoolNewsFeedCarouselController {
  int current = 0;
  final CarouselController controller = CarouselController();

  gotopage(link) async {
    if (await canLaunch(link)) {
      await launch(
        link,
        forceWebView: false,
        forceSafariVC: false,
        enableJavaScript: true,
      );
    } else {}
  }

  List<Widget> getNewsList(NewsEntity newslist) {
    List<String> linkList = [];
    for (var element in newslist.newsLink) {
      linkList.add(element);
    }
    List<Widget> newsList = newslist.news
        .map(
          (item) => Container(
            width: double.infinity,
            color: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => gotopage(linkList[current]),
              child: Text(
                item.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        )
        .toList();

    return newsList;
  }
}
