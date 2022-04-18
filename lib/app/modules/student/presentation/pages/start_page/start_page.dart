import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/app_colors/app_colors.dart';
import '../../widgets/custom_bottom_navbar_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor600,
        body: const RouterOutlet(),
        bottomNavigationBar: CustomBottomnavBarWidget(email: email),
      ),
    );
  }
}
