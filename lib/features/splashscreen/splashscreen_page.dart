import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo_ioasys.png',
            ),
            const Text(
              'Pharus',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
