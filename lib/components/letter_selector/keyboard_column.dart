import 'package:flutter/cupertino.dart';

import 'keyboard_tile.dart';

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