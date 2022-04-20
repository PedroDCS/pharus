import 'package:flutter/material.dart';

import '../../../../domain/entities/project_entity.dart';
import '../../../controllers/projects_controller.dart';
import '../controller/subscrive_bottom_controller.dart';
import 'project_item_widget.dart';

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({
    Key? key,
    required this.controller,
    required this.email,
  }) : super(key: key);

  final ProjectsController controller;
  final String email;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProjectEntity>>(
        future: controller.getProjectListRepository("projects"),
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
                height: snapshot.data!.length * (397 + 32),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (_, index) {
                      var project = snapshot.data![index];
                      SubscriveController subcontroller = SubscriveController();

                      return ProjectItemWidget(
                        ontap: () {
                          controller.navigateToDetails(project, email);
                        },
                        name: project.name,
                        mentor: project.mentor,
                        urlParter: project.urlParter,
                        description: project.description,
                        score: project.score ?? 0,
                        endDate: project.endDate,
                        startDate: project.startDate,
                        register: () => controller.registerProject(
                            context, project, email, subcontroller),
                        isSubscribed: controller.isSubscribed(
                          project: project,
                          email: email,
                        ),
                        subcontroller: subcontroller,
                      );
                    }),
              );
          }
        });
  }
}
