import 'package:flutter/material.dart';
import 'package:fluttercrud/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'app/views/splash_view.dart';
// ignore: unused_import
import 'package:fluttercrud/models/user.dart';
import 'app/views/user_form.dart';
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
        routes: {
          AppRoutes.HOME: (_) => const Splash(),
          AppRoutes.USER_FORM: (_) => const UserForm(),
        },
      ),
    );
  }
}
