
import '../../database/entities/nutrition_goal_holder.dart';

class NutritionPlan {
  final int dailyCalorieTarget;
  final int targetWater;
  final Macro protein;
  final Macro carbohydrates;
  final Macro fats;
  final Macro sugar;
  final Macro fibre;
  final Micronutrients micronutrientBreakdown;

  NutritionPlan({
    required this.dailyCalorieTarget,
    required this.targetWater,
    required this.protein,
    required this.carbohydrates,
    required this.fats,
    required this.sugar,
    required this.fibre,
    required this.micronutrientBreakdown,
  });
}

class Macro {
  final int percentage;
  final int value;
  final String description;

  Macro({
    required this.percentage,
    required this.value,
    required this.description,
  });
}

class Micronutrients {
  final int sodium;
  final int potassium;
  final int calcium;
  final int magnesium;

  Micronutrients({
    required this.sodium,
    required this.potassium,
    required this.calcium,
    required this.magnesium,
  });
}



NutritionPlan convertNutritionGoalToPlan(NutritionGoalHolder goal) {
  final totalMacros = goal.targetProtein + goal.targetCarbohydrates + goal.targetFat;

  int proteinPercentage = 0;
  int carbPercentage = 0;
  int fatPercentage = 0;

  if (totalMacros > 0) { // Avoid division by zero if totalMacros is 0
    proteinPercentage = ((goal.targetProtein.toDouble() / totalMacros) * 100).toInt();
    carbPercentage = ((goal.targetCarbohydrates.toDouble() / totalMacros) * 100).toInt();
    fatPercentage = ((goal.targetFat.toDouble() / totalMacros) * 100).toInt();
  }

  return NutritionPlan(
    dailyCalorieTarget: goal.targetCalories,
    targetWater: goal.targetWater,
    protein: Macro(percentage: proteinPercentage, value: goal.targetProtein, description: "Protein"),
    carbohydrates: Macro(percentage: carbPercentage, value: goal.targetCarbohydrates, description: "Carbohydrates"),
    fats: Macro(percentage: fatPercentage, value: goal.targetFat, description: "Fat"),
    sugar: Macro(percentage: 0, value: 0, description: "Sugar"), // Set to 0 as it's not provided in goal
    fibre: Macro(percentage: 0, value: 0, description: "Fibre"), // Set to 0 as it's not provided in goal
    micronutrientBreakdown: Micronutrients(sodium: 0, potassium: 0, calcium: 0, magnesium: 0), // Set all micronutrients to 0 as not provided
  );
}