import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../shared/app_colors/app_colors.dart';
import '../../../../data/repositories/news_repository.dart';
import '../../../../data/repositories/notify_repository.dart';
import '../../../../data/repositories/student_repository.dart';
import '../../../../domain/entities/news_entity.dart';
import '../../../../domain/entities/notify_entity.dart';
import '../../../../domain/entities/student_entity.dart';
import '../../../../domain/enums/notify_type_enum.dart';

class StudentHomeController {
  Future<NewsEntity> getNewsListRepository() async {
    final _repository = NewsRepository();
    return await _repository
        .getNewsList()
        .onError((error, stackTrace) => throw Error());
  }

  Future<List<NotifyEntity>> getNotifyListRepository(String link) async {
    final _notifyrepository = NotifyRepository();
    return await _notifyrepository
        .getNotifyList(link: link)
        .onError((error, stackTrace) => throw Error());
  }

  Future<StudentEntity> getProfifeData(String email) async {
    final _studentrepository = StudentRepository();
    return await _studentrepository
        .getStudent(email: email)
        .onError((error, stackTrace) => throw Error());
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
    } else {}
  }
}
