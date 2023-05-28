import 'package:flutter/foundation.dart';

class Utils {
  println(dynamic data) {
    if (kDebugMode) {
      print(data);
    }
  }
}

Utils utils = Utils();
