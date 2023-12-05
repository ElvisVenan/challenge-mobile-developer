import 'i_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalServiceImpl implements ILocalService {

  static const String ID_KEY = "id";
  static const String TOKEN_KEY = "token";
  static const String EMAIL_KEY = "email";
  static const String PASSWORD_KEY = "password";

  @override
  Future<dynamic> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      throw Exception("Unsupported data type");
    }
  }
}
