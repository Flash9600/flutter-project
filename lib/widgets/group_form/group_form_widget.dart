import 'package:flutter/material.dart';
import 'package:flutter_hello/widgets/group_form/group_form_widget_model.dart';

import 'package:flutter_hello/widgets/groups/groups_widget.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({Key? key}) : super(key: key);

  static const route = '${GroupsWidget.route}/form';

  @override
  _GroupFormWidgetState createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final model = GroupFormWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelProvider(
      model: model,
      child: const _GroupFormWidgetBody(),
    );
  }
}

class _GroupFormWidgetBody extends StatelessWidget {
  const _GroupFormWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New group'),
      ),
      body: Center(
        child: Container(
          child: const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _GroupNameWidget(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GroupFormWidgetModelProvider.read(context)?.model.saveGroup(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupFormWidgetModelProvider.read(context)?.model;
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'GroupName',
        hintMaxLines: 1,
      ),
      onChanged: (value) {
        model?.groupName = value;
      },
      onEditingComplete: () {
        model?.saveGroup(context);
      },
    );
  }
}
