import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/entities/news_entity.dart';

class CompanyNewsFeedCarouselController {
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
    }
  }

  List<Widget> getNewsList(NewsEntity newslist) {
    List<String> linkList = [];
    for (var element in newslist.newsLink) {
      linkList.add(element);
    }
    List<Widget> newsList;

    try {
      newsList = newslist.news
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
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
          .toList();
    } catch (e) {
      newsList = [
        Container(
          width: double.infinity,
          color: Colors.transparent,
          margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () => gotopage(linkList[current]),
            child: Text(
              "Error",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ];
    }

    return newsList;
  }
}
