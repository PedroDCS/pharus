import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../student_home_controller.dart';
import 'student_news_feed_carousel_widget.dart';

class HomeStudentBodyWidget extends StatefulWidget {
  const HomeStudentBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeStudentBodyWidget> createState() => _HomeStudentBodyWidgetState();
}

class _HomeStudentBodyWidgetState
    extends ModularState<HomeStudentBodyWidget, StudentHomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            "Olá Antonia!",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 49),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/girl happy drinking coffe flat illustration 2.png'),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 0),
            height: 200.0,
            child: ListView(
              // This next line does the trick.
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              children: const <Widget>[
                HomeButtom(
                  iconButtom: 'assets/icons/projects.png',
                  textButtom: "O projeto 1 termina em 8 dias!",
                ),
                HomeButtom(
                  iconButtom: 'assets/images/medal.png',
                  textButtom:
                      "O projeto ”Introdução a Robótica” te deu uma medalha!",
                ),
                HomeButtom(
                  iconButtom: 'assets/icons/projects.png',
                  textButtom: "Conheça a nova empresa parceira",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 49, 16, 45),
            child: StudentNewsFeedCarouselWidget(
              newslist: controller.getNewsListRepository("link"),
            ),
          )
        ],
      ),
    );
  }
}

class HomeButtom extends StatelessWidget {
  const HomeButtom({
    Key? key,
    required this.iconButtom,
    required this.textButtom,
  }) : super(key: key);
  final String iconButtom;
  final String textButtom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(127),
            minimumSize: const Size.square(130),
            primary: const Color(0xFFC3C3C3),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 31),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                AssetImage(iconButtom),
                size: 48,
                color: Colors.black,
              ),
              Text(
                textButtom,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )
            ],
          )),
    );
  }
}
