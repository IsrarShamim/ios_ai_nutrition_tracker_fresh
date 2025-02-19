import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class WithUsVsWithoutUsScreen extends StatelessWidget {
  const WithUsVsWithoutUsScreen({Key? key}) : super(key: key);

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
                    currentScreen: 9, // Step number from Compose code
                    onBackPressed: () => context.pop(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Achieve your goals faster with us vs without us.", // Title Text
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 26), // Consistent title style
                  ),
                  const SizedBox(height: 4),
                  // No Subtitle Text in this screen based on Compose code
                  const SizedBox(height: 24), // Spacing after title
                ],
              ),
              Expanded( // Expanded to take remaining vertical space and center image
                child: Center( // Center the Image Vertically and Horizontally
                  child: AspectRatio(
                    aspectRatio: 660 / 578, // Aspect ratio from Compose code
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6, // surfaceContainerHighest approximation
                        borderRadius: BorderRadius.circular(16), // Rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0), // No padding for image
                        child: Image.asset(
                          'assets/images/light_withus.png', // Replace with your actual asset path
                          fit: BoxFit.fitWidth, // ContentScale.Fit
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: contentWidth,
                  height: 54,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      context.pushNamed('activity_level_of_user'); // Navigate to next screen (adjust route as needed)
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