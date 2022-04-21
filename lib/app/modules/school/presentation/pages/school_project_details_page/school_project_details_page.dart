import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../shared/app_colors/app_colors.dart';
import '../../../domain/entities/project_entity.dart';
import '../../widgets/school_app_bar.dart';
import 'widgets/school_project_details_head_widget.dart';
import 'widgets/school_project_game_rules_widget.dart';
import 'widgets/school_project_task_list_widget.dart';

class SchoolProjectDetailsPage extends StatefulWidget {
  const SchoolProjectDetailsPage({
    Key? key,
    required this.project,
  }) : super(key: key);
  final ProjectEntity project;

  @override
  State<SchoolProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<SchoolProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SchoolAppBarWidget(
          title: widget.project.name,
          imageAsset: 'assets/icons/school.png',
          barColor: Colors.transparent,
          textColor: Colors.black,
        ),
        preferredSize: const Size.fromHeight(60),
      ),
      backgroundColor: AppColors.primaryColor30,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 53, 16, 10),
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
                    SchoolProjectDetailsHeadWidget(
                      mentor: widget.project.mentor,
                      description: widget.project.description,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(top: 32, bottom: 32),
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          constraints: BoxConstraints.tightFor(
                            height: MediaQuery.of(context).size.height * 0.80,
                            width: MediaQuery.of(context).size.width * 0.90,
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const SchoolProjectGameRulesWidget();
                          },
                        );
                      },
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
                    SchoolProjectTaskListWidget(
                      taskList: widget.project.taskList,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
