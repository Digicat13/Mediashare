import 'package:flutter/cupertino.dart';

class Post {
  final String username;
  final String image;
  final String description;
  final int likesCount;
  final List<dynamic> comments;

  Post({@required this.username, @required this.image, @required this.likesCount, this.description, this.comments});

  Post.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        description = json['description'],
        image = json['image'],
        likesCount = json['likesCount'],
        comments = json['comments'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'image': image,
    'description': description,
    'likesCount': likesCount,
    'comments': comments
  };
}