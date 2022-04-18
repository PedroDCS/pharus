import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  void navigationToNextPage() {
    Modular.to.navigate('/auth/');
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 3);
    await Firebase.initializeApp();
    return Timer(_duration, navigationToNextPage);
  }
}
