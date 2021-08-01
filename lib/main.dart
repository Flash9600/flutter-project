import 'package:flutter/material.dart';

import 'inherit.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Example()));
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: OwnerStatefull(),
    ));
  }
}

class OwnerStatefull extends StatefulWidget {
  const OwnerStatefull({Key? key}) : super(key: key);

  @override
  _OwnerStatefullState createState() => _OwnerStatefullState();
}

class _OwnerStatefullState extends State<OwnerStatefull> {
  var _model = Model();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InheritedWidgetProvider(
        model: _model,
        child: Button(),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        InheritedWidgetProvider.of(context)?.model.readFile();
      },
      child: const Text('read file'),
    );
  }
}
