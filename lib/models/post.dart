import 'package:flutter/cupertino.dart';
import 'package:mediaapp/models/comment.dart';

class Post {
  final String username;
  final String image;
  final String description;
  final int likesCount;
  final List<Comment> comments;

  Post({@required this.username, @required this.image, @required this.likesCount, this.description, this.comments});

  Post.fromJson(Map<String, dynamic> json)
      : username = json['userName'],
        description = json['description'],
        image = json['imageUrl'],
        likesCount = json['likes'],
        comments = List<Comment>.from(json['comments'].map((comment) => Comment.fromJson(comment)));

  Map<String, dynamic> toJson() => {
    'username': username,
    'image': image,
    'description': description,
    'likesCount': likesCount,
    'comments': comments
  };
}