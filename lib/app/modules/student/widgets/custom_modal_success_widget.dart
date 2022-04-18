import 'package:flutter/material.dart';
import 'package:pharus/app/modules/student/widgets/custom_button_widget.dart';
import 'package:pharus/app/shared/app_colors/app_colors.dart';

class ModalSuccessWidget extends StatelessWidget {
  const ModalSuccessWidget({
    required this.onClose,
    required this.title,
    Key? key,
  }) : super(key: key);
  final Function() onClose;
  final String title;
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
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget(
            nameButton: 'Fechar',
            onPressed: onClose,
            outlineActive: false,
          ),
        ],
      ),
    );
  }
}
