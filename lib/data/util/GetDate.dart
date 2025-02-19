import 'package:intl/intl.dart';

String getCurrentDate() {
  final now = DateTime.now();
  return DateFormat('dd-MM-yyyy').format(now);
}

String getYesterdayDate() {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  return DateFormat('dd-MM-yyyy').format(yesterday);
}

String formatDateFromDD_MM_YYYY_toEEE_dd_mm(String date) {
  try {
    // Parse the input date string in 'dd-MM-yyyy' format
    final parsedDate = DateFormat('dd-MM-yyyy').parse(date);

    // Format the parsed date into 'EEE, dd MMM' format
    return DateFormat('EEE, dd MMM', 'en_US').format(parsedDate);
  } catch (e) {
    // Handle parsing errors, e.g., invalid date format
    print('Error parsing date: $e');
    return 'Invalid Date'; // Or return a default value/error message
  }
}
