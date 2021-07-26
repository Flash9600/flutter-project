import 'package:flutter/material.dart';

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
  var _value = 54;

  void _incriment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _incriment,
          child: const Text('Tap'),
        ),
        ProviderInherited(value: _value, child: const TextStateless()),
      ],
    );
  }
}

class ProviderInherited extends InheritedWidget {
  final int value;

  const ProviderInherited(
      {Key? key, required this.value, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(ProviderInherited oldWidget) {
    return value != oldWidget.value;
  }
}

class TextStateless extends StatelessWidget {
  const TextStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<ProviderInherited>()
            ?.value ??
        0;
    return Container(
      child: Text('$value'),
    );
  }
}
