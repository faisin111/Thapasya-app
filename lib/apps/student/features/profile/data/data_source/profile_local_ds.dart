import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDs {
  final SharedPreferences prefs;
  ProfileLocalDs(this.prefs);

  Future<void> setLogging(bool isLogg) async {
    await prefs.setBool("isLogged", isLogg);
  }

  Future<void> setRole(String role) async {
    await prefs.setString("role", role);
  }

  Future<void> remove() async {
    await prefs.clear();
  }
}
