import 'package:flutter_modular/flutter_modular.dart';
import 'package:pharus/app/modules/student/submodules/avatar/presentation/pages/avatar_page/avatar_page.dart';
import 'package:pharus/app/modules/student/submodules/avatar/presentation/pages/avatar_page/controller/avatar_controller.dart';


class AvatarModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => AvatarController()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AvatarPage()),
      ];
}
