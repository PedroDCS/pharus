import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class LoginHeadWidget extends StatelessWidget {
  const LoginHeadWidget({
    Key? key,
    required this.valueListenable,
  }) : super(key: key);
  final ValueListenable<String> valueListenable;
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
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ValueListenableBuilder(
              valueListenable: valueListenable,
              builder: (context, String text, _) {
                return Text(
                  text,
                  style: TextStyle(
                    color: AppColors.errorColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
