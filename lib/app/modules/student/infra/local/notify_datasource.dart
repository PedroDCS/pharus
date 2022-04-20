import 'package:hive/hive.dart';

import '../../data/datasources/notify_datasource_interface.dart';
import '../../data/models/notify_model.dart';

class NotifyDatasource extends INotifyDatasource {
  @override
  Future<List<NotifyModel>> getNotify() async {
    List<NotifyModel> listAux = [];
    await Future.delayed(const Duration(seconds: 1));
    var hiveBox = await Hive.openBox("notify");

    var notify = hiveBox.toMap();
    notify.forEach((key, value) {
      listAux.add(NotifyModel.fromJson(Map<String, dynamic>.from(value)));
    });

    hiveBox.close();

    return listAux;
  }
}
