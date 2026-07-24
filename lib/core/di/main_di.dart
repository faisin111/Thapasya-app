import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thapasya/core/api/dio_client.dart';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';

Future<PersistCookieJar> createCookieJar() async {
  if (kIsWeb) {
    // Web doesn't have a file system
    return PersistCookieJar(
      ignoreExpires: true,
    );
  }

  final dir = await getApplicationDocumentsDirectory();

  return PersistCookieJar(
    storage: FileStorage("${dir.path}/cookies"),
  );
}
final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final cookieProvider = Provider<PersistCookieJar>((ref) {
  throw UnimplementedError();
});

final dioProvider = Provider<DioClient>((ref) {
  final c = ref.read(cookieProvider);
  return DioClient(c);
});
