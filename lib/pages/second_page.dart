import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static const routeName = '/second-page';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => showExitDialog(context),
        child: Scaffold(
            appBar: AppBar(title: Text('Second Page')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Second Page'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SelectionButton('Return 42'),
                      SelectionButton('Return AbErVaLlG'),
                    ],
                  )
                ],
              ),
            )));
  }
}

class SelectionButton extends StatelessWidget {
  final String text;
  const SelectionButton(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pop(context, text),
        style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
        child: Text('$text',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)));
  }
}

Future<bool> showExitDialog(BuildContext context) async {
  final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
              title: Text('Question'),
              content: Text('Are you sure?'),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Yes'))
              ]));
  if (result == null) {
    return false;
  }
  return result;
}
