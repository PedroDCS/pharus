import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../../domain/entities/task_entity.dart';
import '../../../../../../shared/app_colors/app_colors.dart';

class SchoolProjectTaskListWidget extends StatelessWidget {
  const SchoolProjectTaskListWidget({
    Key? key,
    required this.taskList,
  }) : super(key: key);
  final List<TaskEntity> taskList;

  int completetasks(List<TaskEntity> tasklist) {
    int completes = 0;
    for (var element in tasklist) {
      if (element.isComplete) completes++;
    }
    return completes;
  }

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
          height: 50 * double.parse(taskList.length.toString()),
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: taskList.length,
              itemBuilder: ((context, index) {
                TaskEntity tarefa = taskList[index];

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
            "Completadas ${completetasks(taskList)} de ${taskList.length} tarefas (${(completetasks(taskList) / taskList.length) * 100})",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: LinearPercentIndicator(
            percent: (completetasks(taskList) / taskList.length),
            progressColor: AppColors.successColor,
            backgroundColor: AppColors.neutralColor40,
            lineHeight: 22,
          ),
        ),
      ],
    );
  }
}
