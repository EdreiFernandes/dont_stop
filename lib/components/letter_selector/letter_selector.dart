import 'package:flutter/material.dart';

import 'keyboard.dart';

class LetterSelector extends StatelessWidget {
  const LetterSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 250.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Keyboard(tiles: ['A','B','C','D']),
              Keyboard(tiles: ['E','F','G','H']),
              Keyboard(tiles: ['I','J','K','L']),
              Keyboard(tiles: ['M','N','O','P']),
              Keyboard(tiles: ['R','S','T','W']),
              // All letters
              // Keyboard(tiles: ['A','B','C','D']),
              // Keyboard(tiles: ['E','F','G','H']),
              // Keyboard(tiles: ['I','J','K','L']),
              // Keyboard(tiles: ['M','N','O','P']),
              // Keyboard(tiles: ['Q','R','S','T']),
              // Keyboard(tiles: ['U','V','W','X']),
              // Keyboard(tiles: ['Y','Z','x','x']),
            ],
          ),
        ),
      ],
    );
  }
}
