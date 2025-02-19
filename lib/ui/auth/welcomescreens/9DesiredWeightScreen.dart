import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';
import '2GoogleSignInScreen.dart';

// Assuming WelcomeScreenProvider and WelcomeScreenNumberIndicator are already defined

class ChooseDesiredWeightScreen extends StatelessWidget {
  const ChooseDesiredWeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
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
                    "Choose your desired weight?",
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
                final contentWidth = screenWidth > 500 ? screenWidth * 0.6 : screenWidth;
                return SizedBox(
                  width: contentWidth,
                  height: 54,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      context.pushNamed('is_realistic_target_screen'); // Adjust navigation route as needed
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
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  height: 200, // Define the height of your horizontal pager here.
                  child: TouchingHorizontalPager(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TouchingHorizontalPager extends StatefulWidget {
  const TouchingHorizontalPager({Key? key}) : super(key: key);

  @override
  TouchingHorizontalPagerState createState() => TouchingHorizontalPagerState();
}

class TouchingHorizontalPagerState extends State<TouchingHorizontalPager> {
  late PageController _pageController;
  int _selectedWeightIndex = 0;
  List<int> _weights = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);
    final currentWeight = provider.ifMetric ? provider.weightInKgs : provider.weightInLbs;

    _weights = List<int>.generate(400, (i) => (i + 20));
    _selectedWeightIndex = currentWeight - 20;
    final initialPage = () {
      if (provider.selectedGoals.contains("Weight Loss")) {
        return _selectedWeightIndex - 10;
      } else if (provider.selectedGoals.contains("Weight Gain")) {
        return _selectedWeightIndex + 10;
      } else {
        return _selectedWeightIndex;
      }
    }();
    _selectedWeightIndex = initialPage;
    _pageController = PageController(initialPage: initialPage, viewportFraction: 0.10);
    _getGoalText(_selectedWeightIndex, provider);
    provider.setWeightGoalAsInt(_weights[initialPage - 20]);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    final unit = provider.weightUnit;
    final currentWeight = provider.ifMetric ? provider.weightInKgs : provider.weightInLbs;
    String textForGoalType = _getGoalText(_selectedWeightIndex, provider);

    return Column(
      children: [
        Text(
          textForGoalType,
          style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '${_weights[_selectedWeightIndex]} $unit',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 70,
          width: 400,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _weights.length,
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedWeightIndex = index;
              });
              provider.setWeightGoalAsInt(_weights[index]);
            },
            itemBuilder: (context, index) {
              final weight = _weights[index];
              final isCenter = index == _selectedWeightIndex;
              final isInRange = _isWeightInRange(
                weight,
                currentWeight,
                _weights[_selectedWeightIndex],
              );

              return WeightDialItem(
                weight: weight,
                isCenter: isCenter,
                isInRange: isInRange,
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isWeightInRange(int weight, int currentWeight, int targetWeight) {
    if (currentWeight < targetWeight) {
      return weight >= currentWeight && weight <= targetWeight;
    } else if (currentWeight > targetWeight) {
      return weight <= currentWeight && weight >= targetWeight;
    }
    return false;
  }

  String _getGoalText(int selectedIndex, WelcomeScreenProvider provider) {
    final currentWeight = provider.ifMetric ? provider.weightInKgs : provider.weightInLbs;
    final desiredWeight = _weights[selectedIndex];

    if (currentWeight < desiredWeight) {
      return "Gain Weight";
    } else if (currentWeight > desiredWeight) {
      return "Lose Weight";
    } else {
      return "Maintain Weight";
    }
  }
}

class WeightDialItem extends StatelessWidget {
  final int weight;
  final bool isCenter;
  final bool isInRange;

  const WeightDialItem({
    Key? key,
    required this.weight,
    this.isCenter = false,
    this.isInRange = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isInRange)
            Container(
              width: 16,
              height: 3,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                color: CupertinoColors.activeBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          // Replace line with dot indicator
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isCenter ? 4 : 3,
            height: isCenter ? 4 : 3,
            margin: EdgeInsets.only(bottom: isCenter ? 8 : 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCenter
                  ? CupertinoColors.activeBlue
                  : isInRange
                  ? CupertinoColors.activeBlue.withOpacity(0.3)
                  : CupertinoColors.systemGrey4,
              boxShadow: isCenter
                  ? [
                BoxShadow(
                  color: CupertinoColors.activeBlue.withOpacity(0.3),
                  blurRadius: 4,
                  spreadRadius: 1,
                )
              ]
                  : null,
            ),
          ),
          Text(
            weight.toString(),
            style: TextStyle(
              fontSize: isCenter ? 18 : 16,
              fontWeight: isCenter ? FontWeight.w600 : FontWeight.w400,
              color: CupertinoColors.label.resolveFrom(context).withOpacity(
                  isCenter ? 1.0 : isInRange ? 0.8 : 0.5
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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