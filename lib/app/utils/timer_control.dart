import 'dart:async';

class TimerControl {
  late var _callback;
  late double _timeValue = 0.0;
  final Duration _oneSec = const Duration(seconds: 1);
  late Timer _timer = new Timer.periodic(_oneSec, (Timer t) {});

  static final TimerControl _timerControl = TimerControl._internal();

  double get timeValue => _timeValue;

  TimerControl._internal();

  factory TimerControl() {
    return _timerControl;
  }

  set callback(callbackFunction) {
    _callback = callbackFunction;
  }

  void _initVariables(){
    _timeValue = 0.0;
    _timer.cancel();
  }

  void _startTimer() {
    _timer = new Timer.periodic(_oneSec, (Timer t) {
      if(!_isTimerOver()){
        _timeValue += 0.1;
        if(_callback != null) _callback(_timeValue);
      }else{
        t.cancel();
      }
    });
  }

  bool _isTimerOver(){
    double time = double.parse(_timeValue.toStringAsFixed(1));
    return time >= 1.0;
  }

  void startOrResetTimer(){
    _initVariables();
    _startTimer();
  }
}
