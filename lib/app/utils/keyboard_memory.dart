import 'package:shared_preferences/shared_preferences.dart';

class KeyboardMemory {
  void setLetterStatus(String key, bool isActive) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, isActive);
  }

  Future<bool> getLetterStatus(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = preferences.getBool(key) ?? true;
    return status;
  }
}
