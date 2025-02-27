import 'package:flutter/material.dart';
import '../Models/table_row_item.dart';
import '../Models/crud_tab.dart';
import '../utils/helpers/save_and_load_item.dart';

class HomePageProvider extends ChangeNotifier {

  HomePageProvider() {
    loadTableRowItemsFromLocal();
  }
  Future<void> loadTableRowItemsFromLocal() async {
    final items = await loadTableRowItems(); // your load function from shared_preferences
    _tableRowItems.clear();
    _tableRowItems.addAll(items);
    notifyListeners();
  }

  CRUDTab _selectedTab = CRUDTab.create;
  final List<TableRowItem> _tableRowItems = [];

  CRUDTab get selectedTab => _selectedTab;

  void setSelectedTab(CRUDTab tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  List<TableRowItem> get tableRowItems => _tableRowItems;

  void addTableRowItem(TableRowItem tableRowItem) async {
    _tableRowItems.add(tableRowItem);
    notifyListeners();
    //TODO: Add try catch block
    await saveTableRowItems(_tableRowItems);
  }

  bool isKeyAlreadyPresent(String key) {
    return _tableRowItems.any((element) => element.key == key);
  }

  bool isIndexExist(int index) {
    return index >= 0 && index < _tableRowItems.length;
  }
  void removeAnItem(int index) async {
    _tableRowItems.removeAt(index);
    notifyListeners();
    await saveTableRowItems(_tableRowItems);
  }

}
