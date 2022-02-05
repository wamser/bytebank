import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.pinkAccent,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pinkAccent,
          textTheme: ButtonTextTheme.primary,
        ),

      ),
      home:Dashboard(),
    );
  }
}


