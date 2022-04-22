import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../splash/data/repositories/avatar_repository.dart';
import '../../../../data/repositories/project_repository.dart';
import '../../../../domain/entities/project_entity.dart';

class RankingsController {
  final _repository = ProjectRepository();

  navigateToDetails(ProjectEntity proj) {
    Modular.to.pushNamed('projectdetails', arguments: proj);
  }

  Future<String> getAtavar(email) async {
    AvatarRepository _avatarrepository = AvatarRepository();
    var avatar = await _avatarrepository.getAvatar(email: email);
    return avatar['avatarCircle'];
  }

  Future<List<ProjectEntity>> getProjectListRepository(String link) async {
    return await _repository
        .getProjectList(link: link)
        .onError((error, stackTrace) => throw Error());
  }

  String getPlace(int place) {
    switch (place) {
      case 1:
        return 'assets/icons/1place.png';

      case 2:
        return 'assets/icons/2place.png';

      case 3:
        return 'assets/icons/3place.png';

      case 4:
        return 'assets/icons/4place.png';

      case 5:
        return 'assets/icons/5place.png';

      default:
        return 'assets/icons/5place.png';
    }
  }

  String getMedal(String medal) {
    switch (medal) {
      case 'first':
        return 'assets/icons/1medal.png';

      case 'second':
        return 'assets/icons/2medal.png';

      case 'third':
        return 'assets/icons/3medal.png';

      case 'fourth':
        return 'assets/icons/4medal.png';

      case 'fifth':
        return 'assets/icons/5medal.png';

      default:
        return 'assets/icons/5medal.png';
    }
  }
}
