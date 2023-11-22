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
}