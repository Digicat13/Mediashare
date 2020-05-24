import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({Key key, this.userName, this.text}) : super(key: key);
  final userName;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            child: Text(userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
