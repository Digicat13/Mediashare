import 'package:flutter/material.dart';
import 'package:mediaapp/widgets/post.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title, this.posts}) : super(key: key);

  final String title;
  final List<Post> posts;

  @override
  _MainScreenState createState() => _MainScreenState(posts: posts);
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState({this.posts});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Stack(alignment: Alignment.center, children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(Icons.photo_camera), onPressed: onAddNewPost),
            ),
          ]),
        ),
        body: _showPosts(posts));
  }

  Widget _showPosts(posts) {
    if (posts != null) {
      return new ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (BuildContext _context, int i) {
            return _buildRow(posts[i]);
          });
    } else {
      return new Container();
    }
  }

  _buildRow(Post post) {
    return new Container(
        padding: const EdgeInsets.only(bottom: 10), child: post);
  }

  onAddNewPost() {}
}
