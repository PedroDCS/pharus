import 'package:hive/hive.dart';

import '../../../data/models/school_model.dart';
import '../../../domain/entities/school_entity.dart';

class SchoolProfileController {
  Future<SchoolEntity> getProfifeData(String email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    await profilesBox.close();
    return SchoolModel.fromJson(Map<String, dynamic>.from(profile));
  }
}
