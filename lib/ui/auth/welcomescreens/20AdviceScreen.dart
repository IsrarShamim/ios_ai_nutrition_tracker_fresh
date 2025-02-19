import 'package:ai_nutrition_tracker_for_ios/ui/common/welcome_screen_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../screens/chat_screen/MarkdownText.dart';
import '../welcome_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CompleteOnboardingFlowScreenDart extends StatefulWidget {
  const CompleteOnboardingFlowScreenDart({Key? key}) : super(key: key);

  @override
  State<CompleteOnboardingFlowScreenDart> createState() =>
      _CompleteOnboardingFlowScreenDartState();
}

class _CompleteOnboardingFlowScreenDartState
    extends State<CompleteOnboardingFlowScreenDart> {
  bool _didCallGenerateMessage = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call generateWelcomeMessage only once.
    if (!_didCallGenerateMessage) {
      Provider.of<WelcomeScreenProvider>(context, listen: false)
          .generateWelcomeMessage(context);
      _didCallGenerateMessage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          height: double.infinity,
          child: Consumer<WelcomeScreenProvider>(
            builder: (context, provider, child) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WelcomeScreenNumberIndicator(
                        currentScreen: 18,
                        onBackPressed: () => context.pop(),
                      ),
                      const SizedBox(height: 32),
                      if (!provider.isWelcomeMessageLoaded)
                        HealthLoadingScreen()
                      else
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // const SizedBox(height: 0),
                                WelcomeMessageScreenDart(
                                  welcomeMessage: provider
                                      .welcomeMessageAfterOnboardingFlow,
                                ),
                                const SizedBox(height: 90),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Positioned(
                    child: SizedBox(
                      width: screenWidth,
                      height: 54,
                      child: CupertinoButton.filled(
                        onPressed: () => context.pushNamed('subscription_plan'),
                        borderRadius: BorderRadius.circular(27),
                        child: const Text(
                          "Ask questions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class WelcomeMessageScreenDart extends StatelessWidget {
  final String welcomeMessage;

  const WelcomeMessageScreenDart({Key? key, required this.welcomeMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: MarkdownMessage(isSent: false, message: welcomeMessage,),
    );
  }
}

class HealthLoadingScreen extends StatefulWidget {
  final Duration duration;

  const HealthLoadingScreen(
      {Key? key, this.duration = const Duration(seconds: 4)})
      : super(key: key);

  @override
  State<HealthLoadingScreen> createState() => _HealthLoadingScreenState();
}

class _HealthLoadingScreenState extends State<HealthLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late Animation<double> _pulseAnimation;

  final List<String> _loadingTexts = [
    "Analyzing your fitness goals...",
    "Processing health data...",
    "Preparing your personalized plan...",
    "Almost there!",
  ];
  int _currentTextIndex = 0;

  @override
  void initState() {
    super.initState();

    // Setup pulse animation
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Setup rotation animation
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Setup text changing
    _startChangingText();

    // Navigate after duration
    Future.delayed(widget.duration, () {
      // Add your navigation logic here
    });
  }

  void _startChangingText() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _currentTextIndex = (_currentTextIndex + 1) % _loadingTexts.length;
        });
        _startChangingText();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Creating Your Profile",
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer rotating ring
                AnimatedBuilder(
                  animation: _rotationController,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _rotationController.value * 2 * math.pi,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CupertinoColors.systemBlue.withOpacity(0.3),
                            width: 4,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Pulsing heart icon
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: const Icon(
                    CupertinoIcons.heart_fill,
                    color: CupertinoColors.systemPink,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _loadingTexts[_currentTextIndex],
                key: ValueKey<String>(_loadingTexts[_currentTextIndex]),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.systemGrey,
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
