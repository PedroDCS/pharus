import 'package:flutter/material.dart';
import '../../../../../../../../shared/app_colors/app_colors.dart';

class ModalRegisterProjectLoading
 extends StatelessWidget {
  const ModalRegisterProjectLoading

  ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: AppColors.primaryColor30,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 45),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryColor500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
  }
}