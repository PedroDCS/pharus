import 'package:flutter/material.dart';

import '../../../../../../shared/app_colors/app_colors.dart';

class GetInButtonWidget extends StatelessWidget {
  final Function() onPressed;
  const GetInButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
//Theme.of(context).colorScheme.secondary
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(60),
        primary: AppColors.secondaryColor500,
        padding: const EdgeInsets.symmetric(horizontal: 28.5, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        "Entrar",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}
