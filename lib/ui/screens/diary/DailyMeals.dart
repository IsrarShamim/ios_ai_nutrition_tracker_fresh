import 'package:ai_nutrition_tracker_for_ios/data/util/GetTime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import '../../../data/database/entities/meal_entities.dart';
import '../../../data/database/repositories/meal_repo.dart';
import '../track_food/TrackFoodProvider.dart';
import 'DiaryProvider.dart';

class DiaryMealsScreen extends StatelessWidget {
  final String selectedDate;

  const DiaryMealsScreen({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealRepo = Provider.of<MealRepository>(context, listen: false);

    return FutureBuilder<List<Meal>>(
      future: mealRepo.getMealsForDate(selectedDate),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child:
                Column(
                  children: [
                    SizedBox(height: 42,),
                    CupertinoActivityIndicator(radius: 12),

                  ],
                )
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 42,),
                Icon(
                  CupertinoIcons.exclamationmark_circle,
                  size: 48,
                  color: Colors.red.shade300,
                ),
                const SizedBox(height: 16),
                Text(
                  "Couldn't load meals",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Trigger a rebuild to retry.
                    (context as Element).markNeedsBuild();
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        final meals = snapshot.data ?? [];

        if (meals.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 28,),
                Icon(
                  Icons.fastfood_rounded,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  "No meals logged for this date",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Navigate to add meal screen or show add meal bottom sheet.
                    // Add your navigation logic here.
                  },
                  child: const Text("Add Your First Meal"),
                ),
              ],
            ),
          );
        }

        // Simply display the meals in a scrollable list.
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return DiaryMealItem(
              foodName: meal.mealDescription ?? "Unknown Meal",
              calories: "${meal.mealCalories}",
              time: meal.timeThisMealWasLogged ?? "Unknown Time",
              imageUrl: meal.imageUrl,
              mealId: meal.id,
            );
          },
        );

      },
    );
  }
}

class DiaryMealItem extends StatelessWidget {
  final String foodName;
  final String calories;
  final String time;
  final int mealId;
  final String? imageUrl;

  const DiaryMealItem({
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
      onTap: () async {
        final mealRepo = Provider.of<MealRepository>(context, listen: false);
        final provider = Provider.of<FoodAnalysisProvider>(context, listen: false);

        provider.setMealLoadingState();
        final meal = await mealRepo.getMealById(mealId);

        context.pushNamed('meal_details_screen');

        if (meal != null) {
          provider.setMealSuccessState(meal);
        } else {
          provider.setMealErrorState("No data available");
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[100],
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
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$calories calories',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              timeAgo(time),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    CupertinoIcons.chevron_right,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                ),
              ),
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
        errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
      );
    }

    if (File(imagePath).existsSync()) {
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
      );
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: Colors.grey[100],
      child: const Center(
        child: Icon(
          Icons.restaurant,
          color: Colors.grey,
          size: 32,
        ),
      ),
    );
  }
}
