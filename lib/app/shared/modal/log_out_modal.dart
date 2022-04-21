import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/student/widgets/custom_button_widget.dart';
import '../app_colors/app_colors.dart';

Future<dynamic> logOutModal(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: AppColors.primaryColor30,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/exit.png',
              color: Colors.black,
              height: 48,
              width: 48,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'Deseja sair da sua conta?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  nameButton: 'Sair',
                  onPressed: () {
                    Modular.to.popAndPushNamed('/auth/');
                  },
                  outlineActive: false,
                ),
                ButtonWidget(
                  nameButton: 'Cancelar',
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  outlineActive: true,
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
