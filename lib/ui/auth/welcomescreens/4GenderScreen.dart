import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.5 : screenWidth;
    final provider = Provider.of<WelcomeScreenProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        context.pop(); // Navigate back using go_router
        return false; // Prevent default back navigation
      },
      child: CupertinoPageScaffold(
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
                        children: [
                          WelcomeScreenNumberIndicator(
                            currentScreen: 1,
                            onBackPressed: () => context.pop(),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "What is your sex?",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navLargeTitleTextStyle
                                .copyWith(fontWeight: FontWeight.w600),
                            textAlign: screenWidth > 500 ? TextAlign.center : TextAlign.start,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "This will be used to create your custom plan.",
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: CupertinoColors.secondaryLabel,
                            ),
                            textAlign: screenWidth > 500 ? TextAlign.center : TextAlign.start,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                      Column(
                        children: [
                          _GenderCard(
                            gender: "Male",
                            iconPath: 'assets/images/male_icon_black.png', // Replace with your actual asset path
                            isSelected: provider.selectedGender == "Male",
                            onTap: () {
                              provider.setSelectedGender("Male");
                            },
                          ),
                          _GenderCard(
                            gender: "Female",
                            iconPath: 'assets/images/female_icon_black.png', // Replace with your actual asset path
                            isSelected: provider.selectedGender == "Female",
                            onTap: () {
                              provider.setSelectedGender("Female");
                            },
                          ),
                        ],
                      ),
                      const Spacer(), // Pushes the "Next" button to the bottom
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
                        context.pushNamed('reach_your_goals'); // Navigate to next screen
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
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  final String gender;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    Key? key,
    required this.gender,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CupertinoButton( // Using CupertinoButton as a Card alternative for iOS style
        onPressed: onTap,
        padding: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? CupertinoTheme.of(context).primaryColor : CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0.2)
                      : CupertinoTheme.of(context).primaryColor.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    color: isSelected ? CupertinoColors.white : CupertinoColors.black, // Adjust icon color
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                gender,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isSelected ? CupertinoColors.white : CupertinoColors.black, // Adjust text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}