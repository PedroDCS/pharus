import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPageController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validacao(String email, String password) {
    if (email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      return false;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return false;
    }

    if (!RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z$*&@#]{8,32}$")
        .hasMatch(password)) {
      return false;
    }
    return true;
  }

  void login() {
    // TODO modificar depois
    /*
    por enquanto o aplicativo está navegando para a proxima tela, sem validar o email
    ou senha, e nem verifica se é aluno, empresa ou escola,
    */
    Modular.to.navigate('/student/studenthome');
    return;
    if (!validacao(emailController.text, passwordController.text)) {
      return;
    }
  }
}
