import 'package:flutter/material.dart';

TableRow buildTableRow({
  required int no,
  required String keyValue,
  required String english,
  required String hindi,
  required String marathi,
}) {
  return TableRow(
    children: [
      Padding(padding: const EdgeInsets.all(8.0), child: Text('$no')),
      Padding(padding: const EdgeInsets.all(8.0), child: Text(keyValue)),
      Padding(padding: const EdgeInsets.all(8.0), child: Text(english)),
      Padding(padding: const EdgeInsets.all(8.0), child: Text(hindi)),
      Padding(padding: const EdgeInsets.all(8.0), child: Text(marathi)),
    ],
  );
}
