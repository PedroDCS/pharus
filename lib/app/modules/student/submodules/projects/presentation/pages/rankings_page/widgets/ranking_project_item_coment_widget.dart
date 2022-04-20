import 'package:flutter/material.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';
import '../../../../../../widgets/custom_button_widget.dart';

class RankingProjectItemComentWidget extends StatelessWidget {
  const RankingProjectItemComentWidget({
    Key? key,
    required this.coment,
  }) : super(key: key);
  final String coment;
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
          GestureDetector(
            onTap: () => showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: AppColors.primaryColor30,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Comentarios do mentor',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(coment),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: ButtonWidget(
                            nameButton: 'Sait',
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(),
                            outlineActive: true,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            child: Text(
              coment,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.neutralColor10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
