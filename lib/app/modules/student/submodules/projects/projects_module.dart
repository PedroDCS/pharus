import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/project_details_page/project_details_page.dart';
import 'presentation/pages/projects_page/controller/projects_controller.dart';
import 'presentation/pages/projects_page/projects_page.dart';
import 'presentation/pages/rankings_page/controller/rankings_controller.dart';
import 'presentation/pages/rankings_page/ranking_page.dart';

class ProjectsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ProjectsController()),
        Bind.factory((i) => RankingsController()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProjectsPage()),
        ChildRoute('/projectdetails',
            child: (context, args) => ProjectDetailsPage(
                  project: args.data,
                )),
        ChildRoute('/rankings', child: (context, args) => const RankingPage()),
      ];
}
