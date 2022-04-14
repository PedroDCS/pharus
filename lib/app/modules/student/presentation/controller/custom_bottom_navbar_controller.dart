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

  changePage(int id) {
    index = id;
    Modular.to.navigate(routesOptions[id]);
  }
}
