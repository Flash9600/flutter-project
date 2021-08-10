import 'package:flutter/material.dart';

import 'package:flutter_hello/widgets/groups/groups_widget.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  static const route = GroupsWidget.route + '/tasks';

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
