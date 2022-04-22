import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../../presentation/widgets/student_app_bar.dart';
import '../../../domain/entities/project_entity.dart';
import '../../controllers/projects_controller.dart';
import 'widgets/project_details_head_widget.dart';
import 'widgets/project_modal_upload_files.dart';
import 'widgets/project_task_list_widget.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    Key? key,
    required this.project,
    required this.email,
  }) : super(key: key);
  final ProjectEntity project;
  final String email;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState
    extends ModularState<ProjectDetailsPage, ProjectsController> {
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
                    buttomGoBack: true,
                  );
              }
            },
          ),
          preferredSize: const Size.fromHeight(60),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 33, 16, 10),
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor20,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProjectDetailsHeadWidget(
                        mentor: widget.project.mentor,
                        description: widget.project.description,
                        onpress: () => controller.genericModal(
                          context,
                          "Avaliação do mentor",
                          "assets/icons/icon-feedback.png",
                          widget.project.mentorComment!,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(top: 32, bottom: 32),
                        ),
                        onPressed: () => controller.genericModal(
                          context,
                          "atividades",
                          "assets/icons/icon-rules.png",
                          widget.project.rules,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " Atividades do Projeto",
                              style: TextStyle(
                                color: AppColors.tertiaryColor500,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const ImageIcon(
                              AssetImage("assets/icons/icon-left-arrow.png"),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      ProjectTaskListWidget(taskList: widget.project.taskList),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            backgroundColor: const Color(0xFFE1E1E1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                            ),
                            constraints: BoxConstraints.tightFor(
                              height: MediaQuery.of(context).size.height * 0.65,
                              width: MediaQuery.of(context).size.width * 0.90,
                            ),
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return ModalUploadFiles(
                                clearData: controller.clearData,
                                getFile: controller.getFile,
                                imageName: controller.nameImage,
                                isFile: controller.isData,
                                uploadFiles: () =>
                                    controller.upload(controller.path, context),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(58),
                          primary: AppColors.secondaryColor500,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 27.5, vertical: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: const Text(
                          "Enviar Arquivos",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
