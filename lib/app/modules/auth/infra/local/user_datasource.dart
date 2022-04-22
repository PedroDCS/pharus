import 'package:hive/hive.dart';

import '../../data/datasources/user_datasource_interface.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user_type_enum.dart';

class UserDatasource extends IUserDatasource {
  @override
  Future<UserModel> getUser(
      {required String email, required String password}) async {
    var hiveUsersBox = await Hive.openBox("users");
    var hiveuser = await hiveUsersBox.get(email);
    hiveUsersBox.close();
    if (hiveuser == null || hiveuser['password'] != password) {
      return UserModel(
          name: '', email: '', password: '', type: userTypeEnum.NULL);
    } else {
      return UserModel.fromJson(Map<String, dynamic>.from(hiveuser));
    }
  }
}
