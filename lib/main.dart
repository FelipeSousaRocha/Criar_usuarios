import 'package:flutter/material.dart';
import 'app/views/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create user',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const Splash(),
    );
  }
}
