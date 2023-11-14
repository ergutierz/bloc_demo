import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _preferences;

  SharedPreferencesManager._();

  static Future<SharedPreferencesManager> create() async {
    await _initialize();
    return SharedPreferencesManager._();
  }

  static Future<void> _initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUsername(String username) async {
    await _preferences?.setString(_keyUsername, username);
  }

  static String? getUsername() => _preferences?.getString(_keyUsername);

  static Future setIsLoggedIn(bool value) async {
    await _preferences?.setBool(_keyIsLoggedIn, value);
  }

  static bool? getIsLoggedIn() => _preferences?.getBool(_keyIsLoggedIn);

  // Keys

  static const _keyUsername = 'username';
  static const _keyIsLoggedIn = 'isLoggedIn';
}
