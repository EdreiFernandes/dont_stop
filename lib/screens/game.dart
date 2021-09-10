import 'package:flutter/material.dart';
import 'package:tapple_app/components/letter_selector/letter_selector.dart';
import 'package:tapple_app/components/progress_bar.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProgressBar(),
          LetterSelector(),
        ],
      ),
    );
  }
}

