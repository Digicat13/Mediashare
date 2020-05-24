import 'package:flutter/material.dart';

class LikesSection extends  StatefulWidget {
  @override
  LikesSectionState createState() => LikesSectionState();
}

class LikesSectionState extends State<LikesSection> {
  @override                                  // Add from this line ...
  Widget build(BuildContext context) {
    return Text('likes');
  }
}