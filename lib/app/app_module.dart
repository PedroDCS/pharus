import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/auth/auth_module.dart';
import 'modules/counter/counter_module.dart';
import 'modules/projects/projects_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/counter', module: CounterModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/projects', module: ProjectsModule())
      ];
}