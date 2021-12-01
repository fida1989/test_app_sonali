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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AsyncBuilder<String>(
              future: getData1(),
              waiting: (context) => const Text('Loading...'),
              builder: (context, value) {
                 debugPrint("builder 1");
                return Text('$value');
              },
              error: (context, error, stackTrace) => Text('Error! $error'),
            ),
            AsyncBuilder<String>(
              future: getData2(),
              waiting: (context) => const Text('Loading...'),
              builder: (context, value) {
                debugPrint("builder 2");
                return Text('$value');
              },
              error: (context, error, stackTrace) => Text('Error! $error'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getData1() {
    return Future.delayed(const Duration(seconds: 3), () {
      return "I am data 1";
      // throw Exception("Custom Error");
    });
  }

  Future<String> getData2() {
    return Future.delayed(const Duration(seconds: 6), () {
      return "I am data 2";
      // throw Exception("Custom Error");
    });
  }
}
