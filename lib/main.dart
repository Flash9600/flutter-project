import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: scaffold));
}

var scaffold =
    Scaffold(appBar: AppBar(title: Text('Flutter.su')), body: MyBody());

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Hello world'),
          ElevatedButton(
              onPressed: () async {
                print('object');
                const url = 'https://flutter.dev';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  var error = await canLaunch(url);
                  print(error);
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.red[800]),
              child: Text('open new world',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)))
        ],
      ),
    );
  }
}
