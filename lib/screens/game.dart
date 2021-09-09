import 'package:flutter/material.dart';
import 'package:tapple_app/components/LetterSelector/letter_selector.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
      ),
      body: LetterSelector(),
    );
  }
}

