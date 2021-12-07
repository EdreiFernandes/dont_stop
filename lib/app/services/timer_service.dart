import 'dart:async';

abstract class TimerService {
  void onUpdate(Function callback);
  void onGameOver(Function callback);
  void startOrResetTimer();
}

class TimerServiceImpl implements TimerService {
  late Function _onUpdate;
  late Function _onGameOver;
  late double _timeValue = 0.0;
  final Duration _oneSec = const Duration(seconds: 1);
  late Timer _timer = new Timer.periodic(_oneSec, (Timer t) {});

  @override
  void onUpdate(Function callback) {
    _onUpdate = callback;
  }

  @override
  void onGameOver(Function callback) {
    _onGameOver = callback;
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
        if (_onUpdate != null) _onUpdate(_timeValue);
      } else {
        t.cancel();
        _onGameOver();
      }
    });
  }

  bool _isTimerOver() {
    double time = double.parse(_timeValue.toStringAsFixed(1));
    return time >= 1.0;
  }
}
