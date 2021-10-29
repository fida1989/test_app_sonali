import 'package:flutter/material.dart';

class Class6Page extends StatefulWidget {
  const Class6Page({Key? key}) : super(key: key);

  @override
  _Class6PageState createState() => _Class6PageState();
}

class _Class6PageState extends State<Class6Page> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CLass 6"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.car_rental,
              color: Colors.green,
              size: 50,
            ),
            IconButton(
              onPressed: () {
                debugPrint("iconbutton click");
              },
              icon: const Icon(
                Icons.car_repair,
                color: Colors.red,
                size: 50,
              ),
            ),
            GestureDetector(
              onTap: () {
                print("ontap");
              },
              onDoubleTap: () {
                print("ondoubletap");
              },
              onLongPress: () {
                print("onlongpres");
              },
              child: Image.asset(
                "assets/dailyscrum.png",
                height: 150,
                width: 300,
                fit: BoxFit.scaleDown,
              ),
            ),
            InkWell(
              onTap: () {
                print("ontap");
              },
              child: Container(
                height: 150,
                width: 300,
                child: Image.asset(
                  "assets/dailyscrum.png",
                  height: 150,
                  width: 150,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Image.network(
              "https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659652_960_720.png",
              height: 150,
              width: 300,
              fit: BoxFit.scaleDown,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("raised button");
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              child: const Text('Enabled'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('outline button click');
              },
              child: const Text('Click Me'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                debugPrint("text button");
                print(myController.text);
                myController.clear();
              },
              child: const Text('This Is A Text Button'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mobile_friendly),
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
                onChanged: (value) {
                  print(value);
                },
                controller: myController,
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("floating action button");
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
