import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? title;

  const DetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("1234"),
      ),
      body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.amber,
          child: Center(child: Text('Hello$index')),
        );
      }
    ),
      
    );
  }
}
