import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../../domain/entities/news_entity.dart';
import '../../../../../../shared/app_colors/app_colors.dart';
import 'school_news_feed_carousel_controller.dart';

class SchoolNewsFeedCarouselWidget extends StatefulWidget {
  const SchoolNewsFeedCarouselWidget({
    Key? key,
    required this.newslist,
  }) : super(key: key);

  @override
  State<SchoolNewsFeedCarouselWidget> createState() =>
      _SchoolNewsFeedCarouselWidgetState();
  final Future<NewsEntity> newslist;
}

class _SchoolNewsFeedCarouselWidgetState
    extends State<SchoolNewsFeedCarouselWidget> {
  final SchoolNewsFeedCarouselController _controller =
      SchoolNewsFeedCarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutralColor10,
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
                      items: _controller.getNewsList(snapshot.data!),
                      carouselController: _controller.controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 150,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _controller.current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _controller
                          .getNewsList(snapshot.data!)
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              _controller.controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(
                                    _controller.current == entry.key
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
