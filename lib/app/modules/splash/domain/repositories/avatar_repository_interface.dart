abstract class IAvatarRepository {
  Future<void> saveAvatar(
      {required String email,
      required String avatarimage,
      required String assetImgAvatar});

  Future<Map<String, dynamic>> getAvatar({
    required String email,
  });
}
