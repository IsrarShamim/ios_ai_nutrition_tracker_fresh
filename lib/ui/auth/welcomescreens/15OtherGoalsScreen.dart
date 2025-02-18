import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// WelcomeScreenIndicator (replace with your actual import path)
import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class Pair {
  String activityLevel;
  String description;
  Pair(this.activityLevel, this.description);
}

class _SelectOtherGoalsCards extends StatelessWidget {
  final List<String> selectedGoals;
  final Function(String) onGoalSelected;

  const _SelectOtherGoalsCards({
    required this.selectedGoals,
    required this.onGoalSelected,
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> otherGoals = const [
    {'name': 'Muscle Mass', 'icon': 'assets/images/muscle_building.png'},
    {'name': 'Strength', 'icon': 'assets/images/strengthbuilding.png'},
    {'name': 'Endurance', 'icon': 'assets/images/endurance.png'},
    {'name': 'Cardiovascular Health', 'icon': 'assets/images/hearthhealth.png'},
    {'name': 'Flexibility', 'icon': 'assets/images/flexibility.png'},
    {'name': 'Overall Fitness', 'icon': 'assets/images/overallfitness.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: otherGoals.map((goal) {
          final isSelected = selectedGoals.contains(goal['name']);
          return _GoalCard(
            goal: goal,
            isSelected: isSelected,
            onSelected: () => onGoalSelected(goal['name']),
          );
        }).toList(),
      ),
    );
  }
}
class _GoalCard extends StatelessWidget {
  final Map<String, dynamic> goal;
  final bool isSelected;
  final VoidCallback onSelected;

  const _GoalCard({
    Key? key,
    required this.goal,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? CupertinoTheme.of(context).primaryColor.withOpacity(0.1)
              : CupertinoColors.systemGrey6.resolveFrom(context),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.08),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Image.asset(
                goal['icon'] as String,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                goal['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.label.resolveFrom(context),
                ),
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
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class OtherGoalsScreen extends StatelessWidget {
  const OtherGoalsScreen({Key? key}) : super(key: key);

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
            children: [
              WelcomeScreenNumberIndicator(
                currentScreen: 12,
                onBackPressed: () => context.pop(),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    "What are your fitness goals?",
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Select all that apply to your fitness journey",
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.secondaryLabel,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Consumer<WelcomeScreenProvider>(
                  builder: (context, provider, _) => _SelectOtherGoalsCards(
                    selectedGoals: provider.selectedGoals,
                    onGoalSelected: provider.toggleGoalSelection,
                  ),
                ),
              ),
              SizedBox(
                width: contentWidth,
                child: CupertinoButton.filled(
                  onPressed: () => context.pushNamed('weight_transition_screen'),
                  borderRadius: BorderRadius.circular(26),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
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
