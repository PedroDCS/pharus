import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/app_colors/app_colors.dart';
import '../../../data/models/student_model.dart';
import '../../../data/repositories/news_repository.dart';
import '../../../data/repositories/notify_repository.dart';
import '../../../domain/entities/news_entity.dart';
import '../../../domain/entities/notify_entity.dart';
import '../../../domain/entities/student_entity.dart';
import '../../../domain/enums/notify_type_enum.dart';

class StudentHomeController {
  final _repository = NewsRepository();
  final _notifyrepository = NotifyRepository();

  Future<NewsEntity> getNewsListRepository() async {
    return await _repository
        .getNewsList()
        .onError((error, stackTrace) => throw Error());
  }

  Future<List<NotifyEntity>> getNotifyListRepository(String link) async {
    return await _notifyrepository
        .getNotifyList(link: link)
        .onError((error, stackTrace) => throw Error());
  }

  Future<StudentEntity> getProfifeData(String email) async {
    var profilesBox = await Hive.openBox("users");
    var profile = await profilesBox.get(email);
    await profilesBox.close();
    return StudentModel.fromJson(Map<String, dynamic>.from(profile));
  }

  String getIcon(NotifyType type) {
    switch (type) {
      case NotifyType.GENERIC:
        return 'assets/icons/projects.png';
      case NotifyType.MEDAL:
        return 'assets/icons/Medalha.png';
      case NotifyType.NEWPROJECT:
        return 'assets/icons/projects.png';
      case NotifyType.UPDATEPROJECT:
        return 'assets/icons/projects.png';
      case NotifyType.WARNING:
        return 'assets/icons/icon-alert.png';
      default:
        return 'assets/icons/projects.png';
    }
  }

  Color getColor(NotifyType type, ThemeData theme) {
    switch (type) {
      case NotifyType.GENERIC:
        return AppColors.primaryColor50;
      case NotifyType.WARNING:
        return AppColors.alertColor;
      case NotifyType.MEDAL:
        return AppColors.primaryColor50;
      default:
        return AppColors.successColor;
    }
  }

  Future<void> lauchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: false, forceSafariVC: false, enableJavaScript: true);
    } else {
    }
  }
}
