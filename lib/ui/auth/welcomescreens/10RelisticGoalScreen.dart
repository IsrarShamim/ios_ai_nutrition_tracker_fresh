import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class IsRealisticTargetScreen extends StatelessWidget {
  const IsRealisticTargetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Provide a default value if weightGoalAsInt is null.
    final weightGoal = provider.weightGoalAsInt ?? 0;
    final ifLoseWeight = provider.selectedGoals.contains("Weight Loss");
    final weightDifference = (provider.ifMetric
            ? (provider.weightInKgs - weightGoal).abs()
            : (provider.weightInLbs - weightGoal).abs())
        .toInt();
    final unit = provider.weightUnit;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WelcomeScreenNumberIndicator(
                          currentScreen: 7,
                          onBackPressed: () => context.pop(),
                        ),

                        // const Spacer(), // Pushes the next button to the bottom
                      ],
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: screenWidth,
                          height: 54,
                          child: CupertinoButton.filled(
                            onPressed: () {
                              context.pushNamed(
                                  'how_fast_per_week'); // Adjust navigation route as needed
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
                        )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 2 - 150 / 2,
                left: 0,
                right: 0,
                child: Center(
                  child: RealisticTargetText(
                    ifLoseWeight: ifLoseWeight,
                    weightDifference: weightDifference,
                    unit: unit,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class RealisticTargetText extends StatelessWidget {
  final bool ifLoseWeight;
  final int weightDifference;
  final String unit;

  const RealisticTargetText({
    Key? key,
    required this.ifLoseWeight,
    required this.weightDifference,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highlightColor = CupertinoTheme.of(context).primaryColor;
    final losingOrGaining = ifLoseWeight ? "Losing" : "Gaining";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600, // SemiBold equivalent
                    // Optionally, you can specify fontSize here if not already set in headlineLarge
                  ),
              children: [
                TextSpan(text: '$losingOrGaining '),
                TextSpan(
                  text: '$weightDifference $unit',
                  style: TextStyle(color: highlightColor),
                ),
                TextSpan(text: " is a realistic target. It's not hard at all!"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "80% of users say that the change is obvious with us and it is not easy to rebound",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500, // ~550 weight approximation
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.85),
                ),
          ),
        ),
      ],
    );
  }
}
