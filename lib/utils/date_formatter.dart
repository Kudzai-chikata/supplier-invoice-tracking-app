// lib/utils/date_formatter.dart

import 'package:intl/intl.dart';

/// Provides utility functions for formatting dates and times.
class DateFormatter {
  /// Formats a date to a readable string in the 'YYYY-MM-DD' format.
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Formats a date and time to a readable string in the 'YYYY-MM-DD HH:MM:SS' format.
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  /// Returns the current date and time in 'YYYY-MM-DD HH:MM:SS' format.
  static String currentDateTime() {
    return formatDateTime(DateTime.now().toUtc());
  }
}