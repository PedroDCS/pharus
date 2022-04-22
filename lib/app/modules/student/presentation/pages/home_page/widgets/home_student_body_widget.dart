import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/entities/notify_entity.dart';
import '../../../../domain/entities/student_entity.dart';
import '../student_home_controller.dart';
import 'student_news_feed_carousel_widget.dart';

class HomeStudentBodyWidget extends StatefulWidget {
  const HomeStudentBodyWidget({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
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
          FutureBuilder<StudentEntity>(
            future: controller.getProfifeData(widget.name),
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
                  return Column(
                    children: [
                      Text(
                        "Olá ${snapshot.data!.name}!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 49),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(snapshot.data!.avatarCircle),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
          FutureBuilder<List<NotifyEntity>>(
              future: controller.getNotifyListRepository("link"),
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
                    return Container(
                      padding: const EdgeInsets.only(left: 0),
                      height: 200.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (_, index) {
                            var notify = snapshot.data![index];
                            return HomeButtom(
                              iconButtom: controller.getIcon(notify.type),
                              textButtom: notify.notify,
                              colorButtom: controller.getColor(
                                  notify.type, Theme.of(context)),
                            );
                          }),
                    );
                }
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 49, 16, 45),
            child: StudentNewsFeedCarouselWidget(
                newslist: controller.getNewsListRepository(),
                goToLauch: () async {
                  if (await canLaunch(
                      'https://www.unicef.org/brazil/comunicados-de-imprensa/unicef-lanca-segunda-edicao-do-tmjunicef-programa-de-voluntariado-digital')) {
                    await launch(
                        'https://www.unicef.org/brazil/comunicados-de-imprensa/unicef-lanca-segunda-edicao-do-tmjunicef-programa-de-voluntariado-digital',
                        forceWebView: false,
                        forceSafariVC: false,
                        enableJavaScript: true);
                  } else {}
                }),
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
    required this.colorButtom,
  }) : super(key: key);
  final String iconButtom;
  final String textButtom;
  final Color colorButtom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(
              MediaQuery.of(context).size.width * 0.35,
            ),
            minimumSize: const Size.square(130),
            primary: colorButtom,
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
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              )
            ],
          )),
    );
  }
}
