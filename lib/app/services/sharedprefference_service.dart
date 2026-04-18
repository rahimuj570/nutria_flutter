import 'package:shared_preferences/shared_preferences.dart';

class SharedprefferenceService {
  SharedprefferenceService._();

  static const themeDataKey = "themeData";

  static late final SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static Future<bool> isDarkTheme() async {
    return instance.getBool(themeDataKey) ?? false;
  }

  static Future<void> saveTheme(bool isDark) async {
    await instance.setBool(themeDataKey, isDark);
  }
}
