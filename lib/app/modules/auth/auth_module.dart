import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/login_page/controller/login_page_controller.dart';
import 'presentation/pages/login_page/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => LoginPageController()),
      ];
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const LoginPage())];
}
