import 'package:flutter/material.dart';
import '../../../../domain/entities/project_entity.dart';
import '../controller/projects_controller.dart';
import 'project_item_widget.dart';

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProjectsController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProjectEntity>>(
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
                height: snapshot.data!.length * (397 + 32),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (_, index) {
                      var project = snapshot.data![index];
                      return ProjectItemWidget(
                          ontap: () {
                            controller.navigateToDetails(project);
                          },
                          name: project.name,
                          mentor: project.mentor,
                          urlParter: project.urlParter,
                          description: project.description,
                          score: project.score,
                          endDate: project.endDate,
                          startDate: project.startDate);
                    }),
              );
          }
        });
  }
}
