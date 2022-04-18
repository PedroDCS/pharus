import '../../../../domain/entities/user_entity.dart';

abstract class IUSerRepository {
  Future<UserEntity?> fetchUserData(
      {required String email, required String password});
}
