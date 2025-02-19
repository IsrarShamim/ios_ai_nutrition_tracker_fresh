import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../data/database/entities/meal_entities.dart';
import '../../../data/gemini/GeminiModels.dart';
import '../track_food/TrackFoodProvider.dart';
// Import your Gemini package/model as needed

class FoodAnalysisProvider2 extends ChangeNotifier {

  // New fields to store the generated summary and its loading state.
  String mealSummary = "";
  int previousMealCalories = 0;
  int previousMealProtein = 0;
  int previousMealCarbohydrates = 0;
  int previousMealFats = 0;
  bool isSummaryLoading = false;


  /// Generates a concise summary for the current meal using geminiChatSession.
  Future<void> generateMealSummary(String prompt,Meal meal) async {
    // Prevent duplicate calls if already loading.
    if (isSummaryLoading) return;
    previousMealCalories = meal.mealCarbohydrates;
    previousMealProtein = meal.mealProtein;
    previousMealCarbohydrates = meal.mealCarbohydrates;
    previousMealFats = meal.mealFat;

    isSummaryLoading = true;
    mealSummary = "";
    notifyListeners();

    // Create the request content. (Assuming geminiChatSession accepts a Content.text request.)
    final content = Content.text(prompt);

    // Get the streaming response from Gemini.
    final Stream<GenerateContentResponse> responseStream =
    geminiChatSession.sendMessageStream(content);

    // Build the summary as chunks arrive.
    await for (final chunk in responseStream) {
      mealSummary += (chunk.text ?? "");
      notifyListeners();
    }

    isSummaryLoading = false;
    notifyListeners();
  }
}
