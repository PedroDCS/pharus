import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavbarController {
  var index = 0;

  List<String> routesOptions = <String>[
    '/start/studenthome',
    '/start/projects/',
    '/start/projects/rankings',
    '/start/counter/',
    '/start/profile/',
  ];

  changePage(int id) {
    index = id;
    Modular.to.navigate(routesOptions[id]);
  }
}
