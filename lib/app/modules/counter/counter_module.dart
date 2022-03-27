import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/counter_page.dart';

class CounterModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                const CounterPage(title: 'Flutter Pharus'))
      ];
}
