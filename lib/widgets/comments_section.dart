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

  @override
  Widget build(BuildContext context) {
    return _showComments(comments: comments);
  }

  Widget _showComments({List<Widget> comments}) {
    if (comments != null) {
      return new ListView.builder(
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: comments.length,
        itemBuilder: (BuildContext _context, int i) {
//          return Container(child: comments[i]);
          return comments[i];
        },
      );
    } else {
      return Container();
    }
  }

}


