import 'package:flutter/material.dart';
import 'package:mediaapp/models/post.dart';
import 'package:mediaapp/widgets/post_section.dart';
import 'package:connectivity/connectivity.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title, this.posts}) : super(key: key);

  final String title;
  final List<dynamic> posts;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _tryConnection = false;

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  @override
  Widget build(BuildContext context) {
//    if (widget.posts == null || widget.posts?.length == 0) {
//
////      return new SpinKitFadingFour(
////        color: Colors.white,
////        size: 50.0,
////      );
//    }

    bool postAvailable = !(widget.posts == null || widget.posts?.length == 0);
    Widget body;

    if (!postAvailable) {
      body = Container(
        child: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nothing to display"),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RaisedButton(
                    child: const Text('Try again'),
                    onPressed: () => _fetchPosts(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      body = _showPosts(widget.posts);
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
      //body: _showPosts(widget.posts),
      body: body,
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

   _checkConnection() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    bool connectedToInternet = !(connectivityResult == ConnectivityResult.none);
    if (!connectedToInternet) {
      String message = 'No connection to the internet';
      _showAlert(context, message);
    }
    if (_tryConnection != !connectedToInternet) {
      setState(() => _tryConnection = !connectedToInternet);
    }
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
              content: Text(message),
            ));
  }

   _fetchPosts() {
     _checkConnection();

    bool available = _checkPostAvailability();
    if (available) {
       return _showPosts(widget.posts);
    }
    _showAlert(context, "Couldn't refresh feed");
  }

  bool _checkPostAvailability() {
    return !(widget.posts == null || widget.posts?.length == 0);
  }
}
