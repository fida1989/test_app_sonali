import 'package:flutter/material.dart';
import 'package:test_app_sonali/class11/user.dart';
import 'package:test_app_sonali/main.dart';

class Class11Page extends StatefulWidget {
  const Class11Page({Key? key}) : super(key: key);

  @override
  _Class11PageState createState() => _Class11PageState();
}

class _Class11PageState extends State<Class11Page> {
  late String data;

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
              TextField(
                onChanged: (value) {
                  data = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final userBox = objectbox.store.box<User>();
                  final user = User(name: data);
                  userBox.put(user);
                  debugPrint("user saved");
                },
                child: const Text("Save User"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final userBox = objectbox.store.box<User>();
                  final List<User> users = userBox.getAll();
                  for (var element in users) {
                    print(element.name);
                  }
                },
                child: const Text("Get Users"),
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
