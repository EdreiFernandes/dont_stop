import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: 100.0,
          width: 240.0,
        ),
      ),
    );
  }
}
