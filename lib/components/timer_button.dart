import 'package:flutter/material.dart';
import 'package:tapple_app/utils/screensizer.dart';

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
          height: ScreenSize().getHeight(context, dividedBy: 7.0),
          width: ScreenSize().getWidth(context, dividedBy: 1.5),
        ),
      ),
    );
  }
}
