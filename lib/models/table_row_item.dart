class TableRowItem {
  final String key;
  final String englishItem;
  final String hindiItem;
  final String marathiItem;

  TableRowItem({
    required this.key,
    required this.englishItem,
    required this.hindiItem,
    required this.marathiItem,
  });

  factory TableRowItem.fromJson(Map<String, dynamic> json) {
    return TableRowItem(
      key: json['key'] ?? 'NULL',
      englishItem: json['englishItem'] ?? 'NULL',
      hindiItem: json['hindiItem'] ?? 'NULL',
      marathiItem: json['marathiItem'] ?? 'NULL',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'englishItem': englishItem,
      'hindiItem': hindiItem,
      'marathiItem': marathiItem,
    };
  }
}
