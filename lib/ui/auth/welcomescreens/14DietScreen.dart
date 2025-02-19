import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// Assuming you have this import for your custom indicator
import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class Pair {
  String activityLevel;
  String description;
  Pair(this.activityLevel, this.description);
}

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
        // Add a builder to access the provider immediately
        builder: (context) {
          return CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemBackground,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: const _DietSelectionCards(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Consumer<WelcomeScreenProvider>(
                        builder: (context, provider, child) {
                          return CupertinoButton.filled(
                            borderRadius: BorderRadius.circular(27),
                            disabledColor: CupertinoColors.quaternarySystemFill,
                            onPressed: provider.selectedDiet.isNotEmpty
                                ? () => context.pushNamed('other_goals_screen')
                                : null,
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },

    );
  }
}

class _DietCard extends StatelessWidget {
  const _DietCard({
    Key? key,
    required this.entry,
    required this.isSelected,
  }) : super(key: key);

  final MapEntry<String, Map<String, dynamic>> entry;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<WelcomeScreenProvider>();

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => provider.setSelectedDiet(entry.key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
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
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected
                    ? CupertinoTheme.of(context).primaryColor
                    : CupertinoColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  entry.value['icon']!,
                  color: isSelected
                      ? CupertinoColors.white
                      : CupertinoTheme.of(context).primaryColor,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label.resolveFrom(context),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entry.value['description']!,
                    style: TextStyle(
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

// Updated DietSelectionCards for better layout
class _DietSelectionCards extends StatelessWidget {
  final Map<String, Map<String, dynamic>> dietOptions = const {
    'Omnivorous': {
      'icon': 'assets/images/non_veg.png',
      'description': 'Includes both plant and animal products',
    },
    'Vegetarian': {
      'icon': 'assets/images/vegetarian.png',
      'description': 'Plant-based diet with dairy and eggs',
    },
    'Vegan': {
      'icon': 'assets/images/vegan.png',
      'description': 'Exclusively plant-based diet',
    },
    'Pescatarian': {
      'icon': 'assets/images/pescatarian.png',
      'description': 'Vegetarian diet with seafood',
    },
  };

  const _DietSelectionCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WelcomeScreenProvider>();
    final selectedDiet = provider.selectedDiet;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeScreenNumberIndicator(
          currentScreen: 11,
          onBackPressed: () => context.pop(),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Text(
              'Choose Your Diet Preference',
              textAlign: TextAlign.center,
              style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Select the diet that best matches your eating habits',
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
        ...dietOptions.entries.map((entry) {
          final isSelected = selectedDiet == entry.key;
          return _DietCard(entry: entry, isSelected: isSelected);
        }),
      ],
    );
  }
}
