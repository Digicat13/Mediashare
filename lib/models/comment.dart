import 'package:flutter/cupertino.dart';

class Comment {
  final username;
  final text;

  const Comment({@required this.username, @required this.text});

  Comment.fromJson(Map<String, dynamic> json) : username = json['username'], text = json['text'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'text': text
  };

}