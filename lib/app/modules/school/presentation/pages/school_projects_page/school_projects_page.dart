import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/school_app_bar.dart';
import 'controller/school_projects_controller.dart';
import 'widgets/school_project_list_widget.dart';

class SchoolProjectsPage extends StatefulWidget {
  const SchoolProjectsPage({Key? key}) : super(key: key);

  @override
  State<SchoolProjectsPage> createState() => _SchoolProjectsPageState();
}

class _SchoolProjectsPageState
    extends ModularState<SchoolProjectsPage, ProjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor30,
      appBar: const PreferredSize(
        child: SchoolAppBarWidget(
          title: 'Seus Projetos',
          imageAsset: 'assets/icons/school.png',
          barColor: Colors.transparent,
          textColor: Colors.black,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SchoolProjectListWidget(
              future: controller.getProjectListRepository("projects"),
              navigateTo: controller.navigateToDetails,
            )
          ],
        ),
      ),
    );
  }
}
