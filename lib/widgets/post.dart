import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/button_section.dart';
import 'package:mediaapp/widgets/image_section.dart';
import 'package:mediaapp/widgets/comments_section.dart';
import 'package:mediaapp/widgets/comment.dart';
import 'package:mediaapp/widgets/title_section.dart';

class Post extends StatefulWidget {
  Post(
      {Key key,
      this.username,
      this.description,
      this.image,
      this.likesCount,
      this.comments})
      : super(key: key);

  final String username;
  final String image;
  final String description;
  final int likesCount;
  List<Comment> comments;

  @override
  _PostState createState() => _PostState(
      image: image,
      username: username,
      description: description,
      likesCount: likesCount,
      comments: comments
  );
}

class _PostState extends State<Post> {
  _PostState({this.username, this.description, this.image, this.likesCount, this.comments});

  final String username;
  final String image;
  final String description;
  final int likesCount;
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TitleSection(userName: username),
          ImageSection(image: image),
          ButtonSection(likesCount: likesCount),
          if (description != null)
            Comment(userName: username, text: description),
          Container(
            child: CommentsSection(
              comments: comments,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
