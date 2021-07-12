import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/main_page.dart';

class NavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
        observers: [],
        onGenerateRoute: (settings) => PageRouteBuilder<Widget>(
            settings: settings, pageBuilder: (_, __, ___) => MainPage()));
  }
}
