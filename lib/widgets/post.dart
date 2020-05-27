import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/button_section.dart';
import 'package:mediaapp/widgets/image_section.dart';
import 'package:mediaapp/widgets/comments_section.dart';
import 'package:mediaapp/widgets/comment.dart';
import 'package:mediaapp/widgets/title_section.dart';

class Post extends StatefulWidget {
  Post({Key key}) : super(key: key);

  String username;
  String image;
  String description;
  int likesCount;
  List<dynamic> comments;
  String jsonString;

  Post.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        description = json['description'],
        image = json['image'],
        likesCount = json['likesCount'],
        comments = json['comments'];

  @override
  _PostState createState() => _PostState();

  Map<String, dynamic> toJson() => {
    'username': username,
    'image': image,
    'description': description,
    'likesCount': likesCount,
    'comments': comments
  };
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleSection(userName: widget.username),
        ImageSection(image: widget.image),
        ButtonSection(likesCount: widget.likesCount),
        if (widget.description != null)
          Comment(username: widget.username, text: widget.description),
        CommentsSection(
          comments: widget.comments,
        ),
      ], // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
