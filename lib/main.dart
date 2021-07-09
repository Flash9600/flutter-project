import 'package:flutter/material.dart';

void main() {
runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: scaffold
  )
);
}

var scaffold = new Scaffold(
    appBar: new AppBar(title: new Text('Flutter.su')),
    body: new Center(
      child: new Column(
        children: [new Text('Hello world'), new TextButton(onPressed: (){}, child: new Text('open site'))],
      ),
    )
);

class MyBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
