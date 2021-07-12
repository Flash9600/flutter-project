import 'package:flutter/material.dart';

// import 'package:flutter_hello/drawer.dart';
// import 'package:flutter_hello/bottom_bar.dart';
// import 'package:flutter_hello/navigator.dart';
import 'package:flutter_hello/pages/main_page.dart';
//import 'package:flutter_hello/pages/second_page.dart';
import 'constants/router_arguments.dart';
import 'pages/second_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo',
    initialRoute: '/',
    routes: {SecondPage.routeName: (context) => SecondPage()},
    onGenerateRoute: (settings) {
      if (settings.name == MainPage.routeName) {
        final arguments = settings.arguments != null
            ? settings.arguments as RouterArguments
            : RouterArguments('');
        return MaterialPageRoute<Widget>(
            builder: (context) => MainPage(takenText: arguments.text));
      }
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
