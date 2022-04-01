import 'dart:async';

import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository_interface.dart';

class ProjectRepository extends IProjectRepository {
  //final Dio _dio = Dio();

  @override
  Future<List<ProjectEntity>> getProjectList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);
    //throw UnimplementedError();
    var _duration = const Duration(seconds: 5);
    Timer(_duration, () {});
    return [
      ProjectEntity(
          name: "Projeto 1",
          score: 45,
          medal: "medal",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ",
          scoreDescription: "Página marromeno",
          startDate: DateTime(2022, 3, 29),
          endDate: DateTime(2022, 4, 2),
          rules: "rules",
          mentor: "Ju El brabo liano",
          projectType: "projectType",
          urlImage: "urlImage",
          urlParter:
              "https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png"),
      ProjectEntity(
          name: "Projeto 2",
          score: 25,
          medal: "medal",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ",
          scoreDescription: "Página marromeno",
          startDate: DateTime(2021, 3, 29),
          endDate: DateTime(2021, 4, 2),
          rules: "rules",
          mentor: "Joao alberto",
          projectType: "projectType",
          urlImage: "urlImage",
          urlParter:
              "https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png"),
      ProjectEntity(
          name: "Projeto 3",
          score: 75,
          medal: "medal",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ",
          scoreDescription: "Página marromeno",
          startDate: DateTime(2022, 1, 1),
          endDate: DateTime(2022, 4, 2),
          rules: "rules",
          mentor: "Algusto Liberato",
          projectType: "projectType",
          urlImage: "urlImage",
          urlParter:
              "https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png")
    ];
  }
}
