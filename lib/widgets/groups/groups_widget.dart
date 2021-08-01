import 'package:flutter/material.dart';

import 'package:flutter_hello/widgets/group_form/group_form_widget.dart';
import 'package:flutter_hello/widgets/groups/groups_widget_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  static const route = '/groups';

  @override
  _GroupsWidgetState createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final model = GroupsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(
      model: model,
      child: const _GroupWidgetBody(),
    );
  }
}

class _GroupWidgetBody extends StatelessWidget {
  const _GroupWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: const _GroupListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GroupsWidgetModelProvider.read(context)?.model.showForm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _GroupListWidget extends StatelessWidget {
  const _GroupListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsWidgetModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _GroupListRowWidget(
        indexInList: index,
      ),
      itemCount: groupsCount,
    );
  }
}

class _GroupListRowWidget extends StatelessWidget {
  final int indexInList;
  const _GroupListRowWidget({Key? key, required this.indexInList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelProvider.read(context)!.model;
    final group = model.groups[indexInList];
    return Slidable(
      actionPane: const SlidableStrechActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => model.deleteGroup(indexInList),
        ),
      ],
      child: Card(
        color: Colors.grey[200],
        child: ListTile(
          title: Text('${group.name}'),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () {},
        ),
      ),
    );
  }
}
