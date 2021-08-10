import 'package:flutter/material.dart';

import 'widgets/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = MyApp();
  runApp(app);
}
