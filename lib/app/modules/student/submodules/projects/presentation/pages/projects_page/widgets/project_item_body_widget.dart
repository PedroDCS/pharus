import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';
import '../controller/subscrive_bottom_controller.dart';
import 'project_partnership_widget.dart';

class ProjectItemBodyWidget extends StatelessWidget {
  const ProjectItemBodyWidget({
    Key? key,
    required this.urlParter,
    required this.description,
    required this.score,
    required this.endDate,
    required this.startDate,
    required this.onPressed,
    required this.isSubscribed,
    required this.subcontroller,
  }) : super(key: key);
  final String urlParter;
  final String description;
  final int score;
  final DateTime endDate;
  final DateTime startDate;
  final Function() onPressed;
  final bool isSubscribed;
  final SubscriveController subcontroller;

  @override
  Widget build(BuildContext context) {
    subcontroller.chageSubscrive(isSubscribed);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) / 2,
                    child: CircularPercentIndicator(
                      curve: Curves.easeInBack,
                      circularStrokeCap: CircularStrokeCap.round,
                      linearGradient: LinearGradient(
                        colors: [
                          AppColors.secondaryColor600,
                          AppColors.secondaryColor60,
                        ],
                      ),
                      animation: true,
                      animationDuration: 700,
                      radius: 82.0,
                      lineWidth: 10.0,
                      backgroundWidth: 10,
                      percent: score.toDouble() / 100,
                      center: Text("$score%"),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const ImageIcon(AssetImage('assets/icons/idea.png'),
                            size: 36),
                        Text(
                          '${endDate.difference(startDate).inDays.toString()} Dias',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProjectPartnershipWidget(urlParter: urlParter),
            ValueListenableBuilder(
                valueListenable: subcontroller.isSubcribed,
                builder: (BuildContext context, bool isSub, _) {
                  return OutlinedButton(
                    onPressed: isSub ? () {} : onPressed,
                    style: OutlinedButton.styleFrom(
                      primary: isSub
                          ? AppColors.neutralColor60
                          : AppColors.secondaryColor500,
                      side: BorderSide(
                        color: isSub
                            ? AppColors.neutralColor60
                            : AppColors.secondaryColor500,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.5, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      isSub ? "Inscrito" : "Inscrever-se",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  );
                }),
          ],
        )
      ],
    );
  }
}
