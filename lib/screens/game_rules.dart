import 'package:flutter/material.dart';

class GameRules extends StatefulWidget {
  const GameRules({Key? key}) : super(key: key);

  @override
  State<GameRules> createState() => _GameRulesState();
}

class _GameRulesState extends State<GameRules> {
  String pdfPath = "assets/gamerules.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manual de regras"),
      ),
      body: Text("PDF"),
    );
  }
}
