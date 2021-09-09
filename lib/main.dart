import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapple_app/screens/game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(),
    );
  }
}
