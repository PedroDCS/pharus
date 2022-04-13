import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/student/submodules/avatar/avatar_module.dart';
import 'presentation/controller/custom_bottom_navbar_controller.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'presentation/pages/home_page/student_home_controller.dart';
import 'presentation/pages/start_page/start_page.dart';

import 'submodules/counter/counter_module.dart';
import 'submodules/profile/profile_module.dart';
import 'submodules/projects/projects_module.dart';

class StudentModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CustomBottomNavbarController()),
        Bind.factory((i) => StudentHomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StartPage(), children: [
          ChildRoute('/studenthome',
              child: (context, args) => const HomePage()),
          ModuleRoute('/avatar', module: AvatarModule()),
          ModuleRoute('/projects', module: ProjectsModule()),
          ModuleRoute('/profile', module: ProfileModule()),
        ]),
      ];
}
