import '../enums/notify_type_enum.dart';

class NotifyEntity {
  final String notify;
  final NotifyType type;
  NotifyEntity({
    required this.notify,
    required this.type,
  });
}
