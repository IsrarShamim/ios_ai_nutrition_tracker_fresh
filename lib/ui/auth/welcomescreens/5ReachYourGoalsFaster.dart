import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/welcome_screen_indicator.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.5 : screenWidth;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top section: Indicator and Spacer
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WelcomeScreenNumberIndicator(
                    currentScreen: 2,
                    onBackPressed: () => context.pop(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),

              // Middle section: Motivational Text and Chart
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Reach your Goals\nFaster and Easier",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: screenWidth > 500 ? TextAlign.center : TextAlign.start,
                    ),
                    AspectRatio(
                      aspectRatio: 660 / 578, // Aspect ratio from Compose code
                      child: Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey6, // surfaceContainerHighest in Compose (using systemGrey6 for Cupertino)
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(0), // No padding for image inside box
                          child: Image.asset(
                            'assets/images/light_weight_in_3_months.png', // Replace with your actual asset path
                            fit: BoxFit.fitWidth, // ContentScale.Fit in Compose
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 0), // Spacers from Compose are not needed in Flutter layout
                    const SizedBox(height: 0),
                  ],
                ),
              ),

              // Bottom section: "Let's do this" Button
              SizedBox(
                width: contentWidth,
                height: 54,
                child: CupertinoButton.filled(
                  onPressed: () {
                    context.pushNamed('height_and_weight_screen'); // Navigate to Home Screen
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
            ],
          ),
        ),
      ),
    );
  }
}