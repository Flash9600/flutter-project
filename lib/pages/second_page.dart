import 'package:flutter/material.dart';
import 'package:flutter_hello/constants/router_arguments.dart';

import 'package:flutter_hello/pages/main_page.dart';

class SecondPage extends StatelessWidget {
  static const routeName = '/second-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Second Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Second Page'),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, MainPage.routeName,
                      arguments: RouterArguments('Hello World!')),
                  style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
                  child: Text('transfer text to main page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400))),
            ],
          ),
        ));
  }
}
