import 'dart:async';

import 'package:hive/hive.dart';

import '../../../../data/models/project_model.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository_interface.dart';

class ProjectRepository extends IProjectRepository {
  //final Dio _dio = Dio();

  @override
  Future<List<ProjectEntity>> getProjectList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);
    //throw UnimplementedError();

    await Future.delayed(const Duration(seconds: 1));
    var hiveProjectssBox = await Hive.openBox("projects");
    var hiveprojects = hiveProjectssBox.toMap();
    List<ProjectModel> auxList = [];
    hiveprojects.forEach((key, value) {
      auxList.add(ProjectModel.fromJson(Map<String, dynamic>.from(value)));
    });
    hiveProjectssBox.close();
    return auxList;
  }
}
