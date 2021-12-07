import 'package:flutter/cupertino.dart';

class ScreenSize {
  Size _getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double getHeight(BuildContext context, {double dividedBy = 1}) {
    return _getSize(context).height / dividedBy;
  }

  double getWidth(BuildContext context, {double dividedBy = 1}) {
    return _getSize(context).width / dividedBy;
  }
}