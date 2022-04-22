import '../../domain/entities/notify_entity.dart';
import '../../domain/repositories/set_notify_repository_interface.dart';
import '../../infra/local/set_notify_datasource.dart';
import '../models/notify_model.dart';

class SetNotifyRepository extends ISetNotifyRepository {
  final SetNotifyDatasource _setNotifysDatasource = SetNotifyDatasource();

  @override
  setNotify(List<NotifyEntity> notify) {
    List<NotifyModel> listaux = [];
    for (var element in notify) {
      listaux.add(NotifyModel.fromEntity(element));
    }
    return _setNotifysDatasource.setNotify(listaux);
  }
}
