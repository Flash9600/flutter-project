import 'package:flutter/material.dart';

import 'package:flutter_hello/widgets/task/task_widget.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({Key? key}) : super(key: key);

  static const route = TaskWidget.route + 'form';

  @override
  _TaskFormWidgetState createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
