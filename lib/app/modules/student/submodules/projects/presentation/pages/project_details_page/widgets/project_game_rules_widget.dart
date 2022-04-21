import 'package:flutter/material.dart';

import '../../../../../../../../shared/app_colors/app_colors.dart';

class ProjectGameRulesWidget extends StatelessWidget {
  const ProjectGameRulesWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final String text;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 32, 25, 24),
        decoration: BoxDecoration(
          color: AppColors.primaryColor30,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CloseButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44, bottom: 16),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.secondaryColor500,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 27.5, vertical: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  "Fechar",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
