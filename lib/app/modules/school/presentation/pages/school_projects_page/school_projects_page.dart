import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      backgroundColor: const Color(0xFFE6E6E6),
      appBar: const PreferredSize(
        child: SchoolAppBarWidget(
          title: 'Seus Projetos',
          imageAsset: 'assets/icons/school.png',
          barColor: Color(0xFFE6E6E6),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SchoolProjectListWidget(
              future: controller.getProjectListRepository("link"),
              navigateTo: controller.navigateToDetails,
            )
          ],
        ),
      ),
    );
  }
}
