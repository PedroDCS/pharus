import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../presentation/widgets/student_app_bar.dart';
import 'controller/projects_controller.dart';
import 'widgets/project_list_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState
    extends ModularState<ProjectsPage, ProjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        child: StudentAppBarWidget(
          title: 'Seus Projetos',
          barColor: Colors.white,
          imageAsset: 'assets/images/perfil_default.png',
          buttomGoBack: false,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
        physics: const ScrollPhysics(),
        child: Column(
          children: [ProjectListWidget(controller: controller)],
        ),
      ),
    );
  }
}
