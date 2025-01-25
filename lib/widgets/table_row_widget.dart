import 'package:flutter/material.dart';

import '../utils/constants/app_color.dart';

TableRow buildTableRow({
  required int no,
  required String keyValue,
  required String english,
  required String hindi,
  required String marathi,
  bool isHeader = false,
}) {
  return TableRow(
    decoration: _tableRowDecoration(isHeader: isHeader, rowIndex: no),
    children: [
      _tableRowText(isHeader ? 'S.no.' : '$no', isHeader),
      _tableRowText(keyValue, isHeader),
      _tableRowText(english, isHeader),
      _tableRowText(hindi, isHeader),
      _tableRowText(marathi, isHeader),
    ],
  );
}

BoxDecoration _tableRowDecoration({required isHeader, required int rowIndex}) {
  return isHeader
      ? const BoxDecoration(color: Colors.black)
      : BoxDecoration(
          color: rowIndex % 2 == 0 ? AppColor.scaffoldColorLight : Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        );
}

Padding _tableRowText(String text, bool isHeader) {
  Color textColor = isHeader ? AppColor.scaffoldColorLight : Colors.black;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}
