import 'dart:io';

import 'package:ai_nutrition_tracker_for_ios/data/database/entities/user_information.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/repositories/nutrition_repo.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/repositories/user_information_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:go_router/go_router.dart'; // Import Provider package

import '../../../data/database/entities/meal_entities.dart';
import '../../../data/database/entities/nutrition_entities.dart';
import '../../../data/database/repositories/meal_repo.dart';
import '../../common/SnackBar.dart';
import '../track_food/TrackFoodProvider.dart';
import 'FoodAnalysisProvider.dart';
import 'FoodAnalysisWidget.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  double _multiplier = 1.0;

  void _updateMultiplier(double value) {
    setState(() {
      _multiplier = value.clamp(0.5, 5.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealRepo = Provider.of<MealRepository>(context);
    final nutritionRepo = Provider.of<NutritionRepository>(context);
    return Consumer<FoodAnalysisProvider>(
      builder: (context, mealDetailsProvider, _) {
        final state = mealDetailsProvider.mealScreenState;
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: Stack(
            children: [
              // 1. Image Section (with Back Button)
              Column(
                children: [
                  // Image Section with Back Button
                  Stack(
                    children: [
                      if (state.status == MealScreenStateStatus.success &&
                          state.meal?.imageUrl != null &&
                          state.meal!.imageUrl!.isNotEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          child: buildImage(state.meal!.imageUrl),
                        )
                      else
                        _buildImagePlaceholder(),
                      // Back Button at Top Left
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 16,
                        left: 16,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 42,
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          onPressed: () => context.pop(),
                          child: const Icon(
                            CupertinoIcons.back,
                            size: 20,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // 2. Delete Button (positioned in the same layer as the back button)
              if (state.status == MealScreenStateStatus.success)
                FutureBuilder<bool>(
                  future: mealRepo.mealExists(state.meal!.mealId ?? ""),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data == true) {
                      return Positioned(
                        top: MediaQuery.of(context).padding.top + 16,
                        right: 16,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 42,
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          onPressed: () async {
                            await mealRepo.deleteMeal(state.meal!.mealId ?? "");
                            recalculateNutrition(
                                context, mealRepo, nutritionRepo);

                            context.pop();
                            // Show error notification
                            NotificationHelper.showNotification(
                              context: context,
                              message: "Meal deleted",
                              type: NotificationType.info,
                            );
                          },
                          child: const Icon(
                            CupertinoIcons.delete, // Minimal delete icon
                            size: 20,
                            color: CupertinoColors.black,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),

              // 3. Bottom Sheet (drawn last, so it covers the delete button when expanded)
              DraggableScrollableSheet(
                initialChildSize: 0.65,
                minChildSize: 0.65,
                maxChildSize: 0.95,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: _buildBottomSheetContent(state),
                          ),
                        ),
                        if (state.status == MealScreenStateStatus.success)
                          Positioned(
                            bottom: 20,
                            left: 16,
                            right: 16,
                            child: Row(
                              children: [
                                _buildMultiplierControl(),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: SaveButton(
                                    onSavePressed: () {
                                      // Provider.of<FoodAnalysisProvider2>(context).mealSummary == "";
                                      addMealAndUpdateNutrition(
                                          context,
                                          multiplyMeal(
                                              state.meal!, _multiplier));
                                      context.pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetContent(MealScreenState state) {
    switch (state.status) {
      case MealScreenStateStatus.loading:
        return _buildLoadingState();
      case MealScreenStateStatus.success:
        return _buildSuccessState(state.meal!);
      case MealScreenStateStatus.error:
        return _buildErrorState(
            state.errorMessage ?? "Failed to load meal details.");
      default: // initial state
        return _buildInitialState();
    }
  }

  Widget _buildInitialState() {
    return const Center(
      child: Text("Analyzing Meal..."),
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }

  Widget _buildSuccessState(Meal meal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sheet Handle
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 12, bottom: 20),
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ),

        // Header Section with Name, Time - Cleaner Header & Time Chip
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.mealDescription ?? 'Meal Details',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Chip(
                backgroundColor: Colors.grey.shade200,
                padding: EdgeInsets.zero,
                labelPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.time_solid,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      meal.timeThisMealWasLogged ?? 'Time not specified',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Calories Section
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _buildCaloriesCard((meal.mealCalories * _multiplier).toInt()),
        ),


        // Macros Grid
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            children: [
              Expanded(
                child: _buildMacroCard(
                  'Protein',
                  (meal.mealProtein * _multiplier).toInt(),
                  Colors.red[400]!,
                  CupertinoIcons.flame_fill,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMacroCard(
                  'Carbs',
                  (meal.mealCarbohydrates * _multiplier).toInt(),
                  Colors.green[400]!,
                  Icons.energy_savings_leaf_rounded,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMacroCard(
                  'Fat',
                  (meal.mealFat * _multiplier).toInt(),
                  Colors.orange[400]!,
                  CupertinoIcons.drop_fill,
                ),
              ),
            ],
          ),
        ),

        FutureBuilder<UserInformationEntity?>(
          future: Provider.of<UserInfoRepository>(context, listen: false)
              .getUserInformationEntity(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator for the MealSummarySection
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle the error case
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              // Handle the null case if needed
              return Center(child: Text('No user information available.'));
            } else {
              // When the user info is available, return the widget that depends on it.
              final userInfo = snapshot.data!;
              return MealSummarySection(meal: meal, userInfo: userInfo);
            }
          },
        ),

        // Additional Nutrients Section
        buildAdditionalNutrientsSection(meal),
        // const SizedBox(height: 20),

        // Wrap only MealSummarySection in a FutureBuilder


        // const SizedBox(height: 30),
        const SizedBox(height: 100),
      ],
    );
  }


  Widget buildAdditionalNutrientsSection(Meal meal) {
    final bool hasNutrients = (meal.mealFiber) != 0 ||
        (meal.mealSugar) != 0 ||
        (meal.mealSodium) != 0 ||
        (meal.mealCalcium) != 0 ||
        (meal.mealMagnesium) != 0 ||
        (meal.mealPotassium) != 0;

    if (!hasNutrients) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Additional Nutrients',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if ((meal.mealFiber) != 0) _buildNutrientRow('Fiber', meal.mealFiber),
          if ((meal.mealSugar) != 0) _buildNutrientRow('Sugar', meal.mealSugar),
          if ((meal.mealSodium) != 0)
            _buildNutrientRow('Sodium', meal.mealSodium),
          if ((meal.mealCalcium) != 0)
            _buildNutrientRow('Calcium', meal.mealCalcium),
          if ((meal.mealMagnesium) != 0)
            _buildNutrientRow('Magnesium', meal.mealMagnesium),
          if ((meal.mealPotassium) != 0)
            _buildNutrientRow('Potassium', meal.mealPotassium),
        ],
      ),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.clear_circled_solid,
              color: CupertinoColors.destructiveRed,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: CupertinoColors.destructiveRed),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return _buildImagePlaceholder();
    }

    if (imagePath.startsWith('http')) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImagePlaceholder();
        },
      );
    }

    if (File(imagePath).existsSync()) {
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImagePlaceholder();
        },
      );
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _buildImagePlaceholder();
      },
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      color: Colors.grey[200],
      child: const Center(
        child: Icon(
          Icons.restaurant_menu,
          size: 80,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildCaloriesCard(int calories) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.flame_fill,
            color: Colors.blue[600],
            size: 30,
          ),
          const SizedBox(width: 12),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
              children: <TextSpan>[
                TextSpan(text: '$calories'),
                const TextSpan(
                  text: ' kcal',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiplierControl() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _updateMultiplier(_multiplier - 0.25),
            child: Icon(CupertinoIcons.minus, size: 20, color: Colors.blueGrey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '${(_multiplier * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _updateMultiplier(_multiplier + 0.25),
            child: Icon(CupertinoIcons.plus, size: 20, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroCard(String title, int value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(
            '${value}g',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: color.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientRow(String nutrient, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nutrient,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          Text(
            '${(value * _multiplier).toInt()}mg',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final VoidCallback onSavePressed;

  const SaveButton({
    Key? key,
    required this.onSavePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.blue[600]!],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // context.pop();
            onSavePressed();
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final fakeMeal = Meal()
  ..mealId = 'meal_001'
  ..date = '2025-02-05'
  ..timeThisMealWasLogged = '12:00'
  ..timeOfThisMeal = 9900092
  ..mealDescription = 'Grilled Chicken Salad with Avocado'
  ..exactMealAmount = '1 large bowl'
  ..mealCalories = 480
  ..mealWater = 300
  ..mealCarbohydrates = 35
  ..mealProtein = 35
  ..mealFat = 25
  ..mealFiber = 12
  ..mealSodium = 600
  ..mealSugar = 8
  ..mealCalcium = 250
  ..mealMagnesium = 80
  ..mealPotassium = 500
  ..imageUrl = 'assets/images/grilled_chicken_salad.png'
  ..positives = 'Rich in protein, healthy fats, and fiber.'
  ..negatives = 'Moderate sodium content.'
  ..nutritionalBrief =
      'A nutritious and balanced meal, ideal for lunch or dinner.'
  ..vitaminsAndMineralsBrief =
      'Excellent source of Vitamin K, good source of Vitamin C and Potassium.'
  ..namesOfAlternateFoods = 'Salmon Salad, Quinoa and Black Bean Bowl'
  ..reasonOfAlternateFoods = 'For variety, or to reduce fat content.'
  ..namesOfPairFoods = 'Lemon Water, Whole Grain Roll'
  ..reasonsOfPairFoods = 'Hydration and added complex carbohydrates.';
