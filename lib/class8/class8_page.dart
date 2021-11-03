import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Class8Page extends StatefulWidget {
  const Class8Page({Key? key}) : super(key: key);

  @override
  _Class8PageState createState() => _Class8PageState();
}

class _Class8PageState extends State<Class8Page> {
  late StreamSubscription subscription;

  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      // Got a new connectivity status!
      String connectionType = "";
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
        connectionType = "mobile";
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        connectionType = "wifi";
      } else {
        connectionType = "none";
      }
      print(connectionType);
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("Show SnackBar"),
          onPressed: () async {
            String connectionType = "";
            var connectivityResult = await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.mobile) {
              // I am connected to a mobile network.
              connectionType = "mobile";
            } else if (connectivityResult == ConnectivityResult.wifi) {
              // I am connected to a wifi network.
              connectionType = "wifi";
            } else {
              connectionType = "none";
            }

            SnackBar snackBar = SnackBar(
              content: Text(connectionType),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
