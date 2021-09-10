import 'dart:async';

import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  bool _loading = false;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _progressValue = 0.0;
  }

  // TODO ajustar contador
  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.001;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _loading = true;
    _updateProgress();

    return Column(
      children: [
        _loading
            ? LinearProgressIndicator(
                minHeight: 16.0,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                value: _progressValue,
              )
            : Text( // TODO o que fazer quando acabar o tempo?
                "Time's up",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}
