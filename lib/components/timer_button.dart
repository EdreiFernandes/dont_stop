import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;

    return Material(
      color: Colors.red,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(100),
        topRight: Radius.circular(100),
      ),
      child: InkWell(
        onTap: () {
          debugPrint("Timer start/reset");
        },
        child: Container(
          height: _mediaSize.height / 7,
          width: _mediaSize.width / 1.5,
        ),
      ),
    );
  }
}
