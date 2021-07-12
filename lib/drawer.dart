import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('My first Drawer',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            title: Text('item 1'),
            hoverColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
