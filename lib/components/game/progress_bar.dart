import 'package:flutter/material.dart';
import 'package:tapple_app/utils/screensizer.dart';
import 'package:tapple_app/utils/timer_control.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late TimerControl timerControl = TimerControl();

  @override
  void initState() {
    super.initState();
    timerControl.callback = (time) {
      if(mounted) setState(() {});
    };
    timerControl.startOrResetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: ScreenSize().getHeight(context, dividedBy: 40.0),
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          value: timerControl.timeValue,
        )
      ],
    );
  }
}
