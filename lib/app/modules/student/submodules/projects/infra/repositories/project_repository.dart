import 'dart:async';

import '../../domain/entities/project_entity.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/project_repository_interface.dart';

class ProjectRepository extends IProjectRepository {
  //final Dio _dio = Dio();

  @override
  Future<List<ProjectEntity>> getProjectList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);
    //throw UnimplementedError();
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProjectEntity(
        name: "Projeto 1",
        score: 45,
        medal: "first",
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
            "https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png",
        place: 1,
        taskList: [
          TaskEntity(
            title: "Tarefa 1",
            isComplete: true,
            description: "Tarefa 1",
          ),
          TaskEntity(
            title: "Tarefa 2",
            isComplete: true,
            description: "Tarefa 2",
          ),
          TaskEntity(
            title: "Tarefa 3",
            isComplete: true,
            description: "Tarefa 3",
          ),
          TaskEntity(
            title: "Tarefa 4",
            isComplete: true,
            description: "Tarefa 4",
          ),
          TaskEntity(
            title: "Tarefa 5",
            isComplete: true,
            description: "Tarefa 5",
          ),
        ],
      ),
      ProjectEntity(
        name: "Projeto 2",
        score: 25,
        medal: "second",
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
            "https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png",
        place: 0,
        taskList: [
          TaskEntity(
            title: "Tarefa 1",
            isComplete: true,
            description: "Tarefa 1",
          ),
          TaskEntity(
            title: "Tarefa 2",
            isComplete: true,
            description: "Tarefa 2",
          ),
          TaskEntity(
            title: "Tarefa 3",
            isComplete: true,
            description: "Tarefa 3",
          ),
          TaskEntity(
            title: "Tarefa 4",
            isComplete: false,
            description: "Tarefa 4",
          ),
          TaskEntity(
            title: "Tarefa 5",
            isComplete: false,
            description: "Tarefa 5",
          ),
        ],
      ),
      ProjectEntity(
        name: "Projeto 3",
        score: 75,
        medal: "second",
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
            "https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png",
        place: 2,
        taskList: [
          TaskEntity(
            title: "Tarefa 1",
            isComplete: true,
            description: "Tarefa 1",
          ),
          TaskEntity(
            title: "Tarefa 2",
            isComplete: true,
            description: "Tarefa 2",
          ),
          TaskEntity(
            title: "Tarefa 3",
            isComplete: true,
            description: "Tarefa 3",
          ),
          TaskEntity(
            title: "Tarefa 4",
            isComplete: true,
            description: "Tarefa 4",
          ),
          TaskEntity(
            title: "Tarefa 5",
            isComplete: true,
            description: "Tarefa 5",
          ),
        ],
      )
    ];
  }
}
