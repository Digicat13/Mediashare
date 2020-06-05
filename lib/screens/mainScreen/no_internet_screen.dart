import 'package:flutter/material.dart';
import 'package:mediaapp/components/outlined_button.dart';
import 'package:mediaapp/services/connectivity_service.dart';

class NoInternetScreen extends StatefulWidget {
  NoInternetScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    Widget body;

    body = Container(
        child: Column(children: [
      Expanded(
        child: Center(
            child: Icon(Icons.cloud_off, size: 100, color: Colors.cyan[200])),
      ),
      Expanded(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: Text("No internet Connection",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ))),
          Container(
              width: 280,
              child: Text(
                "Please check your internet connection and try again",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              )),
          Container(
              padding: const EdgeInsets.all(50),
              child: OutlinedButton(
                text: "Try Again",
                onPressed: checkConnection,
              ))
        ],
      )),
    ]));

    return Scaffold(
      backgroundColor: Colors.black45,
      body: body,
    );
  }

  checkConnection() async {
    ConnectivityService connectivityService =  new ConnectivityService();
      bool isInternet = await connectivityService.checkInternetConnection(context);
      if(isInternet) {
        Navigator.pop(context);
      }
  }
}
