import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../domain/entities/news_entity.dart';
import '../controllers/company_news_feed_carousel_controller.dart';

class CompanyNewsFeedCarouselWidget extends StatefulWidget {
  const CompanyNewsFeedCarouselWidget({
    Key? key,
    required this.newslist,
  }) : super(key: key);

  @override
  State<CompanyNewsFeedCarouselWidget> createState() =>
      _CompanyNewsFeedCarouselWidgetState();
  final Future<NewsEntity> newslist;
}

class _CompanyNewsFeedCarouselWidgetState extends ModularState<
    CompanyNewsFeedCarouselWidget, CompanyNewsFeedCarouselController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFC8C8C8),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 27, 0, 20),
      child: Column(children: [
        const Text(
          "Feed de notícias",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        FutureBuilder<NewsEntity>(
            future: widget.newslist,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                case ConnectionState.none:
                  return const LinearProgressIndicator(
                    value: 1,
                    color: Colors.red,
                  );
                default:
                  return Column(children: [
                    CarouselSlider(
                      items: controller.getNewsList(snapshot.data!),
                      carouselController: controller.controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 150,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              controller.current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller
                          .getNewsList(snapshot.data!)
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              controller.controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(
                                    controller.current == entry.key
                                        ? 0.9
                                        : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ]);
              }
            }),
      ]),
    );
  }
}
