import 'task_entity.dart';

class ProjectEntity {
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String mentor;
  final int numStudents;
  final String rules;
  final String urlParter;
  final List<TaskEntity> taskList;
  final String companyID;
  final List<String> students;
  final bool finished;
  final int projectId;
  final String? medal;
  final int? ranking;
  final String? mentorComment;
  final int? score;
  ProjectEntity({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.mentor,
    required this.numStudents,
    required this.rules,
    required this.urlParter,
    required this.taskList,
    required this.companyID,
    required this.students,
    required this.finished,
    required this.projectId,
    this.medal,
    this.ranking,
    this.mentorComment,
    this.score,
  });
}
