import 'dart:convert';

import 'package:dio_logger/dio_logger.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'user.dart';

class Class9Page extends StatefulWidget {
  const Class9Page({Key? key}) : super(key: key);

  @override
  _Class9PageState createState() => _Class9PageState();
}

class _Class9PageState extends State<Class9Page> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(
                  height: 20,
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
                    getHttp();
                  },
                  child: const Text('Get Data'),
                ),
                const SizedBox(
                  height: 20,
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
                    postHttp();
                  },
                  child: const Text('Post Data'),
                ),
              ],
            ),
    );
  }

  void getHttp() async {
    BaseOptions options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {
        'Authorization': 'Bearer ' + "ibfibfsbdfisd",
        'AuthorizationKey': 'ABC',
        'DeviceType': 'Mobile'
      },
    );
    try {
      final dio = Dio(options);
      dio.interceptors.add(dioLoggerInterceptor);
      setState(() {
        _loading = true;
      });
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      setState(() {
        _loading = false;
      });
      User user = User.fromJson(jsonDecode(response.toString()));
      print(user.toString());
    } catch (e) {
      print(e);
    }
  }

  void postHttp() async {
    BaseOptions options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {
        'Authorization': 'Bearer ' + "ibfibfsbdfisd",
        'AuthorizationKey': 'ABC',
        'DeviceType': 'Mobile'
      },
    );

    try {
      /* Map data = {
        "title": 'foo11',
        "body": 'bar11',
        "userId": 11,
      }; */

      User user = User(id: 11, userId: 22, title: "test123", completed: false);

      final dio = Dio(options);
      dio.interceptors.add(dioLoggerInterceptor);
      setState(() {
        _loading = true;
      });
      Response response = await dio.post(
          'https://jsonplaceholder.typicode.com/posts',
          data: user.toJson());
      setState(() {
        _loading = false;
      });
      //print(response.statusCode);
      //print(response.statusMessage);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
