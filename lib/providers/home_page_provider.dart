import 'package:flutter/material.dart';
import '../Models/table_row_item.dart';
import '../Models/crud_tab.dart';

class HomePageProvider extends ChangeNotifier {

  CRUDTab _selectedTab = CRUDTab.create;
  final List<TableRowItem> _tableRowItems = [];

  CRUDTab get selectedTab => _selectedTab;

  void setSelectedTab(CRUDTab tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  List<TableRowItem> get tableRowItems => _tableRowItems;

  void addTableRowItem(TableRowItem tableRowItem) {
    _tableRowItems.add(tableRowItem);
    notifyListeners();
  }

  bool isKeyAlreadyPresent(String key) {
    return _tableRowItems.any((element) => element.key == key);
  }
}
