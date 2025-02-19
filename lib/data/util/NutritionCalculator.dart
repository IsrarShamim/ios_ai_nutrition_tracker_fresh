import 'dart:math';
import 'package:flutter/foundation.dart';

import '../database/entities/user_information.dart'; // For debugPrint

class NutritionCalculator {
  static const double caloriesPerKgOfWeightLossPerWeek = 7000.0; // Approximately 3500 calories per pound

  static int calculateBMR(UserInformationEntity user) {
    double weightKg = convertToKg(user.weight, user.weightUnit);
    debugPrint("NutritionCalculator: weightKg -> $weightKg");
    double heightCm = user.height;
    debugPrint("NutritionCalculator: heightCm -> $heightCm");
    double bmr;
    if (user.gender.toLowerCase() == "male") {
      bmr = 88.362 + (13.397 * weightKg) + (4.799 * heightCm) - (5.677 * user.age);
    } else {
      bmr = 447.593 + (9.247 * weightKg) + (3.098 * heightCm) - (4.330 * user.age);
    }
    return bmr.round(); // Dart's round() returns int
  }

  static int calculateDailyCalorieNeeds(UserInformationEntity user) {
    int bmr = calculateBMR(user);
    debugPrint("NutritionCalculator: bmr -> $bmr");
    double activityFactor;
    switch (user.currentActivityLevel.toLowerCase()) {
      case "sedentary":
        activityFactor = 1.2;
        break;
      case "lightly active":
        activityFactor = 1.375;
        break;
      case "moderately active":
        activityFactor = 1.55;
        break;
      case "very active":
        activityFactor = 1.725;
        break;
      case "extra active":
        activityFactor = 1.9;
        break;
      default:
        activityFactor = 1.2; // Default to sedentary
    }
    debugPrint("NutritionCalculator: user.currentActivityLevel.toLowerCase() - >>${user.currentActivityLevel.toLowerCase()}");
    debugPrint("NutritionCalculator: activityFactor - >>$activityFactor");
    return (bmr * activityFactor).round();
  }

  static int calculateCalorieDifferenceForWeightLossOrGainPerDay(String unit, double targetWeightDifference) {
    if (unit != "lbs") {
      return (targetWeightDifference * caloriesPerKgOfWeightLossPerWeek).round() ~/ 7; // Use ~/ for integer division
    } else {
      return (targetWeightDifference * 0.453592 * caloriesPerKgOfWeightLossPerWeek).round() ~/ 7; // Use ~/ for integer division
    }
  }

  static int calculateDailyCalorieTarget(UserInformationEntity user) {
    int dailyCalorieNeeds = calculateDailyCalorieNeeds(user);
    debugPrint("NutritionCalculator: dailyCalorieNeeds -> $dailyCalorieNeeds");
    debugPrint("NutritionCalculator: user.weightGoal -> ${user.weightGoal}");
    int calorieDifference = 0; // Initialize to 0
    if (user.goal.contains("Weight Loss") || user.goal.contains("Weight Gain")) {
      double targetWeightDifferencePerDay = double.tryParse(user.weightGoalPerWeek) ?? 0.5; // Default to 0.5 kg/week if parsing fails
      debugPrint("NutritionCalculator: targetWeightLossPerWeekKg-> $targetWeightDifferencePerDay");
      calorieDifference = calculateCalorieDifferenceForWeightLossOrGainPerDay(user.weightUnit, targetWeightDifferencePerDay);
    } else {
      calorieDifference = 0; // No deficit if no weight goal
    }
    debugPrint("NutritionCalculator: calorieDeficit -> $calorieDifference");
    int dailyTarget = dailyCalorieNeeds; // Initialize with daily needs

    if (user.goal.contains("Weight Loss")) {
      dailyTarget -= calorieDifference;
    } else if (user.goal.contains("Weight Gain")) {
      dailyTarget += calorieDifference;
    }

    return max(dailyTarget, (user.gender.toLowerCase() == "male" ? 1500 : 1201)); // Minimum calorie intake
  }

  static List<int> calculateMacroTargets(
      int dailyCalorieTarget, {
        double carbRatio = 0.4,
        double proteinRatio = 0.3,
        double fatRatio = 0.3,
      }) {
    int carbCalories = (dailyCalorieTarget * carbRatio).round();
    int proteinCalories = (dailyCalorieTarget * proteinRatio).round();
    int fatCalories = (dailyCalorieTarget * fatRatio).round();
    return [
      carbCalories ~/ 4, // 4 calories per gram of carbs, integer division
      proteinCalories ~/ 4, // 4 calories per gram of protein, integer division
      fatCalories ~/ 9, // 9 calories per gram of fat, integer division
    ];
  }

  static double calculateBMI(UserInformationEntity user) {
    double weightInKg = convertToKg(user.weight, user.weightUnit);
    double heightInMeters = user.height / 100.0;
    debugPrint("NutritionCalculator: weightInKg BMI -> $weightInKg");
    debugPrint("NutritionCalculator: heightInMeters BMI -> $heightInMeters");
    return (weightInKg / (heightInMeters * heightInMeters)).round().toDouble(); // Keep as double for BMI
  }

  // Helper function to round a double to a specified number of decimal places
  static double roundTo(double value, int decimals) {
    double factor = pow(10, decimals).toDouble();
    return (value * factor).round() / factor;
  }

  // Helper functions for unit conversions
  static double convertToKg(double weight, String unit) {
    if (unit.toLowerCase() != "lbs") {
      return weight;
    } else {
      return weight * 0.453592;
    }
  }

  static int convertToCm(double height, String unit) { // Changed height to double to match entity
    if (unit.toLowerCase() == "cm") {
      return height.round(); // Round to int as height is expected in cm as int
    } else {
      // Assuming feet and inches (e.g., "5'10"") - This logic might need adjustment for direct height in feet/inches in your Flutter app
      int feet = (height / 12).floor(); // floor() for integer part of feet
      int inches = (height % 12).round(); // Remaining as inches (approx.)
      return (feet * 30.48 + inches * 2.54).round();
    }
  }
}

// Top-level function (outside the class)
double generateTargetFiberPerDay(
    UserInformationEntity usrInformationEntity,
    int targetCalories,
    ) {
  if (usrInformationEntity.gender == "Male") { // Case-sensitive comparison, consider toLowerCase() if needed
    return (targetCalories / 2000) * 40;
  } else {
    return (targetCalories / 2000) * 25;
  }
}