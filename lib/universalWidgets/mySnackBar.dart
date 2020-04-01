import 'package:flutter/material.dart';

const Duration defaultDuration = Duration(seconds: 5);

void mySnackBar(
    GlobalKey<ScaffoldState> key, String message, Color color, bool mounted,
    {Duration duration = defaultDuration}) {
  final snackBar = new SnackBar(
      content: new Text(message ?? ""),
      backgroundColor: color,
      duration: duration);

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  if (mounted) key.currentState.showSnackBar(snackBar);
}
