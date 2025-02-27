import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localizer/utils/helpers/get_custom_path.dart';
import 'package:provider/provider.dart';
import '../../Models/table_row_item.dart';
import '../../providers/home_page_provider.dart';
import '../constants/app_color.dart';

Future<void> exportJSONFiles(BuildContext context) async {
  // Get the list of table row items from the provider.
  final provider = Provider.of<HomePageProvider>(context, listen: false);
  final List<TableRowItem> items = provider.tableRowItems;

  // Create maps for each language.
  Map<String, String> englishMap = {};
  Map<String, String> hindiMap = {};
  Map<String, String> marathiMap = {};

  for (var item in items) {
    englishMap[item.key] = item.englishItem;
    hindiMap[item.key] = item.hindiItem;
    marathiMap[item.key] = item.marathiItem;
  }

  // Convert maps to JSON strings.
  final String englishJson = jsonEncode(englishMap);
  final String hindiJson = jsonEncode(hindiMap);
  final String marathiJson = jsonEncode(marathiMap);

  try {
    // Get the application documents directory.
    final String customPath = await getCustomPath();

    // Define file paths.
    final String englishFilePath = '$customPath/english.json';
    final String hindiFilePath = '$customPath/hindi.json';
    final String marathiFilePath = '$customPath/marathi.json';

    // Write the JSON strings to the files.
    await File(englishFilePath).writeAsString(englishJson);
    await File(hindiFilePath).writeAsString(hindiJson);
    await File(marathiFilePath).writeAsString(marathiJson);

    // Optionally, show a success message or log the file paths.
    debugPrint('Files saved at: $customPath');
    if(context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Row(
        children: [
          SelectableText('Files saved at: $customPath'),
          IconButton(onPressed: () {
            Clipboard.setData(ClipboardData(text: customPath));
          }, icon: const Icon(Icons.copy_rounded, color: AppColor.onPrimaryIcon)),
        ],
      )),
    );
    }


  } catch (e) {
    debugPrint('Error exporting JSON files: $e');
  }
}
