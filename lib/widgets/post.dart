import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/button_section.dart';
import 'package:mediaapp/widgets/image_section.dart';
import 'package:mediaapp/widgets/comments_section.dart';
import 'package:mediaapp/widgets/comment.dart';
import 'package:mediaapp/widgets/title_section.dart';

class Post extends StatefulWidget {
  Post(
      {Key key, this.title, this.username, this.description, this.image})
      : super(key: key);

  final String title;
  final String username;
  final String image;
  final String description;
  List<Comment> comments;

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleSection(userName: "ada",),
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
          Expanded(
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
