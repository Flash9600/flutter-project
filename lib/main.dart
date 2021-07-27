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

class Model extends ChangeNotifier {
  int? _valueOne;
  int? _valueTwo;
  int? _result;

  set valueOne(String value) {
    _valueOne = int.tryParse(value);
  }

  set valueTwo(String value) {
    _valueTwo = int.tryParse(value);
  }

  get result => _result;

  void sum() {
    if (_valueOne != null && _valueTwo != null) {
      _result = _valueOne! + _valueTwo!;
    } else {
      _result = null;
    }
    notifyListeners();
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
      child: CalcWidgetProvider(
        model: _model,
        child: Container(
          width: 150,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FirstTextField(),
              const SecondTextField(),
              Button(),
              const FieldForResult(),
            ],
          ),
        ),
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
      onPressed: () => CalcWidgetProvider.of(context)?.model.sum(),
      child: const Text('calc'),
    );
  }
}

class FirstTextField extends StatelessWidget {
  const FirstTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          CalcWidgetProvider.of(context)?.model.valueOne = value,
      decoration: const InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.pink))),
    );
  }
}

class SecondTextField extends StatelessWidget {
  const SecondTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          CalcWidgetProvider.of(context)?.model.valueTwo = value,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}

class FieldForResult extends StatelessWidget {
  const FieldForResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = CalcWidgetProvider.of(context)?.model.result;
    return Text('$value');
  }
}

class CalcWidgetProvider extends InheritedNotifier<Model> {
  final Model model;

  const CalcWidgetProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child, notifier: model);

  static CalcWidgetProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CalcWidgetProvider>();
}
