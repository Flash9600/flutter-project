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

class IValue {
  static const String value = 'value';
  static const String valueTwo = 'valueTwo';
  IValue();
}

class OwnerStatefull extends StatefulWidget {
  const OwnerStatefull({Key? key}) : super(key: key);

  @override
  _OwnerStatefullState createState() => _OwnerStatefullState();
}

class _OwnerStatefullState extends State<OwnerStatefull> {
  var _value = 0;
  var _valueTwo = 0;

  void _incriment() {
    _value += 1;
    setState(() {});
  }

  void _incrimentTwo() {
    _valueTwo += 1;
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
        ElevatedButton(
          onPressed: _incrimentTwo,
          child: const Text('Tap two'),
        ),
        ProviderInherited(
            value: _value, valueTwo: _valueTwo, child: const TextStateless()),
      ],
    );
  }
}

class ProviderInherited extends InheritedModel<String> {
  final int value;
  final int valueTwo;

  const ProviderInherited(
      {Key? key,
      required this.value,
      required this.valueTwo,
      required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(ProviderInherited oldWidget) {
    return value != oldWidget.value || valueTwo != oldWidget.valueTwo;
  }

  @override
  bool updateShouldNotifyDependent(
      ProviderInherited old, Set<String> dependencies) {
    if (dependencies.contains(IValue.value)) {
      return value != old.value;
    } else if (dependencies.contains(IValue.valueTwo)) {
      return valueTwo != old.valueTwo;
    }
    return false;
  }
}

class TextStateless extends StatelessWidget {
  const TextStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<ProviderInherited>(
                aspect: IValue.value)
            ?.value ??
        0;
    return Column(children: [
      Text('$value'),
      ChildStatefull(),
    ]);
  }
}

class ChildStatefull extends StatefulWidget {
  const ChildStatefull({Key? key}) : super(key: key);

  @override
  _ChildStatefullState createState() => _ChildStatefullState();
}

class _ChildStatefullState extends State<ChildStatefull> {
  var value;

  didChangeDependencies() {
    value = context
        .dependOnInheritedWidgetOfExactType<ProviderInherited>(
            aspect: IValue.valueTwo)
        ?.valueTwo;
  }

  @override
  Widget build(BuildContext context) {
    return Text('$value');
  }
}
