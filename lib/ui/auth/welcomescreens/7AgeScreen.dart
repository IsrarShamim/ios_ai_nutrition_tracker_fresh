import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.6 : screenWidth;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Builder(builder: (context) {
          // Calculate contentWidth from screen width
          final screenWidth = MediaQuery.of(context).size.width;
          final contentWidth = screenWidth > 500 ? screenWidth * 0.6 : screenWidth;
          return Stack(
            children: [
              // Top Section: Indicator, Title, and Subtitle.
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WelcomeScreenNumberIndicator(
                      currentScreen: 4,
                      onBackPressed: () => context.pop(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "When were you born?",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "This will be used to create your custom plan.",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                        color: CupertinoColors.secondaryLabel,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Bottom Section: Next Button.
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: SizedBox(
                  width: contentWidth,
                  height: 54,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);
                      // Calculate age based on birth date
                      int age = _calculateAge(
                          provider.birthYear, provider.birthMonth, provider.birthDay);
                      // Update the age in WelcomeScreenProvider
                      provider.setAge(age);
                      context.pushNamed('weight_goal_type_screen'); // Navigate to the next screen
                    },
                    borderRadius: BorderRadius.circular(27),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              // Center Section: BirthDateInputRow centered on the screen.
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 150 / 2,
                left: 0,
                right: 0,
                child: Center(
                  child: BirthDateInputRow(), // Reusable Widget for date input
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class BirthDateInputRow extends StatelessWidget {
  const BirthDateInputRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start, // Align dials to the start (top)
      children: [
        _MonthDial(),
        const SizedBox(width: 16), // Increased spacing between dials
        _DayDial(),
        const SizedBox(width: 16), // Increased spacing between dials
        _YearDial(),
      ],
    );
  }
}

class _MonthDial extends StatelessWidget {
  final List<String> months = const [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return VerticalDial(
      label: "MONTH",
      items: months,
      selectedIndex: provider.birthMonth - 1,
      onItemSelected: (index) {
        provider.setBirthMonth(index + 1);
      },
      dialWidth: 140, // Slightly reduced width for Month dial (from 160 to 140)
    );
  }
}

class _DayDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    final daysInMonth = _getMaxDaysInMonth(provider.birthMonth, provider.birthYear);
    return VerticalDial(
      label: "DAY",
      items: List.generate(daysInMonth, (index) => (index + 1).toString()),
      selectedIndex: provider.birthDay - 1,
      onItemSelected: (index) {
        provider.setBirthDay(index + 1);
      },
      dialWidth: 70, // Slightly reduced width for Day dial (from 80 to 70)
    );
  }
}

class _YearDial extends StatelessWidget {
  final int minYear = 1900;
  final int maxYear = 2010;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return VerticalDial(
      label: "YEAR",
      items: List.generate(maxYear - minYear + 1, (index) => (minYear + index).toString()),
      selectedIndex: provider.birthYear - minYear,
      onItemSelected: (index) {
        provider.setBirthYear(minYear + index);
      },
      dialWidth: 90, // Slightly increased width for Year dial (from 80 to 90)
    );
  }
}

class VerticalDial extends StatelessWidget {
  final String label;
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final double dialWidth;

  const VerticalDial({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    this.dialWidth = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: CupertinoTheme
                .of(context)
                .textTheme
                .textStyle
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        SizedBox(
          width: dialWidth,
          height: 100,
          child: CupertinoPicker(
            itemExtent: 35,
            diameterRatio: 1.1,
            squeeze: 0.95,
            looping: true,
            scrollController: FixedExtentScrollController(initialItem: selectedIndex),
            onSelectedItemChanged: onItemSelected,
            children: items.map((item) => Center(child: Text(item, style: const TextStyle(fontSize: 18)))).toList(),
          ),
        ),
      ],
    );
  }
}

int _getMaxDaysInMonth(int month, int year) {
  if (month == 2) {
    final isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    return isLeap ? 29 : 28;
  } else if ([4, 6, 9, 11].contains(month)) {
    return 30;
  } else {
    return 31;
  }
}

int _calculateAge(int birthYear, int birthMonth, int birthDay) {
  DateTime currentDate = DateTime.now();
  DateTime birthDate = DateTime(birthYear, birthMonth, birthDay);

  int age = currentDate.year - birthDate.year;
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
    age--;
  }
  return age;
}