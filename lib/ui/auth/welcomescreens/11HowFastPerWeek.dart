import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

/// Returns a list of string values based on whether the system is metric.
List<String> values(bool isMetricSystem) {
  if (isMetricSystem) {
    return [
      "0.1",
      "0.2",
      "0.3",
      "0.4",
      "0.5",
      "0.6",
      "0.7",
      "0.8",
      "0.9",
      "1.0",
      "1.1",
      "1.2",
      "1.3",
      "1.4",
      "1.5",
    ];
  } else {
    return [
      "0.2",
      "0.4",
      "0.6",
      "0.8",
      "1.0",
      "1.2",
      "1.4",
      "1.6",
      "1.8",
      "2.0",
      "2.2",
      "2.4",
      "2.6",
      "2.8",
      "3.0",
    ];
  }
}

/// A screen that lets the user choose their desired weight difference per week.
class WeightDifferencePerWeekScreen extends StatefulWidget {

  const WeightDifferencePerWeekScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WeightDifferencePerWeekScreenState createState() =>
      _WeightDifferencePerWeekScreenState();
}

class _WeightDifferencePerWeekScreenState
    extends State<WeightDifferencePerWeekScreen> {
  /// Slider value ranges from 0 to 14.0. We start at 0.4.

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    bool isMetricSystem = provider.ifMetric;
    bool ifLoseWeight = provider.selectedGoals.contains("Weight Loss");
    double weightGoalPerWeek = provider.weightGoalPerWeek;
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    // final contentWidth =
    //     screenWidth > 500 ? screenWidth * 0.5 : screenWidth; // For button width
    final valuesList = values(isMetricSystem);
    final int roundedIndex = weightGoalPerWeek.round();
    final String displayValue =
        valuesList[min(roundedIndex, valuesList.length - 1)];
    // final String displayValue = provider.weightGoalPerWeek.toString();

    // Colors from the theme (you can adjust these as needed)

    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;
    final errorColor = theme.colorScheme.error;

    return Scaffold(
      backgroundColor: CupertinoColors.systemBackground, // Set Scaffold background color here5
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SafeArea(
          child: Stack(
            children: [
              // Top Section
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    WelcomeScreenNumberIndicator(
                      currentScreen: 6,
                      onBackPressed: () => context.pop(),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Choose your desired speed?",
                      textAlign: TextAlign.center,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "This will be used to create your custom plan.",
                      textAlign: TextAlign.center,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            color: CupertinoColors.secondaryLabel,
                            fontSize: 16,
                            height: 1.3,
                          ),
                    ),
                  ],
                ),
              ),
              // Bottom Section
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Builder(builder: (context) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  final contentWidth =
                      screenWidth > 500 ? screenWidth * 0.6 : screenWidth;
                  return SizedBox(
                    width: contentWidth,
                    height: 54,
                    child: CupertinoButton.filled(
                      onPressed: () {
                        context.pushNamed(
                            'with_us_vs_without_us'); // Adjust navigation route as needed
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
                  );
                }),
              ),
              // Center Section: Horizontal Pager placed exactly in the vertical center.
              // We assume a fixed pager height (e.g., 150).
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 150 / 2,
                left: 16,
                right: 16,
                child: Center(
                  child: SizedBox(
                    height: 200,
                    // Define the height of your horizontal pager here.
                    child: Column(
                        // Display the current target value with an animated style.
                        children: [
                          AnimatedDefaultTextStyle(
                            style: theme.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              "$displayValue ${isMetricSystem ? 'kg' : 'lbs'} per week",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Custom Slider Section
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: primaryColor,
                              inactiveTrackColor:
                                  secondaryColor.withOpacity(0.3),
                              trackHeight: 16,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 16),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 20),
                              tickMarkShape: SliderTickMarkShape.noTickMark,
                            ),
                            child: Slider(
                              value: provider.weightGoalPerWeek,
                              min: 0,
                              max: 14,
                              divisions: 14,
                              onChanged: (value) {
                                setState(() {
                                  provider.weightGoalPerWeek = value;
                                  provider.setWeightGoalPerWeek(value);
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Animated Speed Indicators Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedSpeedIndicator(
                                icon: Icons.directions_walk,
                                text: "Steady",
                                isActive: provider.weightGoalPerWeek <= 5,
                                color: primaryColor,
                              ),
                              AnimatedSpeedIndicator(
                                icon: Icons.directions_run,
                                text: "Perfect",
                                isActive: provider.weightGoalPerWeek > 5 &&
                                    provider.weightGoalPerWeek <= 10,
                                color: secondaryColor,
                              ),
                              AnimatedSpeedIndicator(
                                icon: Icons.speed,
                                text: "Aggressive",
                                isActive: provider.weightGoalPerWeek > 10,
                                color: errorColor,
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /* Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Section: An indicator and header text.
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Simulated indicator (replace with your own widget if needed)
                WelcomeScreenNumberIndicator(
                  currentScreen: 8,
                  onBackPressed: () => context.pop(),
                ),
                const SizedBox(height: 16),
                Text(
                  "How much do you want to ${widget.ifLoseWeight ? 'lose' : 'gain'} per week?",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "This will be used to create your custom plan.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            // Animated Card that appears if the target is high
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: weightGoalPerWeek > 10
                  ? Card(
                key: const ValueKey("highTarget"),
                color: theme.colorScheme.errorContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: errorColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "We see you’re aiming high! Don’t worry, we’re here to support you every step of the way.",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ),
            const Spacer(),
            // Next Button at the bottom.
            SizedBox(
              width: contentWidth,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  // TODO: Implement navigation to next screen.
                },
                child: Text(
                  "Next",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}

/// A widget that shows an icon and text, animating its scale and opacity when active.
class AnimatedSpeedIndicator extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  final Color color;

  const AnimatedSpeedIndicator({
    Key? key,
    required this.icon,
    required this.text,
    required this.isActive,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isActive ? 1.1 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: isActive ? color : Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isActive ? color : Colors.grey.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}
