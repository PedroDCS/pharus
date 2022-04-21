import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import 'company_home_controller.dart';
import 'widgets/company_home_buttom_widget.dart';
import 'widgets/company_news_feed_carousel_widget.dart';

class CompanyHomePage extends StatefulWidget {
  const CompanyHomePage({
    Key? key,
    required this.email,
    required this.name,
  }) : super(key: key);
  static const titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  final String email;
  final String name;

  @override
  State<CompanyHomePage> createState() => _CompanyHomePageState();
}

class _CompanyHomePageState
    extends ModularState<CompanyHomePage, CompanyHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor800,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 26.33, bottom: 34.33),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Logo_Pharus.png',
                height: 64,
                width: 67,
                color: Colors.white,
              ),
            ),
            const Text(
              "Olá",
              textAlign: TextAlign.center,
              style: CompanyHomePage.titleStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: CompanyHomePage.titleStyle,
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
                    image: AssetImage('assets/icons/company.png'),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CompanyHomeButtomWidget(
                    iconButtom: 'assets/icons/projects.png',
                    textButtom: "Projetos",
                    functionNavigateTo: () {
                      Modular.to.pushNamed('projects', arguments: widget.email);
                    }),
                CompanyHomeButtomWidget(
                  iconButtom: 'assets/icons/profile.png',
                  textButtom: "Perfil",
                  functionNavigateTo: () {
                    Modular.to.pushNamed('profile', arguments: widget.email);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: CompanyNewsFeedCarouselWidget(
                newslist: controller.getNewsListRepository(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
