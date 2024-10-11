import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Import for json.encode and json.decode

class SharedPreferencesHelper {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'userData', json.encode(userData)); // Use json.encode here
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    return userData != null
        ? json.decode(userData)
        : null; // Use json.decode here
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userData');
  }
}
