import 'dart:async';

abstract class TimerService {
  void onUpdate(Function callback);
  void startOrResetTimer();
}

class TimerServiceImpl implements TimerService {
  late var _callback;
  late double _timeValue = 0.0;
  final Duration _oneSec = const Duration(seconds: 1);
  late Timer _timer = new Timer.periodic(_oneSec, (Timer t) {});

  @override
  void onUpdate(Function callback) {
    _callback = callback;
  }

  @override
  void startOrResetTimer() {
    _initVariables();
    _startTimer();
  }

  void _initVariables() {
    _timeValue = -0.1;
    _timer.cancel();
  }

  void _startTimer() {
    _timer = new Timer.periodic(_oneSec, (Timer t) {
      if (!_isTimerOver()) {
        _timeValue += 0.1;
        if (_callback != null) _callback(_timeValue);
      } else {
        t.cancel();
      }
    });
  }

  bool _isTimerOver() {
    double time = double.parse(_timeValue.toStringAsFixed(1));
    return time >= 1.0;
  }
}
