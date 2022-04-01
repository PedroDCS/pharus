import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/start/submodules/profile/presentation/student_edit_profile_page/student_edit_profile.dart';
import 'package:pharus/app/modules/start/submodules/profile/presentation/student_home_page/student_home_page.dart';

class ProfileModule extends Module {
  // @override
  // List<Bind> get binds => [        Bind.factory((i) => ProjectsController()), ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StudentHomePage()),
        ChildRoute('/edit',
            child: (context, args) => const StudentEditProfile()),
      ];
}
