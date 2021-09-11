import 'package:flutter/material.dart';

import 'keyboard_tile.dart';

class Keyboard extends StatelessWidget {
  final List<String> tiles;

  const Keyboard({required this.tiles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        KeyboardColumn(
          upperLetter: tiles.elementAt(0),
          lowerLetter: tiles.elementAt(1),
        ),
        KeyboardColumn(
          upperLetter: tiles.elementAt(2),
          lowerLetter: tiles.elementAt(3),
        ),
      ],
    );
  }
}

class KeyboardColumn extends StatelessWidget {
  final String upperLetter;
  final String lowerLetter;

  const KeyboardColumn(
      {Key? key, required this.upperLetter, required this.lowerLetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        KeyboardTile(
          letter: upperLetter,
        ),
        KeyboardTile(
          letter: lowerLetter,
        ),
      ],
    );
  }
}