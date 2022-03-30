import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  void navigationToNextPage() {
    Modular.to.navigate('/auth/');
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationToNextPage);
  }
}
