import 'package:flutter/material.dart';
import 'package:flutter_hello/domain/entity/group.dart';
import 'package:hive/hive.dart';

class GroupFormWidgetModel {
  var _groupName = '';

  set groupName(value) => _groupName = value;
  get groupName => _groupName;

  void saveGroup(BuildContext context) async {
    if (_groupName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    ;
    final box = await Hive.openBox<Group>('groups_box');
    final group = Group(name: _groupName);
    await box.add(group);
    Navigator.of(context).pop();
  }
}

class GroupFormWidgetModelProvider extends InheritedWidget {
  final GroupFormWidgetModel model;

  const GroupFormWidgetModelProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static GroupFormWidgetModelProvider? watch(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();

  static GroupFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupFormWidgetModelProvider>()
        ?.widget;
    return widget is GroupFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
