import 'package:flutter/cupertino.dart';

class Comment {
  final String username;
  final String text;

  const Comment({@required this.username, @required this.text});

  Comment.fromJson(Map<String, dynamic> json) : username = json['userName'], text = json['text'];

  Map<String, dynamic> toJson() => {
    'userName': username,
    'text': text
  };

}