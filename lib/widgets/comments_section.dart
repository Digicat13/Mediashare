import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/comment.dart';


class CommentsSection extends StatefulWidget {
  CommentsSection({this.comments});
  final List<Comment> comments;

  @override
  CommentsSectionState createState() =>
      CommentsSectionState(comments: comments);
}

class CommentsSectionState extends State<CommentsSection> {
  CommentsSectionState({this.comments});
  List<Comment> comments;

  @override // Add from this line ...
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showComments(comments: comments),
    );
  }
}

Widget _showComments({List<Widget> comments}) {
  if (comments != null) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,

      itemCount: comments.length,
      itemBuilder: (BuildContext _context, int i) {
        return comments[i];
      },
    );
  }
  else return null;
}
