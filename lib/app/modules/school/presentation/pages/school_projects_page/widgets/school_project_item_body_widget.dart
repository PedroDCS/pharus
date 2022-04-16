import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'school_project_partnership_widget.dart';

class SchoolProjectItemBodyWidget extends StatelessWidget {
  const SchoolProjectItemBodyWidget({
    Key? key,
    required this.urlParter,
    required this.description,
    required this.score,
    required this.endDate,
    required this.startDate,
  }) : super(key: key);
  final String urlParter;
  final String description;
  final int score;
  final DateTime endDate;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
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
                      radius: 72.0,
                      lineWidth: 5.0,
                      percent: score.toDouble() / 100,
                      center: Text("$score%"),
                      progressColor: const Color(0xFF272727),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
        SchoolProjectPartnershipWidget(urlParter: urlParter),
      ],
    );
  }
}
