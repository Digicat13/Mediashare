import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mediaapp/screens/mainScreen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MainScreen(
        title: "Media",
      ),
    );
  }
}
