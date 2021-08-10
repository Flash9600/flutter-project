import 'package:flutter/material.dart';
import 'package:flutter_hello/widgets/app/color_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BLoC with Stream'),
          centerTitle: true,
        ),
        body: Center(
          child: StreamBuilder<Color>(
            stream: _bloc.outputStateStream,
            initialData: Colors.red,
            builder: (context, snapshot) => AnimatedContainer(
              height: 100,
              width: 100,
              color: snapshot.data,
              duration: Duration(milliseconds: 500),
            ),
          ),
        ),
        floatingActionButton: Row(
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_red);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  _bloc.inputEventSink.add(ColorEvent.event_green);
                }),
          ],
        ),
      ),
    );
  }
}
