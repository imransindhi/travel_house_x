import 'package:flutter/material.dart';
import 'package:travel_house_x/screens/login_screen.dart';
import 'package:travel_house_x/screens/splash_screen.dart';

void main() => runApp(new MaterialApp(
  home: new SplashScreen(),
  routes: <String, WidgetBuilder>{
    '/LoginScreen': (BuildContext context) => new LoginScreen()
  },
));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}