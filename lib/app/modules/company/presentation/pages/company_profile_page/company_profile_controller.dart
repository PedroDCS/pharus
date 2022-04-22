import 'package:hive/hive.dart';

import '../../../data/models/company_model.dart';
import '../../../domain/entities/company_entity.dart';

class CompanyProfileController {
  Future<CompanyEntity> getProfifeData(String email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    await profilesBox.close();
    return CompanyModel.fromJson(Map<String, dynamic>.from(profile));
  }
}
