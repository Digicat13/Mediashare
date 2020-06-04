import 'package:flutter/material.dart';
import 'package:mediaapp/models/comment.dart';

class CommentSection extends StatelessWidget {
  final Comment comment;
  const CommentSection({Key key,  @required this.comment }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (comment.text == null) { return  Container(); }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          children: [
             Text(comment.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                comment.text,
              ),
            ),
          ],
        ),
      );
  }
}
