import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/comment.dart';

class CommentsSection extends StatelessWidget {
  CommentsSection({this.comments});
  final List<dynamic> comments;

  @override
  Widget build(BuildContext context) {
    if (comments == null) {
      return Container();
    }
    return new ListView.builder(
      padding: const EdgeInsets.all(0.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (BuildContext _context, int i) {
        return Comment.fromJson(comments[i]);
      },
    );
  }
}
