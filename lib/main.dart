import 'package:flutter/material.dart';
import 'app/views/splash_view.dart';
// ignore: unused_import
import 'package:fluttercrud/models/user.dart';
import 'provider/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Create user',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const Splash(),
      ),
    );
  }
}
