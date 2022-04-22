import 'package:hive/hive.dart';
import '../../data/datasources/avatar_datasource_interface.dart';

class AvatarDatasource extends IAvatarDatasource {
  @override
  Future<void> saveAvatar(
      {required String email,
      required String avatarimage,
      required String assetImgAvatar}) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    profile['avatarCircle'] = avatarimage;
    profile['avatar'] = assetImgAvatar;
    await profilesBox.put(email, profile);
    await profilesBox.close();
  }

  @override
  Future<Map<String, dynamic>> getAvatar({required String email}) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    var avatar = {
      'avatar': profile['avatar'],
      'avatarCircle': profile['avatarCircle'],
    };
    await profilesBox.close();
    return avatar;
  }
}
