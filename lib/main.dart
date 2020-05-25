import 'package:flutter/material.dart';
import 'package:mediaapp/screens/mainScreen/main_screen.dart';
import 'package:mediaapp/widgets/comment.dart';
import 'package:mediaapp/widgets/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: MainScreen(
            title: "Media", posts: [
          Post(
              image: 'lib/assets/images/photo_2020-05-06_20-24-46.jpg',
              username: 'carl_001',
              comments: [
                new Comment(
                  userName: 'username2',
                  text: 'Cutie',
                ),
                new Comment(
                  userName: 'JohnDoe',
                  text: 'Best one',
                ),
              ],
          likesCount: 105,
            description: 'The best one',
          ),
         Post(
              image: 'lib/assets/images/pancake_cat.jpg',
              username: 'lolita__',
              comments: [
                new Comment(
                  userName: 'jake_0112',
                  text: 'Bacon pancakes',
                ),
              ],
          likesCount: 96,
          )
        ]));
  }
}
