import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavbarController {
  var index = 0;

  List<String> routesOptions = <String>[
    '/student/studenthome',
    '/student/projects/',
    '/student/avatar/',
    '/student/projects/rankings',
    '/student/profile',
  ];

  changePage({required int id, required String email}) {
    index = id;
    Modular.to.navigate(routesOptions[id], arguments: email);
  }
}
