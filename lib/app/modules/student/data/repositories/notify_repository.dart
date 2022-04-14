import 'dart:async';
import '../../domain/entities/notify_entity.dart';
import '../../domain/enums/notify_type_enum.dart';
import '../../domain/repositories/notify_repository_interface.dart';

class NotifyRepository extends INotifyRepository {
  //final Dio _dio = Dio();

  @override
  Future<List<NotifyEntity>> getNotifyList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);

    await Future.delayed(const Duration(seconds: 1));

    return [
      NotifyEntity(
        notify: "O projeto 1 termina em 8 dias!",
        type: NotifyType.WARNING,
      ),
      NotifyEntity(
        notify: "O projeto ”Introdução a Robótica” te deu uma medalha!",
        type: NotifyType.MEDAL,
      ),
      NotifyEntity(
        notify: "Conheça a nova empresa parceira",
        type: NotifyType.GENERIC,
      ),
    ];
  }
}
