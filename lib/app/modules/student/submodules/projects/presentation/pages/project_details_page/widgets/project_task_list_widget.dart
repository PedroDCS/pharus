import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';

class ProjectTaskListWidget extends StatelessWidget {
  const ProjectTaskListWidget({
    Key? key,
  }) : super(key: key);

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
          height: 220,
          child: ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.all(0),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  title: Text(
                    "Tarefa ${index + 1}",
                    style: const TextStyle(decoration: TextDecoration.none),
                  ),
                  onChanged: (bool? value) {},
                );
              })),
        ),
        const Center(
          child: Text(
            "Completadas 3 de 4 tarefas (75%)",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: LinearPercentIndicator(
            percent: 0.75,
            progressColor: AppColors.successColor,
            backgroundColor: AppColors.neutralColor40,
            lineHeight: 22,
          ),
        ),
      ],
    );
  }
}
