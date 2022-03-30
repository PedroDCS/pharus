import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'controller/login_page_controller.dart';
import 'widgets/get_in_button_widget.dart';
import 'widgets/login_input_area_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(48, 34.33, 48, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 88.33),
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/pharos_icon.png',
                        height: 51.33, width: 36.56)),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
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
                    child: const Text("Esqueci minha senha!",
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: GetInButtonWidget(login: () {
                    controller.login();
                  }),
                ),
              ],
            )),
      ),
    );
  }
}
