import 'package:flutter/foundation.dart';
import '../constants/app_string.dart';

void dbPrint(Object? object, {bool isPointyLineVisible = true}) {

  if (kDebugMode) {
    if(isPointyLineVisible) {
      print(AppString.pointyLine + object.toString());
    } else {
      print(object);
    }
  }
}
