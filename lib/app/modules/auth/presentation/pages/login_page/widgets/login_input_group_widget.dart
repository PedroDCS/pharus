import 'package:flutter/material.dart';
import '../../../../../../shared/app_colors/app_colors.dart';
import '../controller/login_page_controller.dart';
import 'login_input_area_widget.dart';

class LoginInputGroupWidget extends StatelessWidget {
  const LoginInputGroupWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: LoginInputAreaWidget(
            areaName: 'E-mail',
            control: controller.emailController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: LoginInputAreaWidget(
            areaName: 'Senha',
            obscureText: true,
            control: controller.passwordController,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(0, 8, 0, 0),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Esqueci minha senha!",
              style: TextStyle(
                color: AppColors.secondaryColor400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
