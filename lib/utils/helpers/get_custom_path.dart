import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> getCustomPath() async {
  // Get the app's documents directory.
  final Directory appDocDir = await getApplicationDocumentsDirectory();

  // Create a subdirectory, for example "localized".
  final Directory customDir = Directory('${appDocDir.path}/localized');

  // Create the directory if it doesn't exist.
  if (!await customDir.exists()) {
    await customDir.create(recursive: true);
  }

  return customDir.path;
}
