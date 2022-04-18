import '../../domain/entities/project_entity.dart';
import '../../domain/entities/task_entity.dart';
import 'task_model.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel(
      {required String name,
      required String description,
      required DateTime startDate,
      required DateTime endDate,
      required String mentor,
      required int numStudents,
      required String rules,
      required String urlParter,
      required List<TaskEntity> taskList,
      required String companyID,
      required List<String> students,
      required bool finished,
      int? score,
      required int projectId})
      : super(
            name: name,
            description: description,
            startDate: startDate,
            endDate: endDate,
            mentor: mentor,
            numStudents: numStudents,
            rules: rules,
            urlParter: urlParter,
            taskList: taskList,
            companyID: companyID,
            students: students,
            finished: finished,
            score: score,
            projectId: projectId);

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    List<TaskModel> tasks = [];
    json['taskList'].forEach((value) {
      tasks.add(TaskModel.fromJson(Map<String, dynamic>.from(value)));
    });
    List<String> studentList = [];
    if (json['students'] != null) {
      json['students'].forEach((value) {
        studentList.add(value);
      });
    }

    return ProjectModel(
        name: json['name'],
        description: json['description'],
        startDate: DateTime.parse(json['startDate']),
        endDate: DateTime.parse(json['endDate']),
        mentor: json['mentor'],
        numStudents: int.parse(json['numStudents']),
        rules: json['rules'],
        students: studentList,
        urlParter: json['urlParter'],
        taskList: tasks,
        companyID: json['companyID'],
        finished: bool.fromEnvironment(json['subscribed']),
        score: json['score'],
        projectId: int.parse(json['projectId']));
  }

  factory ProjectModel.fromEntity(ProjectEntity project) {
    return ProjectModel(
        name: project.name,
        description: project.description,
        startDate: project.startDate,
        endDate: project.endDate,
        mentor: project.mentor,
        numStudents: project.numStudents,
        rules: project.rules,
        urlParter: project.urlParter,
        taskList: project.taskList,
        companyID: project.companyID,
        students: project.students,
        finished: project.finished,
        score: project.score,
        projectId: project.projectId);
  }

  toJson() {
    var tasklist = [];
    for (var element in taskList) {
      tasklist.add(TaskModel(
        name: element.name,
        isComplete: element.isComplete,
        description: element.description,
      ).toJson());
    }
    return {
      'name': name,
      'description': description,
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
      'mentor': mentor,
      'numStudents': numStudents.toString(),
      'students': students,
      'rules': rules,
      'urlParter': urlParter,
      'taskList': tasklist,
      'companyID': companyID,
      'subscribed': finished.toString(),
      'score': score,
      'projectId': projectId.toString(),
    };
  }
}
