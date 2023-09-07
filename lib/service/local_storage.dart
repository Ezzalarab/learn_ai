import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences _prefs;
  Future<LocalStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setStringData({
    required String key,
    required String value,
  }) async {
    return await _prefs.setString(key, value);
  }

  String? getStringData(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setBoolData({
    required String key,
    required bool value,
  }) async {
    return await _prefs.setBool(key, value);
  }

  bool? getBoolData(String key) {
    return _prefs.getBool(key);
  }
}
