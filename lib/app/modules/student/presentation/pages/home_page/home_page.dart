import 'package:flutter/material.dart';

import '../../../../../shared/app_colors/app_colors.dart';
import 'widgets/home_student_body_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.secondaryColor600,
              AppColors.tertiaryColor100,
              AppColors.primaryColor80,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 32),
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 110),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(180),
                          topRight: Radius.circular(180)),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.fromLTRB(18, 27, 10, 20),
                    child: Column(children: const []),
                  ),
                  HomeStudentBodyWidget(name: email),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
