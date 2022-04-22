import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../../shared/app_colors/app_colors.dart';
import '../../../../domain/entities/task_entity.dart';
import '../school_project_details_controller.dart';

class SchoolProjectTaskListWidget extends StatefulWidget {
  const SchoolProjectTaskListWidget({
    Key? key,
    required this.taskList,
  }) : super(key: key);
  final List<TaskEntity> taskList;

  @override
  State<SchoolProjectTaskListWidget> createState() =>
      _SchoolProjectTaskListWidgetState();
}

class _SchoolProjectTaskListWidgetState extends ModularState<
    SchoolProjectTaskListWidget, SchoolProjectDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Lista de tarefas:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: double.infinity,
          height: 60 * double.parse(widget.taskList.length.toString()),
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.taskList.length,
              itemBuilder: ((context, index) {
                TaskEntity tarefa = widget.taskList[index];

                return CheckboxListTile(
                  contentPadding: const EdgeInsets.all(0),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: tarefa.isComplete,
                  title: Text(
                    tarefa.name,
                    style: const TextStyle(decoration: TextDecoration.none),
                  ),
                  onChanged: (bool? value) {},
                );
              })),
        ),
        Center(
          child: Text(
            "Completadas ${controller.completetasks(widget.taskList)} de ${widget.taskList.length} tarefas (${(controller.completetasks(widget.taskList) / widget.taskList.length) * 100})",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: LinearPercentIndicator(
            percent: (controller.completetasks(widget.taskList) /
                widget.taskList.length),
            progressColor: AppColors.successColor,
            backgroundColor: AppColors.neutralColor40,
            lineHeight: 22,
          ),
        ),
      ],
    );
  }
}
