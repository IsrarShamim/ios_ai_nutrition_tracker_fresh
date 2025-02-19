import '../../database/entities/meal_entities.dart';
import '../../database/entities/user_information.dart';

String generateLLMContextPrompt(Meal meal, UserInformationEntity user) {
  return '''
Context for the LLM:

Screen Details:
The screen displays nutritional information for a food item, including calories, macronutrients (protein, fats, carbohydrates), and micronutrients.

Meal Details:
  - Meal ID: ${meal.mealId ?? "N/A"}
  - Date: ${meal.date ?? "N/A"}
  - Calories: ${meal.mealCalories}
  - Carbohydrates: ${meal.mealCarbohydrates}
  - Protein: ${meal.mealProtein}
  - Fat: ${meal.mealFat}
  - Fiber: ${meal.mealFiber}
  - Sodium: ${meal.mealSodium}
  - Sugar: ${meal.mealSugar}
  - Calcium: ${meal.mealCalcium}
  - Magnesium: ${meal.mealMagnesium}
  - Potassium: ${meal.mealPotassium}

User Information:
  - Name: ${user.name}
  - Age: ${user.age}
  - Weight: ${user.weight} ${user.weightUnit}
  - Height: ${user.height} ${user.heightUnit}
  - Gender: ${user.gender}
  - Location: ${user.location}
  - Diet: ${user.diet}
  - Goals: ${user.goal.join(', ')}
  - Activity Level: ${user.currentActivityLevel}
  - Exercise: ${user.exercise} (${user.exerciseAmount})
  - Weight Goal: ${user.weightGoal} (${user.weightGoalPerWeek})

Objective:
Generate a brief, friendly, and contextual health insight text that interprets the nutritional numbers in a way that’s accessible and helpful to the user.

Tone/Style:
Informative but not overly prescriptive.
Emphasize that the food offers a balanced mix of nutrients.
Encourage the idea of incorporating this food into an overall balanced diet.
Keep the response concise but very, very helpful and relevant.

Example for Reference:
“Nutritional Snapshot: This meal provides a balanced mix of macros to fuel your day—with ample protein for muscle repair, healthy fats for nutrient absorption, and carbohydrates to keep your energy levels steady. Enjoy it as part of a varied, balanced diet!”
or if you think this meal is very helpful for the users goals or is incredibly bad for users goal mention that instead , for example :
"This meal is a smart choice for your fat-loss journey. It features lean protein to help preserve muscle while you shed fat, just the right amount of healthy fats to keep you satisfied, and complex carbohydrates for steady, energy-sustaining fuel. Enjoy this balanced dish as part of your mindful nutrition plan to support your goals."
Instruction for the LLM:
"your response should only contain the necessary content and not anything else, only the summary of the food and nothing else. and than continue to chat normally without mentioning anything that is unnatural like the meal id. the user should only see your human nutritionist side ."
"Using the context above, please generate a similar contextual health insight text that briefly summarizes the nutritional information of a food item. Aim for a tone that’s friendly and accessible. and be super concise "
''';
}
