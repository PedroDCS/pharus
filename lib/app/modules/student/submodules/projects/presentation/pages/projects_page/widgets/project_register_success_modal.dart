import 'package:flutter/material.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';
import 'project_register_button.dart';

class ModalRegisterSuccessProject extends StatelessWidget {
  const ModalRegisterSuccessProject({
    required this.onClose,
    Key? key,
  }) : super(key: key);
  final Function() onClose;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: AppColors.primaryColor30,
      title: Image.asset(
        'assets/icons/icon-check.png',
        width: 60,
        height: 60,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Inscrição confirmada!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ProjectButtonWidget(
            nameButton: 'Fechar',
            onPressed: onClose,
            outlineActive: false,
          ),
        ],
      ),
    );
  }
}
