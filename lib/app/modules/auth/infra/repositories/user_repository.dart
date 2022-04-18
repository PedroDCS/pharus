import 'package:hive/hive.dart';

import '../../../../data/models/user_model.dart';
import '../../../../domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository_interface.dart';

class UserRepository extends IUSerRepository {
  //final Dio _dio = Dio();

  @override
  Future<UserEntity?> fetchUserData({
    required String email,
    required String password,
  }) async {
    //final response = await _dio.get(link);
    //return UserModel.fromJson(response.data);

    var hiveUsersBox = await Hive.openBox("users");
    var hiveuser = await hiveUsersBox.get(email);
    hiveUsersBox.close();

    if (hiveuser == null || hiveuser['password'] != password) {
      return null;
    } else {
      return UserModel.fromJson(Map<String, dynamic>.from(hiveuser));
    }
  }
}
