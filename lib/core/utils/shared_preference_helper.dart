import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences? _sharedPreferences;

  static final SharedPreferenceHelper _instance = SharedPreferenceHelper._();

  SharedPreferenceHelper._();

  factory SharedPreferenceHelper() => _instance;

  Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get sharedPreferences => _sharedPreferences!;
}
