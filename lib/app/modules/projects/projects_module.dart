import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/projects/presentation/pages/projects_page/projects_page.dart';

import 'presentation/pages/projects_page/controller/projects_controller.dart';

class ProjectsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ProjectsController()),
      ];
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const ProjectsPage())];
}
