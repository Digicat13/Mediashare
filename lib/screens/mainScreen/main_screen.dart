import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/button_section.dart';
import 'package:mediaapp/widgets/image_section.dart';
import 'package:mediaapp/widgets/comments_section.dart';
import 'package:mediaapp/widgets/comment.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          imageSection,
          ButtonSection(likesCount: 35),
          Comment(
            userName: 'usernameee',
            text: 'Cutie caty ',
          ),
//          CommentsSection(),
          SizedBox(
            height: 200.0,
            child: CommentsSection(
              comments: [
                new Comment(
                  userName: 'usernameee',
                  text: 'Cutie caty ',
                ),
                new Comment(
                  userName: 'usernameee2',
                  text: 'So lovely',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
