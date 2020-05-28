import 'package:flutter/material.dart';
import 'package:mediaapp/models/post.dart';
import 'package:mediaapp/widgets/post_section.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title, this.posts}) : super(key: key);

  final String title;
  final List<dynamic> posts;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    if (widget.posts == null || widget.posts.length == 0) {
      return new SpinKitFadingFour(
        color: Colors.white,
        size: 50.0,
      );
    }

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.white10,
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
      body: _showPosts(widget.posts),
    );
  }

  Widget _showPosts(posts) {
    return new ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(PostSection(post: Post.fromJson(posts[i])));
        });
  }

  _buildRow(PostSection post) {
    return new Container(
        padding: const EdgeInsets.only(bottom: 10), child: post);
  }

  onAddNewPost() {}
}
