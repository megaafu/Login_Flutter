import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = const FlutterSecureStorage();

  Future<void> addToken(String value) async {
    storage.write(key: "token", value: value);
  }

  Future<void> deleteToken(String key) async {
    storage.delete(key: key);
  }

  Future<String?> getToken(String key) async {
    String? token = await storage.read(key: key);
    return token;
  }
}
