import 'package:flutter/material.dart';

class Class15Page extends StatefulWidget {
  const Class15Page({ Key? key }) : super(key: key);

  @override
  _Class15PageState createState() => _Class15PageState();
}

class _Class15PageState extends State<Class15Page> {
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
              const Text("Class 15"),
               const Text("Class 15"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                
                },
                child: const Text("Button"),
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