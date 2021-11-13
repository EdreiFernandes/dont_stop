import 'package:dont_stop/app/utils/screensizer.dart';
import 'package:dont_stop/app/utils/timer_control.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late TimerControl _timerControl = TimerControl();

  @override
  void initState() {
    super.initState();
    _timerControl.callback = (time) {
      if (mounted) setState(() {});
    };
    _timerControl.startOrResetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: ScreenSize().getHeight(context, dividedBy: 40.0),
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          value: _timerControl.timeValue,
        )
      ],
    );
  }
}
