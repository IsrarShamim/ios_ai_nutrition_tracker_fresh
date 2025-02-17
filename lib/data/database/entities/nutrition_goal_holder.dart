import 'package:isar/isar.dart';

import '../../data_classes/nutrition/NutrientDataClasses.dart';

part 'nutrition_goal_holder.g.dart';

@collection
class NutritionGoalHolder {
  Id id = Isar.autoIncrement; // Use Isar's auto-increment

  @Index(unique: true) // Assuming you want only one goal holder
  String isarId = 'primary'; // Rename 'id' since Isar uses 'id'

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


  NutritionGoalHolder(); // Empty constructor needed for Isar

  // Optional: A factory constructor to make creation easier
  factory NutritionGoalHolder.create({
    required int targetWater,
    required int targetCalories,
    required int targetCarbohydrates,
    required int targetProtein,
    required int targetFat,
    required int targetFiber,
    required int targetSodium,
    required int targetSugar,
    required int targetCalcium,
    required int targetMagnesium,
    required int targetPotassium,
  }) {
    return NutritionGoalHolder()
      ..targetWater = targetWater
      ..targetCalories = targetCalories
      ..targetCarbohydrates = targetCarbohydrates
      ..targetProtein = targetProtein
      ..targetFat = targetFat
      ..targetFiber = targetFiber
      ..targetSodium = targetSodium
      ..targetSugar = targetSugar
      ..targetCalcium = targetCalcium
      ..targetMagnesium = targetMagnesium
      ..targetPotassium = targetPotassium;
  }


  factory NutritionGoalHolder.fromNutritionPlan(NutritionPlan plan) {
    return NutritionGoalHolder()
      ..targetWater = plan.targetWater
      ..targetCalories = plan.dailyCalorieTarget
      ..targetCarbohydrates = plan.carbohydrates.value
      ..targetProtein = plan.protein.value
      ..targetFat = plan.fats.value
      ..targetFiber = plan.fibre.value
      ..targetSodium = plan.micronutrientBreakdown.sodium
      ..targetSugar = plan.sugar.value
      ..targetCalcium = plan.micronutrientBreakdown.calcium
      ..targetMagnesium = plan.micronutrientBreakdown.magnesium
      ..targetPotassium = plan.micronutrientBreakdown.potassium;
  }

}