import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../data/repositories/user_repository.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/entities/user_type_enum.dart';

class LoginPageController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validacao(String email, String password) {
    if (email.isEmpty) {
      errorText.value = "Email Não pode ser Vazio";
      return false;
    }

    if (password.isEmpty) {
      errorText.value = "A senha não Pode Ser Vazia";
      return false;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      errorText.value = "Email Invalido";
      return false;
    }

    // if (!RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z$*&@#]{8,32}$")
    //     .hasMatch(password)) {
    //   errorText.value = "Senha Invalida";
    //   return false;
    // }
    return true;
  }

  var errorText = ValueNotifier<String>('');

  final _repository = UserRepository();

  Future<UserEntity> getUserRepository(
      {required String email, required String password}) async {
    return await _repository
        .fetchUserData(email: email, password: password)
        .onError((error, stackTrace) => throw Error());
  }

  void login() async {
    /*
    por enquanto o aplicativo está navegando para a proxima tela, sem validar o email
    ou senha, e nem verifica se é aluno, empresa ou escola,
*/
    // emailController.text = "antonia.ferreira@gmail.com";
    // emailController.text = "maria.helena.diretora@gmail.com";
    emailController.text = "empresa@pharus.com";
    passwordController.text = "password";
    if (!validacao(emailController.text, passwordController.text)) {
      return null;
    }

    var user = await getUserRepository(
        email: emailController.text, password: passwordController.text);

    switch (user.type) {
      case userTypeEnum.COMPANY:
        Modular.to.navigate('/company', arguments: [user.email, user.name]);
        break;
      case userTypeEnum.SCHOOL:
        Modular.to.navigate('/school', arguments: [user.email, user.name]);
        break;
      case userTypeEnum.STUDENT:
        Modular.to.navigate('/student/studenthome', arguments: user.email);
        break;
      case userTypeEnum.NULL:
        errorText.value = "Usuario e senha não conferem";
        break;
      default:
    }

    // if (emailController.text.isEmpty || emailController.text == '1') {
    //   Modular.to.navigate('/student/studenthome');
    // } else if (emailController.text == '2') {
    //   Modular.to.navigate('/school');
    // } else if (emailController.text == '3') {
    //   Modular.to.navigate('/company', arguments: "user?.email");
    // }
  }
}
