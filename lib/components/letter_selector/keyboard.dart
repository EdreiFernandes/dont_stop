import 'package:flutter/material.dart';

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

class KeyboardTile extends StatefulWidget {
  final String letter;

  const KeyboardTile({Key? key, required this.letter}) : super(key: key);

  @override
  _KeyboardTileState createState() => _KeyboardTileState();
}

class _KeyboardTileState extends State<KeyboardTile> {
  late bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _isActive ? Colors.blue : Colors.grey,
      textStyle: TextStyle(
        fontSize: 80.0,
        color: _isActive ? Colors.white : Colors.white70,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isActive = !_isActive;
          });
        },
        child: Container(
          width: 180.0,
          height: 120.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Center(
            child: Text(
              widget.letter,
            ),
          ),
        ),
      ),
    );
  }
}
