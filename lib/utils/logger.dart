import 'package:flutter/foundation.dart';

class Logger {
  static void debug(String message) {
    if (kDebugMode) {
      print('DEBUG: [[34mDEBUG[0m] $message');
    }
  }

  static void error(String message) {
    print('ERROR: [[31mERROR[0m] $message');
  }

  static void trackEvent(String event) {
    print('EVENT: [[32mEVENT[0m] $event');
  }
}
