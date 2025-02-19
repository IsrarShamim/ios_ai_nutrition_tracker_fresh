import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../data/database/entities/meal_entities.dart';
import '../../../data/database/entities/user_information.dart';
import '../../../data/gemini/prompts/GenerateMealConsiceResponse.dart';
import '../chat_screen/ChatProvider.dart';
import 'FoodAnalysisProvider.dart';

class MealSummarySection extends StatelessWidget {
  final Meal meal;
  final UserInformationEntity userInfo;

  const MealSummarySection({
    Key? key,
    required this.meal,
    required this.userInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analysisProvider = Provider.of<FoodAnalysisProvider2>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (analysisProvider.previousMealCarbohydrates != meal.mealCarbohydrates &&
          analysisProvider.previousMealCalories != meal.mealCalories &&
          analysisProvider.previousMealProtein != meal.mealProtein &&
          analysisProvider.previousMealFats != meal.mealFat) {
        analysisProvider.mealSummary = "";
      }

      if (!analysisProvider.isSummaryLoading && analysisProvider.mealSummary.isEmpty) {
        final prompt = generateLLMContextPrompt(meal, userInfo);
        analysisProvider.generateMealSummary(prompt, meal);
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFF5F7FA),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 12,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: analysisProvider.isSummaryLoading
                    ? const ShimmerChatBubble(isSent: false)
                    : Text(
                  analysisProvider.mealSummary,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Color(0xFF2D3142),
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFF1F3F5),
                      width: 1,
                    ),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<ChatProvider>(context, listen: false)
                        .sendUserMessage("Tell me more about this meal");
                    context.pushNamed("ChatScreen");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D3142),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Continue in Chat",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.3,
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

class ShimmerEffect extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500)
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final slidePercent = _controller.value * 3 - 1;
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(slidePercent - 1, 0),
              end: Alignment(slidePercent, 0),
              colors: const [
                Color(0xFFF1F3F5),
                Color(0xFFFAFBFC),
                Color(0xFFF1F3F5),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
    );
  }
}

class ShimmerChatBubble extends StatelessWidget {
  final bool isSent;

  const ShimmerChatBubble({Key? key, required this.isSent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: _buildShimmerLines(context),
      ),
    );
  }

  Widget _buildShimmerLines(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShimmerEffect(width: screenWidth * 0.8, height: 16, borderRadius: 4),
        const SizedBox(height: 12),
        ShimmerEffect(width: screenWidth * 0.7, height: 16, borderRadius: 4),
        const SizedBox(height: 12),
        ShimmerEffect(width: screenWidth * 0.6, height: 16, borderRadius: 4),
      ],
    );
  }
}