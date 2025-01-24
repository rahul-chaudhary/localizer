import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveMapToLocalStorage({required String prefsKey,required Map<String, dynamic> map}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(map); // Convert Map to JSON String
  await prefs.setString(prefsKey, jsonString); // Save JSON String
}

Future<Map<String, dynamic>?> getMapFromLocalStorage({required String prefsKey}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString(prefsKey); // Retrieve JSON String

  if (jsonString == null) return null; // Handle if no value is stored
  return jsonDecode(jsonString); // Convert JSON String back to Map
}

