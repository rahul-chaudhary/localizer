import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/table_row_item.dart';

Future<void> saveTableRowItems(List<TableRowItem> items) async {
  final prefs = await SharedPreferences.getInstance();
  // Convert list of objects into list of maps, then encode to JSON.
  final jsonString = jsonEncode(items.map((item) => item.toJson()).toList());
  await prefs.setString('tableRowItems', jsonString);
}

Future<List<TableRowItem>> loadTableRowItems() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('tableRowItems');
  if (jsonString == null) {
    return []; // Return empty list if no data is found.
  }
  final List<dynamic> jsonData = jsonDecode(jsonString);
  return jsonData
      .map((data) => TableRowItem.fromJson(data as Map<String, dynamic>))
      .toList();
}
