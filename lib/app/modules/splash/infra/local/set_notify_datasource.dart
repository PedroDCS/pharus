import 'package:hive/hive.dart';
import '../../data/datasources/set_notify_datasource_interface.dart';
import '../../data/models/notify_model.dart';

class SetNotifyDatasource extends ISetNotifyDatasource {
  @override
  setNotify(List<NotifyModel> notify) async {
    var hiveNotifyBox = await Hive.openBox("notify");
    await hiveNotifyBox.clear();
    List listaux = [];

    for (var element in notify) {
      listaux.add(element.toJson());
    }
    if (hiveNotifyBox.isEmpty) {
      await hiveNotifyBox.addAll(listaux);
    }
    hiveNotifyBox.close();
  }
}
