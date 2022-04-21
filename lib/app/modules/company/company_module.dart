import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/company_home_page/company_home_controller.dart';
import 'presentation/pages/company_home_page/company_home_page.dart';
import 'presentation/pages/company_profile_page/company_profile_page.dart';
import 'presentation/pages/company_project_details_page/company_project_details_page.dart';
import 'presentation/pages/company_projects_page/company_projects_page.dart';
import 'presentation/pages/company_projects_page/controller/company_projects_controller.dart';

class CompanyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CompanyProjectsController()),
        Bind.factory((i) => CompanyHomeController()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => CompanyHomePage(
                  email: args.data[0],
                  name: args.data[1],
                )),
        ChildRoute('/projects',
            child: (context, args) => CompanyProjectsPage(
                  email: args.data,
                )),
        ChildRoute('/profile',
            child: (context, args) => CompanyProfilePage(
                  email: args.data,
                )),
        ChildRoute('/projectdetails',
            child: (context, args) => CompanyProjectDetailsPage(
                  project: args.data,
                )),
      ];
}
