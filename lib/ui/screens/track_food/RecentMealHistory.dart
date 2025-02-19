import 'dart:io';

import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/TrackFoodProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../data/database/entities/meal_entities.dart';
import '../../../data/database/repositories/meal_repo.dart';
import '../../../data/util/GetTime.dart';
import 'FoodLoggingScreen.dart';

class RecentMealsScreen extends StatelessWidget {
  final int mealLimit; // Number of meals to fetch (50 or 100)

  const RecentMealsScreen(
      {super.key, this.mealLimit = 50}); // Default to 50 meals

  @override
  Widget build(BuildContext context) {
    final mealRepo = Provider.of<MealRepository>(context, listen: false);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Recent Meals"),
      ),
      child: FutureBuilder<List<Meal>>(
        future: mealRepo.getMostRecentMeals(mealLimit), // Fetch meals
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CupertinoActivityIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading meals"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No meals logged yet"));
          }

          final meals = snapshot.data!;

          return CupertinoScrollbar(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 86),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return HistoryItem(
                  foodName: meal.mealDescription ?? "Unknown Meal",
                  calories: "${meal.mealCalories}",
                  time: meal.timeThisMealWasLogged ?? "Unknown Time",
                  imageUrl: meal.imageUrl,
                  // Default icon
                  mealId: meal.id, // Default icon
                );
              },
            ),
          );
        },
      ),
    );
  }
}
class HistoryItem extends StatelessWidget {
  final String foodName;
  final String calories;
  final String time;
  final int mealId; // Used to lookup the meal when tapped
  final String? imageUrl; // Optional image URL for this meal

  const HistoryItem({
    Key? key,
    required this.foodName,
    required this.calories,
    required this.time,
    required this.mealId,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Make the item clickable.
      onTap: () async {
        // Obtain the repositories/providers.
        final mealRepo = Provider.of<MealRepository>(context, listen: false);
        final provider =
        Provider.of<FoodAnalysisProvider>(context, listen: false);
        // Retrieve the meal by its mealId.
        final meal = await mealRepo.getMealById(mealId);

        provider.setMealLoadingState();
        // Navigate to the meal details screen.
        context.pushNamed('meal_details_screen');

        if (meal != null) {
          provider.setMealSuccessState(meal);
        } else {
          provider.setMealErrorState("No data available");
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: CupertinoColors.systemGrey4),
        ),
        child: Row(
          children: [
            // The image container: show an image if provided, otherwise show a placeholder icon.
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
              child: buildImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // '$calories calories • ${timeAgo(time)}',
                    '$calories calories • $time',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              size: 16,
              color: CupertinoColors.systemGrey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns a widget that displays an image from [imagePath] or a placeholder if unavailable.
  Widget buildImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return _buildImagePlaceholder();
    }

    // Case 1: Network image
    if (imagePath.startsWith('http')) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
      );
    }

    // Case 2: File image (from device storage)
    if (File(imagePath).existsSync()) {
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
      );
    }

    // Case 3: Asset image
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
    );
  }

  /// Returns a placeholder widget when an image cannot be loaded.
  Widget _buildImagePlaceholder() {
    return Center(
      child: Icon(
        Icons.fastfood, // Use the provided icon (e.g., fast-food icon) as a placeholder.
        color: CupertinoColors.systemGrey,
        size: 22,
      ),
    );
  }
}
