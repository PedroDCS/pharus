import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../../presentation/widgets/student_app_bar.dart';
import '../../controllers/projects_controller.dart';
import 'widgets/project_list_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState
    extends ModularState<ProjectsPage, ProjectsController> {
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
        appBar: PreferredSize(
          child: FutureBuilder<String>(
            future: controller.getAtavar(widget.email),
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
                  return StudentAppBarWidget(
                    title: 'Seus Projetos',
                    barColor: Colors.transparent,
                    textColor: Colors.white,
                    imageAsset: snapshot.data!,
                    buttomGoBack: false,
                  );
              }
            },
          ),
          preferredSize: const Size.fromHeight(60),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ProjectListWidget(controller: controller, email: widget.email),
            ],
          ),
        ),
      ),
    );
  }
}
