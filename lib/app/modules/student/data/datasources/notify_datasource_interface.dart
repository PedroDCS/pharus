import '../models/notify_model.dart';

abstract class INotifyDatasource {
  Future<List<NotifyModel>> getNotify();
}
