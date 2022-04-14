import '../entities/notify_entity.dart';

abstract class INotifyRepository {
  Future<List<NotifyEntity>> getNotifyList({required String link});
}
