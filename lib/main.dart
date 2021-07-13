import 'package:flutter/material.dart';

// import 'package:flutter_hello/drawer.dart';
// import 'package:flutter_hello/bottom_bar.dart';
// import 'package:flutter_hello/navigator.dart';
import 'package:flutter_hello/pages/main_page.dart';
//import 'package:flutter_hello/pages/second_page.dart';
import 'pages/second_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo',
    initialRoute: MainPage.routeName,
    routes: {
      MainPage.routeName: (context) => MainPage(),
      SecondPage.routeName: (context) => SecondPage()
    },
    debugShowCheckedModeBanner: false,
  ));
}

// class MainScaffold extends StatelessWidget {
//   const MainScaffold({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Flutter.su')),
//         body: NavigatorApp(),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () {},
//             backgroundColor: Colors.blue,
//             splashColor: Colors.red,
//             child: Icon(Icons.add)),
//         drawer: MainDrawer(),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomBar());
//   }
// }
