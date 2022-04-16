import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class LoginHeadWidget extends StatelessWidget {
  const LoginHeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 56),
            alignment: Alignment.center,
            child: Image.asset('assets/images/Logo_Pharus.png',
                height: 112, width: 117.5)),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Login',
            style: TextStyle(
              color: AppColors.secondaryColor500,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
