import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/second_page.dart';

class MainPage extends StatelessWidget {
  String takenText;
  static const routeName = '/';

  MainPage({this.takenText = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Main Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Main page'),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SecondPage.routeName),
                  style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
                  child: Text('Next page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400))),
              Text('Place for passed string:'),
              Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue,
                          width: 3,
                          style: BorderStyle.solid)),
                  child: Text('$takenText '))
            ],
          ),
        ));
  }
}
