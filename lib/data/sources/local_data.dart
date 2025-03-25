import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Int
  Future<int> getInt(String name) async {
    return (await _prefs).getInt(name) ?? -25000;
  }

  Future<bool> setInt(String name, int value) async {
    return (await _prefs).setInt(name, value);
  }

  // String
  Future<String> getString(String name) async {
    return (await _prefs).getString(name) ?? "";
  }

  Future<bool> setString(String name, String value) async {
    return (await _prefs).setString(name, value);
  }

  // Any
  Future<bool> remove(String name) async {
    return (await _prefs).remove(name);
  }
}
