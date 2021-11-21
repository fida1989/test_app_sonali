import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test_app_sonali/class12/class12_interface.dart';
import 'package:test_app_sonali/class12/class12_presenter.dart';

class Class12View extends StatefulWidget {
  const Class12View({Key? key}) : super(key: key);

  @override
  _Class12ViewState createState() => _Class12ViewState();
}

class _Class12ViewState extends State<Class12View> implements Class12Interface {
  String _time = "Click Me";
  late Class12Presenter _presenter;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      _presenter = Class12Presenter(this);
      //_presenter.getTime();
    });
  }

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
              ElevatedButton(
                onPressed: () async {
                  _presenter.getTime();
                },
                child: Text(_time),
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

  @override
  void onDataError(String message) {
    // TODO: implement onDataError
  }

  @override
  void onDataSuccess(String data) {
    setState(() {
      _time = data;
    });
  }
}
