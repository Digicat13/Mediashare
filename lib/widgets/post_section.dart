import 'package:flutter/material.dart';
import 'package:mediaapp/models/comment.dart';
import 'package:mediaapp/models/post.dart';
import 'package:mediaapp/widgets/button_section.dart';
import 'package:mediaapp/widgets/image_section.dart';
import 'package:mediaapp/widgets/comments_section.dart';
import 'package:mediaapp/widgets/comment_section.dart';
import 'package:mediaapp/widgets/title_section.dart';

class PostSection extends StatefulWidget {
  Post post;
  PostSection({Key key, @required this.post}) : super(key: key);

  @override
  _PostSectionState createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleSection(userName: widget.post.username),
        ImageSection(image: widget.post.image),
        ButtonSection(likesCount: widget.post.likesCount),
        if (widget.post.description != null)
          CommentSection(comment: new Comment(username: widget.post.username, text: widget.post.description)),
        if(widget.post.comments != null)
        CommentsSection(
          comments: widget.post.comments,
        ),
      ], // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
