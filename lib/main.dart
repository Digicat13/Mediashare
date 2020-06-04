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
    List<dynamic> postsMap = jsonDecode(
        """[
   {
      "image":"assets/images/photo_2020-05-06_20-24-46.jpg",
      "username":"carl_001",
      "description":"The best one",
      "comments":[
         {
            "username":"username2",
            "text":"Cutie"
         },
         {
            "username":"JohnDoe",
            "text":"Best one"
         }
      ],
      "likesCount":10
   },
   {
      "image":"assets/images/pancake_cat.jpg",
      "username":"lolita__",
      "comments":[
         {
            "username":"jake_0112",
            "text":"Bacon pancakes"
         }
      ],
      "likesCount":10
   }
]""");
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: MainScreen(title: "Media", posts: postsMap
            ));
  }
}
