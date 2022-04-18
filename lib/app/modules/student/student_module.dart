import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/custom_bottom_navbar_controller.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'presentation/pages/home_page/student_home_controller.dart';
import 'presentation/pages/start_page/start_page.dart';
import 'presentation/pages/student_profile_page/student_profile.dart';
import 'submodules/avatar/avatar_module.dart';
import 'submodules/projects/projects_module.dart';

class StudentModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CustomBottomNavbarController()),
        Bind.factory((i) => StudentHomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => StartPage(email: args.data),
            children: [
              ChildRoute(
                '/studenthome',
                child: (context, args) => HomePage(email: args.data),
              ),
              ModuleRoute('/avatar', module: AvatarModule()),
              ModuleRoute('/projects', module: ProjectsModule()),
              ChildRoute('/profile',
                  child: (context, args) => StudentProfile(email: args.data)),
            ]),
      ];
}
