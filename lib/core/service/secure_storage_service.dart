import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage storage;
  SecureStorageService(this.storage);

  Future<void> saveToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  Future<String?> recieveToken() async {
    return storage.read(key: "token");
  }

  Future<void> clearToken() async {
    await storage.deleteAll();
  }
}
