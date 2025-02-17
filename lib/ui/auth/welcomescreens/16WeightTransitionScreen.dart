import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Make sure to replace with your actual import
import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart'; // Import your provider


class WeightTransitionScreen extends StatelessWidget {
  const WeightTransitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Builder(
          builder: (context) {
            return CupertinoPageScaffold(
              backgroundColor: CupertinoColors.systemBackground,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WelcomeScreenNumberIndicator(
                        currentScreen: 13,
                        onBackPressed: () => context.pop(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "You are always one decision away from changing your life.", // Added \n for line break
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 660 / 578, // Maintain image aspect ratio
                          child: Container(
                            decoration: BoxDecoration(
                              color: CupertinoColors.tertiarySystemBackground,
                              borderRadius: BorderRadius.circular(16),
                            ),


                            child: Image.asset(
                              Theme.of(context).brightness == Brightness.light
                                  ? 'assets/images/light_weight_transition.png' // Replace with your light theme image
                                  : 'assets/images/dark_weight_transition.png', // Replace with your dark theme image

                              fit: BoxFit.contain, // Ensure image fits within the container
                            ),
                          ),
                        ),
                      ),



                      Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: screenWidth,
                            height: 54,
                            child: CupertinoButton.filled(
                              onPressed: () {
                                context.pushNamed('testimonials_screen'); // Replace with your route
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
            );
          }

    );
  }
}