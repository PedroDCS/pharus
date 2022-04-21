import 'dart:async';

import '../../domain/entities/notify_entity.dart';
import '../../domain/repositories/notify_repository_interface.dart';
import '../../infra/local/notify_datasource.dart';

class NotifyRepository extends INotifyRepository {
  final NotifyDatasource _notifydatasource = NotifyDatasource();

  @override
  Future<List<NotifyEntity>> getNotifyList({required String link}) async {
    return _notifydatasource.getNotify();
  }
}
