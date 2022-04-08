import 'package:flutter_modular/flutter_modular.dart';
import 'modules/company/company_module.dart';
import 'modules/school/school_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/student/student_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/student', module: StudentModule()),
        ModuleRoute('/school', module: SchoolModule()),
        ModuleRoute('/company', module: CompanyModule()),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
