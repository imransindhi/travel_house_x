import 'package:flutter/material.dart';
import 'package:travel_house_x/screens/login_screen.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
  home: LoginScreen(),
    );
  }
}