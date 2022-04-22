import '../../domain/repositories/avatar_repository_interface.dart';
import '../../infra/local/avatar_datasource.dart';

class AvatarRepository extends IAvatarRepository {
  final AvatarDatasource _avatarDatasource = AvatarDatasource();

  @override
  Future<void> saveAvatar(
      {required String email,
      required String avatarimage,
      required String assetImgAvatar}) async {
    await _avatarDatasource.saveAvatar(
        email: email, avatarimage: avatarimage, assetImgAvatar: assetImgAvatar);
  }

  @override
  Future<Map<String, dynamic>> getAvatar({required String email}) async {
    return await _avatarDatasource.getAvatar(email: email);
  }
}
