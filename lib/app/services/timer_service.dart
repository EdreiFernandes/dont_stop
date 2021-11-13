import 'package:flutter/cupertino.dart';

abstract class TimerService {
  double getTimeValue();
  void setCallback(Function callback);
  void startOrResetTimer();
}

class TimerServiceImpl implements TimerService {
  @override
  double getTimeValue() {
    debugPrint("time value");
    return 0.5;
  }

  @override
  void setCallback(Function callback) {
    debugPrint("callback");
    callback();
  }

  @override
  void startOrResetTimer() {
    debugPrint("Timer reset");
  }
}
