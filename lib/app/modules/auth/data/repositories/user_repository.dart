import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../../infra/local/user_datasource.dart';

class UserRepository extends IUSerRepository {
  final UserDatasource _userDatasource = UserDatasource();
  @override
  Future<UserEntity> fetchUserData(
      {required String email, required String password}) async {
    return _userDatasource.getUser(email: email, password: password);
  }
}
