import 'package:flutter/material.dart';
import 'package:pharus/features/home/home_page.dart';
import 'package:pharus/features/splashscreen/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pharus',
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashPage(),
        '/home': (BuildContext context) =>  const HomePage(title: 'Flutter Pharus',),
      },
    );
  }
}

