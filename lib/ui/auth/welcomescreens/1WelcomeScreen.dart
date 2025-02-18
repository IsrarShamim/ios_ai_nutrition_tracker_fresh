import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class AWelcomeScreen extends StatefulWidget {
  const AWelcomeScreen({super.key});

  @override
  State<AWelcomeScreen> createState() => _AWelcomeScreenState();
}

class _AWelcomeScreenState extends State<AWelcomeScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 1, // Adjusted to show partial next page
  );

  int _currentPage = 0; // Track the current page index


  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageViewScroll); // Correct listener attachment
  }

  // Separate function for listener callback
  void _onPageViewScroll() {
    if (_pageController.page != null) { // Check if page is not null
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 1. Welcome Text
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Welcome to",
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "AI Nutrition Tracker",
                      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                        color: CupertinoColors.activeBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // 2. Pages and Indicator
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: const [
                          FirstPage(), // Replace with your actual page widgets
                          FirstPageSecond(),
                          SecondPage(),
                          ThirdPage(),
                          FourthPage(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: DotIndicator( // Replace with your DotIndicator implementation
                        count: 5,
                        currentIndex: _currentPage,
                        activeColor: CupertinoColors.activeBlue,
                        inactiveColor: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                  left: 16, // Add left padding
                  right: 16, // Add right padding
                ),
                child: SizedBox(
                  height: 54,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      context.pushNamed('googleSignIn');                     },
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(27),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}



class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1, // Or adjust as needed for your image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.asset(
                'assets/images/scan_food_new.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "Snap what you are eating",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}



class FirstPageSecond extends StatelessWidget {
  const FirstPageSecond({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1, // Or adjust as needed for your image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.asset(
                'assets/images/track_food_new.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "Track it in 5 seconds",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1, // Or adjust as needed for your image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.asset(
                'assets/images/page_three.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "6 unbelievably Easy Food Tracking Options", // Let the text wrap naturally
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1, // Or adjust as needed for your image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.asset(
                'assets/images/page_fourth.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "Unlock true potential of your fridge", // Let the text wrap naturally
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1, // Or adjust as needed for your image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.asset(
                'assets/images/page_fifth.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "AI Nutritionist",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Get personalized advice",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CupertinoColors.inactiveGray),  // Slightly lighter color for secondary text
          ),
        ],
      ),
    );
  }
}

//Custom Dot Indicator Widget
class DotIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;

  const DotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the dots horizontally
      children: List.generate(count, (index) {
        return Container(
          width: 8, // Adjust dot size
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}