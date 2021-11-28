import 'package:flutter/material.dart';
import 'package:test_app_sonali/class13/time_event.dart';
import 'package:test_app_sonali/utils/eventbus_utils.dart';

class Class13Page2 extends StatefulWidget {
  const Class13Page2({Key? key}) : super(key: key);

  @override
  _Class13Page2State createState() => _Class13Page2State();
}

class _Class13Page2State extends State<Class13Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2nd Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  EventBusUtils.getInstance()
                      .fire(TimeEvent(DateTime.now().toString()));
                },
                child: const Text("Send Event"),
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
