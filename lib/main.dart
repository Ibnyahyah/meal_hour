import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Hour',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
