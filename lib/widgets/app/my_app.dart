import 'package:flutter/material.dart';

import 'package:flutter_hello/widgets/example/example_widget.dart';
import 'package:flutter_hello/widgets/group_form/group_form_widget.dart';
import 'package:flutter_hello/widgets/groups/groups_widget.dart';
import 'package:flutter_hello/widgets/task/task_widget.dart';
import 'package:flutter_hello/widgets/task_form/task_form_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        GroupsWidget.route: (context) => const GroupsWidget(),
        GroupFormWidget.route: (context) => const GroupFormWidget(),
        TaskWidget.route: (context) => const TaskWidget(),
        TaskFormWidget.route: (context) => const TaskFormWidget(),
      },
      initialRoute: GroupsWidget.route,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
