import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final String name;
  const SecondRoute({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context,"Hello");
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
