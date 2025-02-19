import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class ActivityAndGoalScreen extends StatelessWidget {
  const ActivityAndGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.6 : screenWidth;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WelcomeScreenNumberIndicator(
                    currentScreen: 10, // Step number
                    onBackPressed: () => context.pop(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "What is your activity level right now?", // Title Text
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 26),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "This will be used to create your custom plan.", // Subtitle Text
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
              const SizedBox(height: 16),
              Expanded(
                child: ActivityLevelSelectionColumnNew(), // Activity Level Selection Column
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: contentWidth,
                  height: 52, // Slightly reduced button height
                  child: CupertinoButton.filled(
                    onPressed: () {
                      context.pushNamed('diet_screen'); // Adjust navigation route
                    },
                    borderRadius: BorderRadius.circular(26), // Match button radius to height
                    child: const Text("Next",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
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

class ActivityLevelCard extends StatelessWidget {
  final String activityLevel;
  final String description;
  final bool isSelected;
  final VoidCallback onClick;

  const ActivityLevelCard({
    Key? key,
    required this.activityLevel,
    required this.description,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: isSelected
              ? CupertinoTheme.of(context).primaryColor.withOpacity(0.1)
              : CupertinoColors.systemGrey6.resolveFrom(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected ? [
            BoxShadow(
              color: CupertinoTheme.of(context).primaryColor.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ] : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activityLevel,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: CupertinoColors.label.resolveFrom(context),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 15,
                      color: CupertinoColors.secondaryLabel,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.checkmark,
                  color: CupertinoColors.white,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Update the ListView separator in ActivityLevelSelectionColumnNew
class ActivityLevelSelectionColumnNew extends StatelessWidget {
  const ActivityLevelSelectionColumnNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return ListView.separated(
      padding: const EdgeInsets.only(top: 24, bottom: 70),
      itemCount: provider.activityLevels.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final activityLevel = provider.activityLevels[index];
        return ActivityLevelCard(
          activityLevel: activityLevel.activityLevel,
          description: activityLevel.description,
          isSelected: activityLevel.activityLevel == provider.selectedActivityLevel.activityLevel,
          onClick: () {
            provider.setSelectedActivityLevel(activityLevel);
          },
        );
      },
    );
  }
}