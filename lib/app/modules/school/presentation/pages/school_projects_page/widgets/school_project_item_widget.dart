import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';
import 'school_project_item_body_widget.dart';
import 'school_project_item_head_widget.dart';

class SchoolProjectItemWidget extends StatelessWidget {
  const SchoolProjectItemWidget({
    Key? key,
    required this.ontap,
    required this.name,
    required this.mentor,
    required this.urlParter,
    required this.description,
    required this.endDate,
    required this.startDate,
  }) : super(key: key);
  final VoidCallback ontap;
  final String name;
  final String mentor;
  final String urlParter;
  final String description;
  final DateTime endDate;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SchoolProjectItemHeadWidget(name: name, mentor: mentor),
            SchoolProjectItemBodyWidget(
                urlParter: urlParter,
                description: description,
                endDate: endDate,
                startDate: startDate)
          ],
        ),
      ),
    );
  }
}
