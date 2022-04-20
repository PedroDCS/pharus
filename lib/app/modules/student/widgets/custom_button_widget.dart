import 'package:flutter/material.dart';
import 'package:pharus/app/shared/app_colors/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String nameButton;
  final bool outlineActive;
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.nameButton,
    required this.outlineActive,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(110, 10),
        primary: outlineActive
            ? AppColors.primaryColor30
            : AppColors.secondaryColor500,
        side: BorderSide(
          color: AppColors.secondaryColor500,
          width: 2,
          style: BorderStyle.solid,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        nameButton,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: outlineActive
                ? AppColors.secondaryColor500
                : Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}
