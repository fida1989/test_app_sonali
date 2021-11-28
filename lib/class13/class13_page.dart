import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app_sonali/utils/eventbus_utils.dart';

import 'class13_page2.dart';
import 'time_event.dart';

class Class13Page extends StatefulWidget {
  const Class13Page({Key? key}) : super(key: key);

  @override
  _Class13PageState createState() => _Class13PageState();
}

class _Class13PageState extends State<Class13Page> {
  late StreamSubscription _timeSubscription;

  String _value = "";

  @override
  void initState() {
    super.initState();
    _timeSubscription =
        EventBusUtils.getInstance().on<TimeEvent>().listen((event) {
      debugPrint(event.time);
      setState(() {
        _value = event.time;
      });
    });
  }

  @override
  void dispose() {
    _timeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(_value),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Class13Page2(),
                    ),
                  );
                },
                child: const Text("2nd Page"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
