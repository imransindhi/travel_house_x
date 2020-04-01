import 'package:flutter/material.dart';
import 'package:travel_house_x/screens/HomeScreen.dart';
import 'package:travel_house_x/screens/LoginScreen.dart';
import 'package:travel_house_x/screens/SplashScreen.dart';

void main() => runApp(new MaterialApp(
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => new LoginScreen(),
        '/HomeScreen': (BuildContext context) => new HomeScreen()
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
