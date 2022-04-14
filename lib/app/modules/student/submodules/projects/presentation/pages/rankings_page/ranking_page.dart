import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../../presentation/widgets/student_app_bar.dart';

import '../../../domain/entities/project_entity.dart';
import 'controller/rankings_controller.dart';
import 'widgets/ranking_project_item_widget.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends ModularState<RankingPage, RankingsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.secondaryColor600,
              AppColors.tertiaryColor100,
              AppColors.primaryColor80,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
          child: StudentAppBarWidget(
            title: 'Seus Rankings',
            barColor: Colors.transparent,
            imageAsset: 'assets/images/perfil_default.png',
            buttomGoBack: false,
            textColor: Colors.white,
          ),
          preferredSize: Size.fromHeight(60),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder<List<ProjectEntity>>(
                  future: controller.getProjectListRepository("link"),
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
                        return SizedBox(
                          height: snapshot.data!.length * (480 + 32),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.length,
                              itemBuilder: (_, index) {
                                var item = snapshot.data![index];
                                return RankingProjectItemWidget(
                                    project: item,
                                    medal: controller.getMedal(item.medal),
                                    place: controller.getPlace(item.place),
                                    ontap: () {
                                      controller.navigateToDetails(item);
                                    });
                              }),
                        );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
