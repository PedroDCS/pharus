import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class LoginInputAreaWidget extends StatelessWidget {
  final String areaName;
  final bool obscureText;
  final TextEditingController control;

  const LoginInputAreaWidget({
    Key? key,
    required this.areaName,
    this.obscureText = false,
    required this.control,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          areaName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryColor500,
          ),
        ),
        TextField(
          controller: control,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: areaName,
          ),
        ),
      ],
    );
  }
}
