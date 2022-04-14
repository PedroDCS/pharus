import 'package:flutter/material.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';

class RankingProjectItemHeadWidget extends StatelessWidget {
  const RankingProjectItemHeadWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: AppColors.neutralColor10,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Parabéns! voce alcançou o',
            style: TextStyle(
              color: AppColors.neutralColor10,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
