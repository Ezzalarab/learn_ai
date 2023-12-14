import '../app/exports.dart';

class LocalStorage {
  late final SharedPreferences _prefs;
  Future<LocalStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setStringData({
    required String key,
    required String? value,
  }) async {
    if (value != null) {
      return await _prefs.setString(key, value);
    } else {
      return false;
    }
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

  Future<void> clear(String key) async {
    await _prefs.remove(key);
  }

  UserItem? getUserProfile() {
    String? localProfile = _prefs.getString(SharedPrefsKeys.userProfileKey);
    if (localProfile != null) {
      return UserItem.fromMap(jsonDecode(localProfile));
    }
    return null;
  }

  String? getUserAccessToken() {
    return _prefs.getString(SharedPrefsKeys.userAccessTokenKey);
  }
}
