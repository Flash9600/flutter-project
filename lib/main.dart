import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: scaffold));
}

var scaffold = Scaffold(
    appBar: AppBar(title: Text('Flutter.su')),
    body: MyBody(),
    floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        splashColor: Colors.red,
        child: Icon(Icons.add)),
    drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('My first Drawer',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            title: Text('item 1'),
            hoverColor: Colors.blue,
          )
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: IconTheme(
                data: IconThemeData(color: Colors.white, size: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                      ],
                    )
                  ],
                )))));

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
