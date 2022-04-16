import 'package:flutter/material.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../domain/entities/project_entity.dart';
import 'Ranking_project_item_coment_widget.dart';
import 'ranking_project_item_head_widget.dart';
import 'ranking_project_item_medal_widget.dart';

class RankingProjectItemWidget extends StatelessWidget {
  const RankingProjectItemWidget({
    Key? key,
    required this.project,
    required this.ontap,
    required this.place,
    required this.medal,
  }) : super(key: key);
  final ProjectEntity project;
  final VoidCallback ontap;
  final String place;
  final String medal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor400,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RankingProjectItemHeadWidget(name: project.name),
            RankingProjectItemMedalWidget(place: place, medal: medal),
            const RankingProjectItemComentWidget(),
          ],
        ),
      ),
    );
  }
}
