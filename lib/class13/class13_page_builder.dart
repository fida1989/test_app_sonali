import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';

class Class13BuilderPage extends StatefulWidget {
  const Class13BuilderPage({Key? key}) : super(key: key);

  @override
  _Class13BuilderPageState createState() => _Class13BuilderPageState();
}

class _Class13BuilderPageState extends State<Class13BuilderPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("main build");
    return Scaffold(
      body: Center(
        child: AsyncBuilder<String>(
          future: getData(),
          waiting: (context) => const Text('Loading...'),
          builder: (context, value) => Text('$value'),
          error: (context, error, stackTrace) => Text('Error! $error'),
        ),
      ),
    );
  }

  Future<String> getData() {
    return Future.delayed(const Duration(seconds: 3), () {
      return "I am data";
      // throw Exception("Custom Error");
    });
  }
}
