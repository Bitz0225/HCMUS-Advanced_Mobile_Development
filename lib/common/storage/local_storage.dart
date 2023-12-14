import 'package:lettutor/core/app_config/dependency.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  static Future<LocalStorage> init() async {
    instance._sharedPreferences ??= await SharedPreferences.getInstance();
    return instance;
  }

  SharedPreferences? _sharedPreferences;

  static final LocalStorage _instance = LocalStorage._();
  static LocalStorage get instance => _instance;

  Future<bool?> saveString(
      {required StorageKey key, required String value}) async {
    return _sharedPreferences?.setString(key.toString(), value);
  }

  String? getString({required StorageKey key}) {
    return _sharedPreferences?.getString(key.toString());
  }

  Future<bool?> clear() async {
    return _sharedPreferences?.clear();
  }
}

enum StorageKey {
  accessToken,
  refreshToken,
}