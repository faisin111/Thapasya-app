import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDs {
  final SharedPreferences prefs;
  AuthLocalDs(this.prefs);

  Future<void> setLogging(bool isLogg) async {
    await prefs.setBool("isLogged", isLogg);
  }

  Future<bool> getLogging() async {
    return prefs.getBool("isLogged") ?? false;
  }

  Future<void> setRole(String role) async {
    await prefs.setString("role", role);
  }

  Future<String> getRole() async {
    return prefs.getString("role") ?? "no";
  }
}
