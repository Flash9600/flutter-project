import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/second_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Main Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Main page',
                style: TextStyle(fontSize: 24),
              ),
              NavigateButton(),
            ],
          ),
        ));
  }
}

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed(context),
        style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
        child: Text('Go next!!!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)));
  }
}

void onPressed(BuildContext context) async {
  final resultText = await Navigator.pushNamed(context, SecondPage.routeName);
  if (resultText != null) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$resultText')));
  }
}
