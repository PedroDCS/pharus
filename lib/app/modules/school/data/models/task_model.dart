import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required String name,
    required bool isComplete,
    required String description,
  }) : super(
          name: name,
          isComplete: isComplete,
          description: description,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
      isComplete: json['isComplete'],
      description: json['description'],
    );
  }

  toJson() {
    return {"name": name, 'isComplete': isComplete, 'description': description};
  }
}
