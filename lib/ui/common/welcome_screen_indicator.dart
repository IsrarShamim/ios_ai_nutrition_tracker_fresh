

import 'package:flutter/material.dart';


class WelcomeScreenNumberIndicator extends StatelessWidget {
  final int currentScreen;
  final VoidCallback onBackPressed;
  final int totalScreens;
  final bool disableBack; // New parameter to disable back button

  const WelcomeScreenNumberIndicator({
    super.key,
    required this.currentScreen,
    required this.onBackPressed,
    this.totalScreens = 19,
    this.disableBack = false, // Default value is false (back button enabled)
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentScreen + 1) / totalScreens;

    return Padding(
      padding: const EdgeInsets.only(bottom: .0),
      child: Row(
        children: [
          // Conditionally render and enable/disable the Back Button based on disableBack
          if (!disableBack)
            Row( // Wrap back button in a Row to manage spacing correctly
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      // Conditionally set onTap based on disableBack
                      onTap: disableBack ? null : onBackPressed, // Set onTap: null if disableBack is true
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Keep spacing if back button is present
              ],
            ),
          // If disableBack is true, we simply don't render the back button part,
          // and the progress indicator will take up the available space.

          // Progress Indicator (always rendered)
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                height: 6,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}