import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class CompanyHomeButtomWidget extends StatelessWidget {
  const CompanyHomeButtomWidget({
    Key? key,
    required this.iconButtom,
    required this.textButtom,
    required this.functionNavigateTo,
  }) : super(key: key);
  final String iconButtom;
  final String textButtom;
  final Function() functionNavigateTo;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: functionNavigateTo,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(155, 130),
        primary: AppColors.primaryColor30,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Column(
        children: [
          ImageIcon(
            AssetImage(iconButtom),
            size: 48,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              textButtom,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
