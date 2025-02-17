import 'data_classes/nutrition/NutrientDataClasses.dart';
import 'database/entities/user_information.dart';

UserInformationEntity fakeUserUserInformation = UserInformationEntity( // Example User - replace with your actual data source
id: 1,
name: "Test User",
age: 35,
weight: 150.0,
weightUnit: "lbs",
height: 180.0,
heightUnit: "cm",
gender: "Male",
location: "Example City",
diet: "Omnivore",
goal: ["Weight Loss"],
currentActivityLevel: "Moderately Active",
exercise: "Running",
exerciseAmount: 30,
weightGoal: "180",
weightGoalPerWeek: "0.5",
// weightRecords: "",
// weightRecordsTime: "",
weightRecordsForNext3Months: [],
weightRecordsTimeForNext3Months: [],
);

// Create a test NutritionPlan variable
NutritionPlan testNutritionPlan = NutritionPlan(
  dailyCalorieTarget: 2000,
  targetWater: 2500,
  protein: Macro(
    percentage: 30,
    value: 150,
    description: "Protein for muscle building",
  ),
  carbohydrates: Macro(
    percentage: 40,
    value: 200,
    description: "Carbohydrates for energy",
  ),
  fats: Macro(
    percentage: 30,
    value: 67,
    description: "Fats for hormone regulation",
  ),
  sugar: Macro(
    percentage: 0,
    value: 25, // Example value, could be 0 or another test value
    description: "Limit added sugars",
  ),
  fibre: Macro(
    percentage: 0,
    value: 30, // Example value, could be 0 or another test value
    description: "Fibre for digestion",
  ),
  micronutrientBreakdown: Micronutrients(
    sodium: 2300,
    potassium: 3500,
    calcium: 1000,
    magnesium: 400,
  ),
);