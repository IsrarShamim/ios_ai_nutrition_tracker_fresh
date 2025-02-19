import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';
import '2GoogleSignInScreen.dart';

class WeightAndDietScreen extends StatelessWidget {
  const WeightAndDietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.6 : screenWidth;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WelcomeScreenNumberIndicator(
                          currentScreen: 3,
                          onBackPressed: () => context.pop(),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Weight & Height",
                          style: CupertinoTheme
                              .of(context)
                              .textTheme
                              .navLargeTitleTextStyle
                              .copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "This will be used to create your custom plan.",
                          style: CupertinoTheme
                              .of(context)
                              .textTheme
                              .textStyle
                              .copyWith(
                            color: CupertinoColors.secondaryLabel,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 54),
                      ],
                    ),
                    WeightHeightInputSection(),
                    // Reusable Widget for Weight and Height Input
                    const Spacer(),
                    // Pushes the "Next" button to the bottom
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: contentWidth,
                  height: 54,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      context.pushNamed(
                          'age_screen'); // Navigate to next screen (replace 'home' as needed)
                    },
                    borderRadius: BorderRadius.circular(27),
                    child: const Text("Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeightHeightInputSection extends StatelessWidget {
  const WeightHeightInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return Column(
      children: [
        CupertinoSlidingSegmentedControl<bool>( // Metric/Imperial Switch
          groupValue: provider.ifMetric,
          children: {
            true: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('Metric', style: TextStyle(fontSize: 16)),
            ),
            false: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('Imperial', style: TextStyle(fontSize: 16)),
            ),
          },
          onValueChanged: (value) {
            if (value != null) {
              provider.setIfMetric(value);
            }
          },
        ),
        const SizedBox(height: 54),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _WeightDial(), // Weight Input Dial Widget
            _HeightDial(), // Height Input Dial Widget
          ],
        ),
      ],
    );
  }
}

class _WeightDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Weight",
            style: CupertinoTheme
                .of(context)
                .textTheme
                .textStyle
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        SizedBox(
          width: 120, // Increased width for Weight dial (from 100 to 120)
          height: 150,
          child: CupertinoPicker(
            itemExtent: 40,
            diameterRatio: 1.2,
            squeeze: 1.0,
            looping: true,
            scrollController: FixedExtentScrollController(
                initialItem: provider.ifMetric ? provider.weightInKgs : provider
                    .weightInLbs),
            onSelectedItemChanged: (index) {
              if (provider.ifMetric) {
                // Calculate weight in kg and update both kg and lbs
                final weightKg = index + 20; // your base calculation for kg
                final weightLbs = (weightKg * 2.20462).round(); // convert kg to lbs (round if needed)
                logger.d("KGS KGS KGS");
                logger.d("weightKt -> $weightKg");
                logger.d("weight lbs -> $weightLbs");

                provider.setWeightInLbs(weightLbs,false);
                provider.setWeightInKgs(weightKg,true);
              } else {
                // Calculate weight in lbs and update both lbs and kg
                final weightLbs = index + 42; // your base calculation for lbs
                final weightKg = (weightLbs / 2.20462).round(); // convert lbs to kg (round if needed)
                logger.d("LBS");
                logger.d("weightKt -> $weightKg");
                logger.d("weight lbs -> $weightLbs");
                provider.setWeightInKgs(weightKg,false);
                provider.setWeightInLbs(weightLbs,true);
              }

            },
            children: List<Widget>.generate(
                provider.ifMetric ? 200 - 20 + 1 : 440 - 42 + 1, (
                index) {
              final weightValue = index + (provider.ifMetric ? 20 : 42);
              return Center(
                child: Text(
                  '$weightValue ${provider.ifMetric ? 'kg' : 'lb'}',
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _HeightDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Height",
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        SizedBox(
          width: provider.ifMetric ? 120 : 180, // Increased width for Height dial (from 100/150 to 120/180)
          height: 150 ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!provider.ifMetric) // Feet dial for Imperial
                SizedBox(
                  width: 60, // Increased width for Feet dial
                  child: CupertinoPicker(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    squeeze: 1.0,
                    looping: true,
                    scrollController: FixedExtentScrollController(initialItem: provider.feet - 1),
                    onSelectedItemChanged: (index) {
                      provider.setFeet(index + 1);
                    },
                    children: List<Widget>.generate(8, (index) {
                      final feetValue = index + 1;
                      return Center(
                        child: Text(
                          '$feetValue ft',
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }),
                  ),
                ),
              if (!provider.ifMetric) // Conditional Spacer for Imperial
                const SizedBox(width: 12), // Increased spacer width
              if (!provider.ifMetric) // Inches dial for Imperial
                SizedBox(
                  width: 60, // Increased width for Inches dial
                  child: CupertinoPicker(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    squeeze: 1.0,
                    looping: true,
                    scrollController: FixedExtentScrollController(initialItem: provider.inches),
                    onSelectedItemChanged: (index) {
                      provider.setInches(index);
                    },
                    children: List<Widget>.generate(12, (index) {
                      return Center(
                        child: Text(
                          '$index in',
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }),
                  ),
                ),
              if (provider.ifMetric) // CM dial for Metric
                SizedBox(
                  width: 120, // Increased width for CM dial
                  child: CupertinoPicker(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    squeeze: 1.0,
                    looping: true,
                    scrollController: FixedExtentScrollController(initialItem: 90),
                    onSelectedItemChanged: (index) {
                      provider.setHeight(index + 90);
                    },
                    children: List<Widget>.generate(200 - 90 + 1, (index) {
                      final cmValue = index + 90;
                      return Center(
                        child: Text(
                          '$cmValue cm',
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}