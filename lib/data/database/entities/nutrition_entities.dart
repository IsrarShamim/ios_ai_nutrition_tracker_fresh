
import 'package:ai_nutrition_tracker_for_ios/data/database/repositories/meal_repo.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetDate.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetTime.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/TrackFoodProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../../../ui/auth/welcomescreens/2GoogleSignInScreen.dart';
import '../../../ui/common/SnackBar.dart';
import '../../../ui/screens/HomeScreen.dart';
import '../../../ui/screens/diary/DiaryProvider.dart';
import '../../util/GenerateRandom10DigitString.dart';
import '../repositories/nutrition_repo.dart';
import 'meal_entities.dart';
import 'package:provider/provider.dart';

part 'nutrition_entities.g.dart';

@collection
class Nutrition {
  Id id = Isar.autoIncrement; // Auto-incrementing ID

  @Index(unique: true) // Make the date unique
  String? date; // Use DateTime for dates

  int water = 0;
  int targetWater = 0;
  int calories = 0;
  int targetCalories = 0;
  int carbohydrates = 0;
  int targetCarbohydrates = 0;
  int protein = 0;
  int targetProtein = 0;
  int fat = 0;
  int targetFat = 0;
  int fiber = 0;
  int targetFiber = 0;
  int sodium = 0;
  int targetSodium = 0;
  int sugar = 0;
  int targetSugar = 0;
  int calcium = 0;
  int targetCalcium = 0;
  int magnesium = 0;
  int targetMagnesium = 0;
  int potassium = 0;
  int targetPotassium = 0;
  String? dailyFoodReport; // Make nullable for potential null values
  String? exerciseCalories; // Make nullable

  void resetNutritionTracking() {
    water = 0;
    calories = 0;
    carbohydrates = 0;
    protein = 0;
    fat = 0;
    fiber = 0;
    sodium = 0;
    sugar = 0;
    calcium = 0;
    magnesium = 0;
    potassium = 0;

    // Consider handling dailyFoodReport and exerciseCalories here as needed (reset or keep)
  }
}


@collection
class NutritionGoal {
  Id id = Isar.autoIncrement; // or a specific ID if needed

  @Index(unique: true) // Enforce uniqueness if required
  String? uniqueId; // Use this for the 'primary' equivalent. Consider using a different name.

  int targetWater = 0;
  int targetCalories = 0;
  int targetCarbohydrates = 0;
  int targetProtein = 0;
  int targetFat = 0;
  int targetFiber = 0;
  int targetSodium = 0;
  int targetSugar = 0;
  int targetCalcium = 0;
  int targetMagnesium = 0;
  int targetPotassium = 0;

  NutritionGoal({this.uniqueId}); // Constructor to easily set the uniqueId if used
}

@collection
class NutritionUploadStatus {  // More descriptive name
  Id id = Isar.autoIncrement; // Isar handles the ID

  @Index(unique: true) // Optional, for faster lookups if needed
  String? userId; //  Store userId to track which user's data was uploaded.


// You might want to add more fields here to track:
// DateTime? lastUploadTimestamp // To track when the last upload was
// bool isUploaded = false; // Simple boolean flag


}

