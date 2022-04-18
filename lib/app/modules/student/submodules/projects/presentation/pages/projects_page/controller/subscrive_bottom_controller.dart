import 'package:flutter/cupertino.dart';

class SubscriveController {
  ValueNotifier<bool> isSubcribed = ValueNotifier(false);

  chageSubscrive(bool issub) {
    isSubcribed.value = issub;
  }
}
