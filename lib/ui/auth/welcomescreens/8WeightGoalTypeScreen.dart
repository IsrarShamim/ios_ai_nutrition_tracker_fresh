import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class GoalSettingScreen extends StatelessWidget {
  const GoalSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.6 : screenWidth;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              WelcomeScreenNumberIndicator(
                currentScreen: 5,
                onBackPressed: () => context.pop(),
              ),
              const SizedBox(height: 24),
              Text(
                "What are your fitness goals?",
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
              const SizedBox(height: 32),
              Expanded(
                child: GoalSelectionGrid(), // Reusable Grid Widget
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: contentWidth,
                  height: 54,
                  child: CupertinoButton.filled(
                    onPressed: () {


                      if(provider.selectedGoals.contains( "Weight Gain"))
                        {
                          // provider.weightGoalPerWeek = 1.1;
                          context.pushNamed(
                              'desired_weight_goal_screen');
                        }
                      else if(provider.selectedGoals.contains( "Weight Loss")){
                        // provider.weightGoalPerWeek = 0.5;
                        context.pushNamed(
                            'desired_weight_goal_screen');
                      }

                      else {
                        context.pushNamed(
                            'with_us_vs_without_us');
                      }

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

class GoalSelectionGrid extends StatelessWidget {
  final List<String> goals = const ["Weight Gain",  "Weight Maintain", "Weight Loss"];

  GoalSelectionGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenProvider>(context);
    return Column(
      children: goals.map((goal) => GoalCard(
        goal: goal,
        isSelected: provider.selectedGoals.contains(goal),
        onGoalClick: () {
          provider.toggleGoalSelection(goal);
        },
      )).toList(),
    );
  }
}

class GoalCard extends StatelessWidget {
  final String goal;
  final bool isSelected;
  final VoidCallback onGoalClick;

  const GoalCard({
    Key? key,
    required this.goal,
    required this.isSelected,
    required this.onGoalClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CupertinoButton( // Using CupertinoButton as a Card alternative for iOS style
        onPressed: onGoalClick,
        padding: EdgeInsets.zero,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isSelected ? CupertinoTheme.of(context).primaryColor : CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    getIconForGoal(goal), // Function to get IconData based on goal
                    color: isSelected ? CupertinoColors.white : CupertinoColors.black,
                    size: 28,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    goal,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isSelected ? CupertinoColors.white : CupertinoColors.black,
                    ),
                  ),
                ],
              ),
              if (isSelected)
                Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: CupertinoColors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData getIconForGoal(String goal) {
    switch (goal.toLowerCase()) {
      case 'weight gain':
        return CupertinoIcons.arrow_up_circle_fill; // Replace with appropriate icon
      case 'weight loss':
        return CupertinoIcons.arrow_down_circle_fill; // Replace with appropriate icon
      case 'weight maintain':
      default:
        return CupertinoIcons.equal_circle_fill; // Replace with appropriate icon
    }
  }
}