import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:mediaapp/screens/mainScreen/no_internet_screen.dart';

class ConnectivityService {
  Future<bool> checkInternetConnection(BuildContext context) async {
    bool hasConnection = await DataConnectionChecker().hasConnection;
        DataConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case DataConnectionStatus.connected:
//        Navigator.pop(context);
          break;
        case DataConnectionStatus.disconnected:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoInternetScreen()),
        );
          break;
      }
    });
    return hasConnection;
  }
}

