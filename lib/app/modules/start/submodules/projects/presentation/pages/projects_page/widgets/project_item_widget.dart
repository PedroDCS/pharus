import 'package:flutter/material.dart';

import 'project_item_body_widget.dart';
import 'project_item_head_widget.dart';

class ProjectItemWidget extends StatelessWidget {
  const ProjectItemWidget({
    Key? key,
    required this.ontap,
    required this.name,
    required this.mentor,
    required this.urlParter,
    required this.description,
    required this.score,
    required this.endDate,
    required this.startDate,
  }) : super(key: key);
  final VoidCallback ontap;
  final String name;
  final String mentor;
  final String urlParter;
  final String description;
  final int score;
  final DateTime endDate;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE1E1E1),
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectItemHeadWidget(name: name, mentor: mentor),
            ProjectItemBodyWidget(
                urlParter: urlParter,
                description: description,
                score: score,
                endDate: endDate,
                startDate: startDate)
          ],
        ),
      ),
    );
  }
}
