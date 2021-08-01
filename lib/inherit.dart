import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart' as pathProvider;

class Model extends ChangeNotifier {
  void readFile() async {
    final directory = await pathProvider.getApplicationDocumentsDirectory();
    final filePath = directory.path + '/my_file';
    print(filePath);
    final file = File(filePath);
    await file.writeAsString('Hello world!');
    final isExist = await file.exists();
    print(isExist);
  }
}

class InheritedWidgetProvider extends InheritedNotifier<Model> {
  final Model model;

  const InheritedWidgetProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child, notifier: model);

  static InheritedWidgetProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedWidgetProvider>();
}
