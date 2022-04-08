import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'school_home_controller.dart';
import 'widgets/school_home_buttom_widget.dart';
import 'widgets/school_news_feed_carousel_widget.dart';

class SchoolHomePage extends StatefulWidget {
  const SchoolHomePage({Key? key}) : super(key: key);
  static const titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  @override
  State<SchoolHomePage> createState() => _SchoolHomePageState();
}

class _SchoolHomePageState
    extends ModularState<SchoolHomePage, SchoolHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 26.33, bottom: 34.33),
                alignment: Alignment.center,
                child: Image.asset('assets/images/pharos_icon.png',
                    height: 51.33, width: 36.56)),
            const Text(
              "Olá",
              textAlign: TextAlign.center,
              style: SchoolHomePage.titleStyle,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Escola Estadual João da Silva!",
                textAlign: TextAlign.center,
                style: SchoolHomePage.titleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/school.png'),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SchoolHomeButtomWidget(
                  iconButtom: 'assets/icons/projects.png',
                  textButtom: "Projetos",
                  function: () {
                    Modular.to.pushNamed('projects');
                  },
                ),
                SchoolHomeButtomWidget(
                  iconButtom: 'assets/icons/profile.png',
                  textButtom: "Perfil",
                  function: () {
                    Modular.to.pushNamed('profile');
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: SchoolNewsFeedCarouselWidget(
                newslist: controller.getNewsListRepository('link'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
