
import 'package:intl/intl.dart';

String formatDateFromDD_MM_YYYY_toDD_MM(String dateString) {
  try {
    final inputFormat = DateFormat('dd-MM-yyyy');
    final outputFormat = DateFormat('dd/MM');
    final date = inputFormat.parse(dateString);
    return outputFormat.format(date);
  } catch (e) {
    return ""; // Return empty string in case of parsing error, similar to Kotlin's `?: return ""`
  }
}

String formatDateFromDD_MM_YYYY_toWeekDay(String dateString) {
  try {
    final inputFormat = DateFormat('dd-MM-yyyy');
    final outputFormat = DateFormat('EEE'); // "EEE" for short weekday names (Mon, Tue)
    final date = inputFormat.parse(dateString);
    return outputFormat.format(date);
  } catch (e) {
    return ""; // Return empty string in case of parsing error
  }
}

String formatDateToMonthAndDay(String dateString) {
  try {
    final inputFormat = DateFormat('dd-MM-yyyy');
    final outputFormat = DateFormat('MMM dd'); // Format: Dec 13

    final date = inputFormat.parse(dateString);
    return outputFormat.format(date);
  } catch (e) {
    // Fallback to formatting "01-06-2025" if parsing fails for the input date string
    final inputFormatFallback = DateFormat('dd-MM-yyyy');
    final outputFormatFallback = DateFormat('MMM dd');
    final fallbackDate = inputFormatFallback.parse("01-06-2025"); // Parse the fallback date
    return outputFormatFallback.format(fallbackDate); // Format the fallback date
  }
}