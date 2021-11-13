import 'package:dont_stop/app/services/timer_service.dart';
import 'package:dont_stop/app/utils/screensizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TimerButton extends StatelessWidget {
  final TimerService timerService = Modular.get();

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
          timerService.startOrResetTimer();
        },
        child: Container(
          height: ScreenSize().getHeight(context, dividedBy: 7.0),
          width: ScreenSize().getWidth(context, dividedBy: 1.5),
        ),
      ),
    );
  }
}
