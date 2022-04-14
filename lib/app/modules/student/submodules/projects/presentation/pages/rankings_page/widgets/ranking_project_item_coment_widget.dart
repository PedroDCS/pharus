import 'package:flutter/material.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';

class RankingProjectItemComentWidget extends StatelessWidget {
  const RankingProjectItemComentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(9, 22, 9, 39),
      child: Column(
        children: [
          Text(
            "Comentários do mentor",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.neutralColor10,
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.neutralColor10,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
