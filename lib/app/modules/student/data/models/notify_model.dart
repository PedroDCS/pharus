import '../../domain/entities/notify_entity.dart';
import '../../domain/enums/notify_type_enum.dart';

class NotifyModel extends NotifyEntity {
  NotifyModel({
    required String notify,
    required NotifyType type,
  }) : super(
          notify: notify,
          type: type,
        );

  factory NotifyModel.fromJson(Map<String, dynamic> json) {
    NotifyType typ;
    switch (json['type']) {
      case "WARNING":
        typ = NotifyType.WARNING;
        break;
      case "MEDAL":
        typ = NotifyType.MEDAL;
        break;
      case "GENERIC":
        typ = NotifyType.GENERIC;
        break;
      case "NEWPROJECT":
        typ = NotifyType.NEWPROJECT;
        break;
      case "UPDATEPROJECT":
        typ = NotifyType.UPDATEPROJECT;
        break;
      default:
        typ = NotifyType.GENERIC;
    }
    return NotifyModel(
      notify: json['notify'],
      type: typ,
    );
  }

  toJson() {
    return {
      "notify": notify,
      "type": type.toString().split(".")[1],
    };
  }
}
