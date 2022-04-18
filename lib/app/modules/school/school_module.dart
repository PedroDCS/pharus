import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/school_home_page/school_home_controller.dart';
import 'presentation/pages/school_home_page/school_home_page.dart';
import 'presentation/pages/school_profile_page/school_profile_page.dart';
import 'presentation/pages/school_project_details_page/school_project_details_page.dart';
import 'presentation/pages/school_projects_page/controller/school_projects_controller.dart';
import 'presentation/pages/school_projects_page/school_projects_page.dart';

class SchoolModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ProjectsController()),
        Bind.factory((i) => SchoolHomeController()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => SchoolHomePage(
                  email: args.data[0],
                  name: args.data[1],
                )),
        ChildRoute('/projects',
            child: (context, args) => const SchoolProjectsPage()),
        ChildRoute('/profile',
            child: (context, args) => SchoolProfilePage(
                  email: args.data,
                )),
        ChildRoute('/projectdetails',
            child: (context, args) => SchoolProjectDetailsPage(
                  project: args.data,
                )),
      ];
}
