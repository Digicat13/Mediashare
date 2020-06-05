import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediaapp/components/outlined_button.dart';
import 'package:mediaapp/models/post.dart';
import 'package:mediaapp/services/connectivity_service.dart';
import 'package:mediaapp/services/post_service.dart';
import 'package:mediaapp/widgets/post_section.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> posts = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    new ConnectivityService().checkInternetConnection(context);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nothing to display",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: OutlinedButton(
                  text: 'Try again',
                  onPressed: _fetchData,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (posts.length != 0) {
      body = _showPosts(posts);
    }

    if (loading) {
      body = _loadingSpin();
    }

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Row(children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(Icons.photo_camera), onPressed: onAddNewPost),
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: Container()),
        ]),
      ),
      body: body,
    );
  }

  Widget _showPosts(posts) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(PostSection(post: Post.fromJson(posts[i])));
        });
  }

  Widget _buildRow(PostSection post) {
    return Container(padding: const EdgeInsets.only(bottom: 10), child: post);
  }

  onAddNewPost() {}

  Future _fetchData() async {
    String url = "https://5b27755162e42b0014915662.mockapi.io/api/v1/posts";
    try {
      loading = true;
      var response = await Dio().get(url);
//      List<dynamic> data = response.data;
      List<dynamic> data = jsonDecode("""[
   {
      "imageUrl":"assets/images/photo_2020-05-06_20-24-46.jpg",
      "userName":"carl_001",
      "description":"The best one",
      "comments":[
         {
            "userName":"username2",
            "text":"Cutie"
         },
         {
            "userName":"JohnDoe",
            "text":"Best one"
         }
      ],
      "likes":10
   },
   {
      "imageUrl":"assets/images/pancake_cat.jpg",
      "userName":"lolita__",
      "comments":[
         {
            "userName":"jake_0112",
            "text":"Bacon pancakes"
         }
      ],
      "likes":10
   }
]""");
      setState(() {
        posts = data;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e);
    }
  }

  _loadingSpin() {
    return SpinKitFadingFour(
      color: Colors.white,
      size: 50.0,
    );
  }
}
