import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({Key key, this.username, this.text}) : super(key: key);
  final username;
  final text;

  Comment.fromJson(Map<String, dynamic> json) : username = json['username'], text = json['text'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'text': text
  };

  @override
  Widget build(BuildContext context) {
    if (text == null) { return new Container(); }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          children: [
             Text(username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
              ),
            ),
          ],
        ),
      );
  }
}
