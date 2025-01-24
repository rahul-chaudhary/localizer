import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/shared_pref/shared_pref_keys.dart';
import '../utils/shared_pref/shared_prefs.dart';

class HomeNotifier extends Notifier {
  Map<String, dynamic>? _map;

  @override
  Map<String, dynamic>? build() {
    return null;
  }

  Future<Map<String, dynamic>?> getMap() async {
    _map = await getMapFromLocalStorage(prefsKey: SharedPrefKeys.englishMap);
    return _map;
  }

  void addToMap({required String key, required String value}) async {
    _map?.addAll({key: value});
    saveMapToLocalStorage(prefsKey: key, map: {key: value});
  }
}
