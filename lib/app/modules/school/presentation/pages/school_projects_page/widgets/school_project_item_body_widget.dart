import 'package:flutter/material.dart';
import '../../../../../../shared/app_colors/app_colors.dart';
import 'school_project_partnership_widget.dart';

class SchoolProjectItemBodyWidget extends StatelessWidget {
  const SchoolProjectItemBodyWidget({
    Key? key,
    required this.urlParter,
    required this.description,
    required this.endDate,
    required this.startDate,
  }) : super(key: key);
  final String urlParter;
  final String description;
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
        SchoolProjectPartnershipWidget(urlParter: urlParter)
      ],
    );
  }
}
