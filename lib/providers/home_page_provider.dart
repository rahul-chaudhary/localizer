import 'package:flutter/material.dart';

import '../Models/TableRowItem.dart';

class HomePageProvider extends ChangeNotifier {
  final List<TableRowItem> _tableRowItems = [
    TableRowItem(key: 'myKet', englishItem: 'YEAH', hindiItem: 'fsdf', marathiItem: 'dsfcd')
  ];

  List<TableRowItem> get tableRowItems => _tableRowItems;

  void addTableRowItem(TableRowItem tableRowItem) {
    _tableRowItems.add(tableRowItem);
    notifyListeners();
  }
}
