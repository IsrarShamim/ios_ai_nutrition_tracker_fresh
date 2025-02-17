import 'package:flutter/foundation.dart'; // For debugPrint

import '../data_classes/nutrition/NutrientDataClasses.dart';
import '../database/entities/user_information.dart';
import 'NutritionCalculator.dart';

// Dart function equivalent to calculateTheTargetCalorieAndNutrientIntakeOfUser
Future<void> calculateTheTargetCalorieAndNutrientIntakeOfUser(
    {required UserInformationEntity
        userInformation, // Optional parameter - will be tried as fallback if DAO fails
    required void Function(NutritionPlan)
        returnTheNutritionPlan// Parameter for the default user, as in Kotlin's 'user' fallback
    }) async {
  try {
    // Use fetchedUserInformation if available, otherwise fallback to userInformation parameter, then defaultUser
    // final currentUserInformation = userInformation;

    final dailyCaloricGoal =
        NutritionCalculator.calculateDailyCalorieTarget(userInformation);
    final macroTargets =
        NutritionCalculator.calculateMacroTargets(dailyCaloricGoal);
    final targetFiber =
        generateTargetFiberPerDay(userInformation, dailyCaloricGoal);

    final nutritionPlanToInsert = NutritionPlan(
      dailyCalorieTarget: dailyCaloricGoal,
      targetWater:
      userInformation.gender.toLowerCase() == "male" ? 3000 : 2200,
      protein: Macro(percentage: 30, value: macroTargets[1], description: ""),
      // Protein at index 1
      carbohydrates:
          Macro(percentage: 40, value: macroTargets[0], description: ""),
      // Carbs at index 0
      fats: Macro(percentage: 30, value: macroTargets[2], description: ""),
      // Fats at index 2
      fibre: Macro(percentage: 0, value: targetFiber.toInt(), description: ""),
      sugar: Macro(percentage: 0, value: 0, description: ""),
      micronutrientBreakdown: Micronutrients(
        sodium: 2300,
        potassium: 4000,
        calcium: 1100,
        magnesium:
        userInformation.gender.toLowerCase() == "male" ? 420 : 350,
      ),
    );

    returnTheNutritionPlan(nutritionPlanToInsert);
  } catch (e) {
    debugPrint("Error in calculateTheTargetCalorieAndNutrientIntakeOfUser: $e");
  }
}
