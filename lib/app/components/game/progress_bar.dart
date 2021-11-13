import 'package:dont_stop/app/services/timer_service.dart';
import 'package:dont_stop/app/utils/screensizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  final TimerService timerService = Modular.get();
  late double timeValue = 0.0;

  @override
  void initState() {
    super.initState();
    timerService.onUpdate((time) {
      if (mounted)
        setState(() {
          timeValue = time;
        });
    });
    timerService.startOrResetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: ScreenSize().getHeight(context, dividedBy: 40.0),
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          value: timeValue,
        )
      ],
    );
  }
}
