import 'package:dont_stop/app/utils/keyboard_memory.dart';
import 'package:dont_stop/app/utils/screensizer.dart';
import 'package:flutter/material.dart';

class KeyboardTile extends StatefulWidget {
  final String letter;

  const KeyboardTile({Key? key, required this.letter}) : super(key: key);

  @override
  _KeyboardTileState createState() => _KeyboardTileState();
}

class _KeyboardTileState extends State<KeyboardTile> {
  late bool _isActive = false;

  @override
  void initState() {
    KeyboardMemory().getLetterStatus(widget.letter).then((value) {
      setState(() {
        _isActive = value;
      });
    });
    super.initState();
  }

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
            KeyboardMemory().setLetterStatus(widget.letter, _isActive);
          });
        },
        child: Container(
          width: ScreenSize().getWidth(context, dividedBy: 2.0),
          height: ScreenSize().getHeight(context, dividedBy: 6.0),
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
