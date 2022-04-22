import '../../../domain/entities/task_entity.dart';

class CompanyProjectDetailsController {
  int completetasks(List<TaskEntity> tasklist) {
    int completes = 0;
    for (var element in tasklist) {
      if (element.isComplete) completes++;
    }
    return completes;
  }
}
