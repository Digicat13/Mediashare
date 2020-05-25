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
          title: Text(widget.title),
        ),
        body: Text('Hi') ,
//        body: _showPosts(posts)
//      body: ListView(
//        children: [
//          SizedBox(
//            height: 600,
//            child: Post(),
//          ),
//        ],
//      ),
        );
  }

  Widget _showPosts(posts) {
    if (posts != null) {
      return new ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext _context, int i) {
            return posts[i];
          });
    } else {
      return new Container();
    }
  }
}
