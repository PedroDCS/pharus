// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';

class ProjectsController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validacao(String email, String password) {
    print(password.length);
    if (email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      //TODO validacao da senha
      return false;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return false;
    }

    if (!RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z$*&@#]{8,32}$")
        .hasMatch(password)) {
      print("object");
      return false;
    }
    return true;
  }

  void login() {
    //validação
    if (!validacao(emailController.text, passwordController.text)) {
      print("Deu Errado");
      return;
    }

    print("tudo certo");
  }
}