Future<void> addMealAndUpdateNutrition(BuildContext context,Meal meal) async {

  final mealRepository = Provider.of<MealRepository>(context, listen: false);
  final nutritionRepository = Provider.of<NutritionRepository>(context, listen: false);

  await mealRepository.addMeal(meal.copyWith(timeOfThisMeal: getCurrentTime(),mealId: generateRandomDigits(10), timeThisMealWasLogged: getCurrentFormattedTime()));


  List<Meal> mealsForDay = await mealRepository.getMealsForDate(meal.date ?? getCurrentDate());

  // 3. Initialize totals.
  double totalCalories = 0;
  double totalCarbohydrates = 0;
  double totalProtein = 0;
  double totalFat = 0;
  double totalFiber = 0;
  double totalSodium = 0;
  double totalSugar = 0;
  double totalCalcium = 0;
  double totalMagnesium = 0;
  double totalPotassium = 0;

  // 4. Aggregate nutrient values from each meal.
  for (Meal m in mealsForDay) {
    totalCalories += m.mealCalories ;
    totalCarbohydrates += m.mealCarbohydrates ;
    totalProtein += m.mealProtein ;
    totalFat += m.mealFat;
    totalFiber += m.mealFiber ;
    totalSodium += m.mealSodium ;
    totalSugar += m.mealSugar ;
    totalCalcium += m.mealCalcium ;
    totalMagnesium += m.mealMagnesium ;
    totalPotassium += m.mealPotassium ;
  }

  // 5. Get or create the Nutrition record for that date.
  Nutrition? nutrition = await nutritionRepository.getNutritionForDate(meal.date ?? getCurrentDate());
  nutrition ??= Nutrition()..date = meal.date;

  // 6. Update the nutrition record with the aggregated values.
  nutrition.calories = totalCalories.toInt();
  nutrition.carbohydrates = totalCarbohydrates.toInt();
  nutrition.protein = totalProtein.toInt();
  nutrition.fat = totalFat.toInt();
  nutrition.fiber = totalFiber.toInt();
  nutrition.sodium = totalSodium.toInt();
  nutrition.sugar = totalSugar.toInt();
  nutrition.calcium = totalCalcium.toInt();
  nutrition.magnesium = totalMagnesium.toInt();
  nutrition.potassium = totalPotassium.toInt();

  // 7. Save the updated nutrition record.
  await nutritionRepository.addNutrition(nutrition);
  final date = Provider.of<DiaryProvider>(context, listen: false).dateForHomeScreen;
  await Provider.of<NutritionLoaderService>(context, listen: false)
      .loadNutritionForDate(date);
  // logger.d("SNAck SBAR APPEAR");
  NotificationHelper.showNotification(
    context: context,
    message: "Meal added!",
    type: NotificationType.success,
  );
}



Future<void> recalculateNutrition(BuildContext context,MealRepository mealRepository, NutritionRepository nutritionRepository) async {
  final date = Provider.of<DiaryProvider>(context, listen: false).dateForHomeScreen;


  // 2. Retrieve all meals for the same date as the added meal.
  // Assuming meal.date is a String representing the date (e.g., "2025-02-06")
  List<Meal> mealsForDay = await mealRepository.getMealsForDate(date);

  // 3. Initialize totals.
  double totalCalories = 0;
  double totalCarbohydrates = 0;
  double totalProtein = 0;
  double totalFat = 0;
  double totalFiber = 0;
  double totalSodium = 0;
  double totalSugar = 0;
  double totalCalcium = 0;
  double totalMagnesium = 0;
  double totalPotassium = 0;

  // 4. Aggregate nutrient values from each meal.
  for (Meal m in mealsForDay) {
    totalCalories += m.mealCalories ;
    totalCarbohydrates += m.mealCarbohydrates ;
    totalProtein += m.mealProtein ;
    totalFat += m.mealFat;
    totalFiber += m.mealFiber ;
    totalSodium += m.mealSodium ;
    totalSugar += m.mealSugar ;
    totalCalcium += m.mealCalcium ;
    totalMagnesium += m.mealMagnesium ;
    totalPotassium += m.mealPotassium ;
  }

  // 5. Get or create the Nutrition record for that date.
  Nutrition? nutrition = await nutritionRepository.getNutritionForDate(date ?? getCurrentDate());
  nutrition ??= Nutrition()..date = date;

  // 6. Update the nutrition record with the aggregated values.
  nutrition.calories = totalCalories.toInt();
  nutrition.carbohydrates = totalCarbohydrates.toInt();
  nutrition.protein = totalProtein.toInt();
  nutrition.fat = totalFat.toInt();
  nutrition.fiber = totalFiber.toInt();
  nutrition.sodium = totalSodium.toInt();
  nutrition.sugar = totalSugar.toInt();
  nutrition.calcium = totalCalcium.toInt();
  nutrition.magnesium = totalMagnesium.toInt();
  nutrition.potassium = totalPotassium.toInt();

  // 7. Save the updated nutrition record.
  await nutritionRepository.addNutrition(nutrition);
  await Provider.of<NutritionLoaderService>(context, listen: false)
      .loadNutritionForDate(date);
}
