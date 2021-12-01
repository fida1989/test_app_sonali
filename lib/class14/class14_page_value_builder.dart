import 'package:flutter/material.dart';

class Class14ValueBuilderPage extends StatefulWidget {
  const Class14ValueBuilderPage({Key? key}) : super(key: key);

  @override
  _Class14ValueBuilderPageState createState() =>
      _Class14ValueBuilderPageState();
}

class _Class14ValueBuilderPageState extends State<Class14ValueBuilderPage> {
  final ValueNotifier<String> _dateTime = ValueNotifier<String>("");

  @override
  void dispose() {
    _dateTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("main build");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _dateTime,
              builder: (context, value, child) {
                debugPrint(value.toString());
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                _dateTime.value = DateTime.now().toString();
              },
              child: const Text("Update Value"),
            ),
          ],
        ),
      ),
    );
  }
}
