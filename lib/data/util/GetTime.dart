import 'dart:ffi';

import 'package:intl/intl.dart';

/// Returns the current time formatted as "hh:mm p.m" (e.g., "02:00 p.m").
String getCurrentFormattedTime() {
  final now = DateTime.now();
  // Format the current time using a 12-hour clock.
  final formatted = DateFormat('hh:mm a').format(now);
  // Convert the AM/PM part to lowercase with periods.
  return formatted.replaceAll('AM', 'a.m').replaceAll('PM', 'p.m');
}
/// Returns the current time formatted as "hh:mm p.m" (e.g., "02:00 p.m").
int getCurrentTime() {
  final now = DateTime.now().millisecondsSinceEpoch;
  // Format the current time using a 12-hour clock.
  // Convert the AM/PM part to lowercase with periods.
  return now;
}

/// Formats a [DateTime] object to a string in the "02:00 p.m" format.
String formatTime(DateTime dateTime) {
  // Format using 'hh:mm a' which returns something like "02:00 PM"
  final formatted = DateFormat('hh:mm a').format(dateTime);
  // Convert the AM/PM to lowercase and add periods if needed.
  // Here we replace "AM" with "a.m" and "PM" with "p.m"
  return formatted.replaceAll('AM', 'a.m').replaceAll('PM', 'p.m');
}




/// Cleans the input time string by removing dots and converting AM/PM to uppercase.
/// For example, "10:44 p.m" becomes "10:44 PM".
String cleanTimeString(String input) {
  // Remove all dots.
  final noDots = input.replaceAll('.', '');
  // Convert to uppercase.
  return noDots.toUpperCase();
}

/// Returns a string indicating how much time has passed since [timeString].
///
/// The [timeString] is expected to be in the format "hh:mm a" (e.g. "10:44 p.m" or "02:00 p.m").
/// If the parsed time is later than the current time, it is assumed that the time
/// refers to yesterday.
String timeAgo(String timeString) {
  // Get the current DateTime.
  final now = DateTime.now();

  // Clean the input string so it can be parsed correctly.
  final cleanedTime = cleanTimeString(timeString);

  // Prepare the DateFormat to parse the input.
  final format = DateFormat('hh:mm a');
  final parsedTime = format.parse(cleanedTime);

  // Create a DateTime for today using the parsed hour and minute.
  DateTime timeToday = DateTime(now.year, now.month, now.day, parsedTime.hour, parsedTime.minute);

  // If the computed time is in the future, assume the time refers to yesterday.
  if (timeToday.isAfter(now)) {
    timeToday = timeToday.subtract(const Duration(days: 1));
  }

  // Calculate the time difference.
  final diff = now.difference(timeToday);

  // Return a human-readable string based on the difference.
  if (diff.inDays > 0) {
    return '${diff.inDays}d ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours}h ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes}m ago';
  } else {
    return 'just now';
  }
}
