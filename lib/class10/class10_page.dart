import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Class10Page extends StatefulWidget {
  const Class10Page({Key? key}) : super(key: key);

  @override
  _Class10PageState createState() => _Class10PageState();
}

class _Class10PageState extends State<Class10Page> {
  String? data = "";
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString("my_key", data!);
                debugPrint("data saved");
              },
              child: const Text("Save Text"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await storage.write(key: "my_key", value: data!);
                debugPrint("secure data saved");
              },
              child: const Text("Save Secure Text"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(data!),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                    data = prefs.getString("my_key");
                });              
              },
              child: const Text("Get Text"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                String? value = await storage.read(key: "my_key");
                setState(() {
                    data = value;
                });              
              },
              child: const Text("Get Secure Text"),
            ),
          ],
        ),
      ),
    );
  }
}
