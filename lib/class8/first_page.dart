import 'package:flutter/material.dart';

import 'second_page.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () async {
            // Navigate to second route when tapped.
            /* Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondRoute(),
                ),
                (Route<dynamic> route) => false); */
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondRoute(
                  name: "Second Page",
                ),
              ),
            );
            if (result != null) {
              print(result);
            } else {
              print("no data");
            }
          },
        ),
      ),
    );
  }
}
