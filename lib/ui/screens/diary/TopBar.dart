import 'package:flutter/material.dart';

import '../../../data/util/GetDate.dart';

/// A custom top app bar that includes a date display with navigation
/// buttons and a calendar picker icon.
class DatePickerTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String date;
  final VoidCallback decreaseDate;
  final VoidCallback increaseDate;

  const DatePickerTopBar({
    Key? key,
    required this.date,
    required this.decreaseDate,
    required this.increaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine whether the current theme is dark.
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color onBackground = isDark ? Colors.white : Colors.black87;

    // Determine the display text for the date.
    String dateText;
    if (date == getCurrentDate()) {
      dateText = 'Today';
    } else if (date == getYesterdayDate()) {
      dateText = 'Yesterday';
    } else {
      dateText = formatDateFromDD_MM_YYYY_toEEE_dd_mm(date);
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: onBackground.withAlpha(204), // 0.8 alpha
            ),
            onPressed: decreaseDate,
            tooltip: 'Back',
          ),
          // Center: Date Display with Calendar Icon
          Text(
            dateText,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: onBackground.withAlpha(204),
                ),
          ),

          // Forward Button
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: onBackground.withAlpha(204),
            ),
            onPressed: increaseDate,
            tooltip: 'Forward',
          ),
        ],
      ),
    );
  }

  // Standard AppBar height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
