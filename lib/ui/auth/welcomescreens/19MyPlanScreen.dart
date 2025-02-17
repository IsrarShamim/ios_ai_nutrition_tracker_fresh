import 'package:ai_nutrition_tracker_for_ios/ui/common/welcome_screen_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../data/data_classes/nutrition/NutrientDataClasses.dart';
import '../welcome_provider.dart';

import 'dart:ui';

import '2GoogleSignInScreen.dart';

/// A simple fade-in widget that animates its child's opacity.
class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  const FadeIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
  }) : super(key: key);

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _opacity = 1;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      opacity: _opacity,
      child: widget.child,
    );
  }
}

/// A reusable glass card effect widget.
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  const GlassCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.withOpacity(0.7),
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey.withOpacity(0.2),
                blurRadius: 16,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class MyPlanScreen extends StatelessWidget {
  const MyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      // backgroundColor: const Color(0xFF3E2723), // cupercino background
      child: SafeArea(
        child: Consumer<WelcomeScreenProvider>(
          builder: (context, provider, child) {
            final user = provider.userInformationHolder;
            final nutritionPlan = provider.nutritionPlan;
            final ifLose = user.goal.contains("Weight Loss")
                ? true
                : user.goal.contains("Weight Gain")
                ? false
                : null;

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      FadeIn(
                        delay: const Duration(milliseconds: 100),
                        child: WelcomeScreenNumberIndicator(
                          currentScreen: 16,
                          onBackPressed: () => context.pop(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeIn(
                        delay: const Duration(milliseconds: 200),
                        child: _PlanReadyHeader(
                          weightGoal: user.weightGoal,
                          ifLose: ifLose,
                          unit: provider.ifMetric ? "kgs" : "lbs",
                        ),
                      ),
                      // const SizedBox(height: 24),
                      FadeIn(
                        delay: const Duration(milliseconds: 300),
                        child: _DailyGoalsCard( plan: nutritionPlan,),
                      ),
                      // const SizedBox(height: 32),
                      FadeIn(
                        delay: const Duration(milliseconds: 400),
                        child: _GoalTipsContainer(),
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: FadeIn(
                    delay: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: screenWidth,
                      height: 54,
                      child: CupertinoButton.filled(
                        onPressed: () { // Correct onPressed callback
                          logger.d("pressed");
                          context.pushNamed('advice_screen');
                          logger.d("pressed 22");
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
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PlanReadyHeader extends StatelessWidget {
  final String weightGoal;
  final bool? ifLose;
  final String unit;

  const _PlanReadyHeader({
    required this.weightGoal,
    required this.ifLose,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          CupertinoIcons.check_mark_circled_solid,
          size: 70,
          color: CupertinoColors.activeGreen,
        ),
        const SizedBox(height: 20),
        Text(
          "Congratulations!\nYour custom plan is ready.",
          style: CupertinoTheme.of(context)
              .textTheme
              .navLargeTitleTextStyle
              .copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        // const SizedBox(height: 12),
      ],
    );
  }
}

class _DailyGoalsCard extends StatelessWidget {
  final NutritionPlan plan;

  const _DailyGoalsCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text("DAILY GOALS",
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [CupertinoColors.activeGreen, CupertinoColors.systemBlue],
            ).createShader(bounds),
            child: Text("${plan.dailyCalorieTarget} kcal",
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: CupertinoColors.white)),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _MacroPill(title: "PROTEIN", value: plan.protein.value),
              _MacroPill(title: "CARBS", value: plan.carbohydrates.value),
              _MacroPill(title: "FATS", value: plan.fats.value),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroPill extends StatelessWidget {
  final String title;
  final int value;

  const _MacroPill({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        // color: CupertinoColors.tertiarySystemFill,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(title,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 12)),
          const SizedBox(height: 2), // Added spacing here

          Text("$value g",
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontWeight: FontWeight.w700,fontSize: 18)),
        ],
      ),
    );
  }
}

class _GoalTipsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SUCCESS TIPS",
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          ...List.generate(4, (index) => _TipRow(index: index)),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final int index;

  const _TipRow({required this.index});

  @override
  Widget build(BuildContext context) {
    final tips = [
      ("Ask AI Nutritionist", CupertinoIcons.chat_bubble_2_fill),
      ("Track Progress", CupertinoIcons.chart_bar_alt_fill),
      ("Healthy Choices", CupertinoIcons.heart_fill),
      ("Stay Active", CupertinoIcons.arrow_right_circle_fill),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(tips[index].$2, size: 24, color: CupertinoColors.systemGrey),
          const SizedBox(width: 16),
          Expanded(child: Text(tips[index].$1)),
          const Icon(CupertinoIcons.chevron_right,
              size: 16, color: CupertinoColors.systemGrey),
        ],
      ),
    );
  }
}

// class _NextButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);
//
//     return CupertinoButton.filled(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       borderRadius: BorderRadius.circular(27),
//       onPressed: () => () {
//         context.pushNamed('advice_screen');
//         provider.generateWelcomeMessage(context);
//       },
//       child: const Text(
//         "Next",
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }
