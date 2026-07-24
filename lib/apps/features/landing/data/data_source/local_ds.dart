import 'package:shared_preferences/shared_preferences.dart';

class LocalDs {
  final SharedPreferences prefs;
  LocalDs(this.prefs);

  Future<bool> getLogging() async {
    return prefs.getBool("isLogged") ?? false;
  }

  Future<String?> getRole() async {
    return prefs.getString("role");
  }
}
