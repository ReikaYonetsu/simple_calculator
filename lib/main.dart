import 'package:flutter/material.dart';

import 'calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 20.0),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
          height: 50,
        ),
      ),
      home: MyHomePage(),
    );

  }
}

