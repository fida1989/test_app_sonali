import 'package:flutter/material.dart';

import '../details_page.dart';

class Class7Page extends StatefulWidget {
  const Class7Page({Key? key}) : super(key: key);

  @override
  _Class7PageState createState() => _Class7PageState();
}

class _Class7PageState extends State<Class7Page> {
  bool _showBottomSheet = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomSheet: _showBottomSheet
              ? BottomSheet(
                  elevation: 10,
                  backgroundColor: Colors.amber,
                  onClosing: () {
                    // Do something
                  },
                  builder: (BuildContext ctx) => Container(
                        width: double.infinity,
                        height: 250,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text(
                            'Close this bottom sheet',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              _showBottomSheet = false;
                            });
                          },
                        ),
                      ))
              : null,
          drawer: Drawer(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("Item 1"),
                ),
                ListTile(
                  title: Text("Item 1"),
                ),
                ListTile(
                  title: Text("Item 1"),
                ),
                ListTile(
                  title: Text("Item 1"),
                )
              ],
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _showMyDialog();
                },
              )
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DetailsPage(
                title: "Test",
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          )),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset("assets/dailyscrum.png",width: 300,height: 100,fit: BoxFit.fill,),
                 Text('This is a demo alert dialog.',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                 SizedBox(
                   height: 10,
                 ),
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
                Row(
                  children: [
                    TextButton(
                      child: const Text('Approve'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        
          /* actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ], */
        );
      },
    );
  }
}
