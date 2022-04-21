import '../models/user_model.dart';

abstract class IUserDatasource {
  Future<UserModel> getUser({required String email, required String password});
}
