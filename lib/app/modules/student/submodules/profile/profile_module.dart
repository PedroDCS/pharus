import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/student_profile_page/student_profile.dart';

class ProfileModule extends Module {
  // @override
  // List<Bind> get binds => [        Bind.factory((i) => ProjectsController()), ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StudentProfile()),
      ];
}
