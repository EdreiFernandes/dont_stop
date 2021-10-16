import 'package:flutter/material.dart';
import 'package:tapple_app/utils/screensizer.dart';
import 'package:tapple_app/utils/timer_control.dart';

class TimerButton extends StatelessWidget {
  final TimerControl _timerControl = TimerControl();

  TimerButton({Key? key}) : super(key: key);

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
          _timerControl.startOrResetTimer();
        },
        child: Container(
          height: ScreenSize().getHeight(context, dividedBy: 7.0),
          width: ScreenSize().getWidth(context, dividedBy: 1.5),
        ),
      ),
    );
  }
}
