import 'package:flutter/material.dart';
import 'package:test_app_sonali/class11/class11_page.dart';
import 'package:test_app_sonali/class12/class12_view.dart';
import 'class10/class10_page.dart';
import 'utils/object_box.dart';


/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Class12View(),
    );
  }
}


