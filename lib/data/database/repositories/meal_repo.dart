// meal_repository.dart
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/meal_entities.dart';
import 'package:isar/isar.dart';

import '../../../ui/auth/welcomescreens/2GoogleSignInScreen.dart';

class MealRepository {
  final Isar isar;

  MealRepository(this.isar);

  Future<List<Meal>> getAllMeals() async {
    return isar.meals.where().findAll(); // Consider adding sorting if needed.
  }

  Future<Meal?> getMealById(int mealId) async {
    // Assuming that mealId is a String field in Meal
    return await isar.meals.filter().idEqualTo(mealId).findFirst();
  }


  Future<List<Meal>> getMealsForDate(String date) async {
    return isar.meals.where().dateEqualTo(date)
        .sortByTimeOfThisMealDesc().findAll(); // Add sorting as needed.

  }


  Future<List<Meal>> getMostRecentMeals(int limit) async {
    return await isar.meals.where()
        .sortByTimeOfThisMealDesc() // Sort by ID in descending order (most recent first)
        .limit(limit) // Get the latest 50 meals
        .findAll();
  }


  Future<void> addMeal(Meal meal) async {
    logger.d("meal -- > ${meal.toString()}");
    await isar.writeTxn(() async {
      await isar.meals.put(meal);
    });
  }


  /// Checks if a meal exists in the database by its [mealId].
  Future<bool> mealExists(String mealId) async {
    final Meal? meal = await isar.meals.filter().mealIdEqualTo(mealId).findFirst();
    return meal != null;
  }

  /// Deletes a meal by its [mealId].
  Future<void> deleteMeal(String mealId) async {
    await isar.writeTxn(() async {
      // Using deleteAll() on the filtered query deletes all meals with the given mealId.
      await isar.meals.filter().mealIdEqualTo(mealId).deleteAll();
    });
  }

  Future<void> clearAllMeals() async {
    await isar.writeTxn(() async {
      await isar.meals.clear();
    });

  }



}