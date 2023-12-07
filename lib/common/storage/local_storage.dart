import 'package:lettutor/core/app_config/dependency.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final _sharedPreferences = getIt<SharedPreferences>();

  static Future<SharedPreferences> init() async {
    return SharedPreferences.getInstance();
  }

  Future<bool?> saveString(
      {required StorageKey key, required String value}) async {
    return _sharedPreferences.setString(key.toString(), value);
  }

  String? getString({required StorageKey key}) {
    return _sharedPreferences.getString(key.toString());
  }
}

enum StorageKey {
  accessToken,
  refreshToken,
}