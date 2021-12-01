import 'dart:async';

import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Class14BuilderPage extends StatefulWidget {
  const Class14BuilderPage({Key? key}) : super(key: key);

  @override
  _Class14BuilderPageState createState() => _Class14BuilderPageState();
}

class _Class14BuilderPageState extends State<Class14BuilderPage> {
  StreamController<List<String>> dateTime = StreamController();
  late Timer timer;
  final List<String> _values = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      const oneSec = Duration(seconds: 2);
      timer = Timer.periodic(oneSec, (Timer t) {
        _values.add(DateTime.now().toString());
        dateTime.add(_values);
      });
    });
  }

  @override
  void dispose() {
    dateTime.close();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("main build");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AsyncBuilder<List<String>>(
          stream: dateTime.stream,
          waiting: (context) => const Text('Waiting...'),
          builder: (context, value) {
            debugPrint("builder 1 $value");
            //return Text('$value');
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: value!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(value[index]);
                });
          },
          error: (context, error, stackTrace) => Text('Error! $error'),
        ),
      ),
    );
  }
}
