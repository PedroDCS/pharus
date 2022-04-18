import 'dart:async';
import 'package:hive/hive.dart';

import '../../../../data/models/notify_model.dart';
import '../../../../domain/entities/notify_entity.dart';

import '../../domain/repositories/notify_repository_interface.dart';

class NotifyRepository extends INotifyRepository {
  //final Dio _dio = Dio();

  @override
  Future<List<NotifyEntity>> getNotifyList({required String link}) async {
    //final _response = await _dio.get(link);
    //return ProjectModel.fromJson(_response.data);
    List<NotifyEntity> listAux = [];
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
