import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:opolah/ui/pages/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Barlow'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomSplash(
          imagePath: 'assets/images/logo.png',
          home: LandingPage(),
          animationEffect: 'zoom-in',
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
