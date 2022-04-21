import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class StudentProfileInputWidget extends StatelessWidget {
  const StudentProfileInputWidget({
    Key? key,
    required this.areaName,
    required this.textValue,
    this.readOnly = true,
  }) : super(key: key);
  final String areaName;
  final String textValue;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            areaName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.neutralColor10,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(border: InputBorder.none),
            readOnly: readOnly,
            initialValue: textValue,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.neutralColor10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
