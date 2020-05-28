import 'package:flutter/cupertino.dart';

class Post {
  String username;
  String image;
  String description;
  int likesCount;
  List<dynamic> comments;

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