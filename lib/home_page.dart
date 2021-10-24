import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<String> entries = ['AAA', 'BBB', 'CCC', 'DDD'];
  List<String> entries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          entries = ['AAA', 'BBB', 'CCC', 'DDD'];
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: !isLoading
          ? (entries.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        debugPrint(entries[index]);
                      },
                      child: Container(
                        color: Colors.grey,
                        height: 50,
                        width: 100,
                        child: Center(child: Text('Entry ${entries[index]}')),
                      ),
                    );
                  })
              : const Center(
                  child: Text("No Data!"),
                ))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
