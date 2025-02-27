import 'dart:convert';
import 'dart:io';

import 'package:ai_nutrition_tracker_for_ios/data/gemini/GeminiModels.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetDate.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetTime.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/meals/MealScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../data/data_classes/nutrition/BarcodeSearch.dart';
import '../../../data/data_classes/nutrition/FoodInfo.dart';
import '../../../data/database/entities/meal_entities.dart';
import '../../../data/gemini/prompts/ScanFoodsPromt.dart';
import '../../../data/https/BarcodeSearch.dart';
import '../../auth/welcomescreens/2GoogleSignInScreen.dart';

enum MealScreenStateStatus {
  initial,
  loading,
  success,
  error,
}

class MealScreenState {
  final MealScreenStateStatus status;
  final Meal? meal;
  final String? errorMessage;

  MealScreenState({
    this.status = MealScreenStateStatus.initial,
    this.meal,
    this.errorMessage,
  });

  MealScreenState.initial() : this(status: MealScreenStateStatus.initial);

  MealScreenState.loading() : this(status: MealScreenStateStatus.loading);

  MealScreenState.success(Meal meal)
      : this(status: MealScreenStateStatus.success, meal: meal);

  MealScreenState.error(String message)
      : this(status: MealScreenStateStatus.error, errorMessage: message);
}

class FoodAnalysisProvider extends ChangeNotifier {
  //Meal Screen

  MealScreenState _mealScreenState =
      MealScreenState.success(fakeMeal); // Initial state

  MealScreenState get mealScreenState => _mealScreenState;

  void setMealLoadingState() {
    _mealScreenState = MealScreenState.loading();
    notifyListeners();
  }

  void setMealSuccessState(Meal meal) {
    _mealScreenState = MealScreenState.success(meal);
    notifyListeners();
  }

  void setMealErrorState(String message) {
    _mealScreenState = MealScreenState.error(message);
    notifyListeners();
  }

  void resetState() {
    _mealScreenState = MealScreenState.initial();
    notifyListeners();
  }

  Future<void> loadFoodProductAnalysis(String barcode) async {
    setMealLoadingState();
    notifyListeners(); // Notify listeners that state is loading

    try {
      await loadFoodAnalysis(
        barCode: barcode,
        getOpenFoodFactsProduct: (OpenFoodFactsProduct product) {
          setMealSuccessState(convertOpenFoodFactsToMeal(product));
          notifyListeners(); // Notify listeners that data is loaded successfully
        },
        error: () {
          setMealErrorState(
              "Product Not Found\n\n Please try again or use other methods.");
          notifyListeners(); // Notify listeners of error state
        },
      );
    } catch (e) {
      setMealErrorState("Error loading product analysis: $e");
      notifyListeners(); // Notify listeners of error state
    }
  }

  //***CAMERA SCREEN
  File? _imageFile; // Private variable to hold the File

  File? get imageFile => _imageFile; // Getter to access the File

  // Function to set or update the imageFile
  void setImageFile(File? newImageFile) {
    _imageFile = newImageFile;
    notifyListeners(); // Important: Notify listeners of the change
  }

  String _additionalContext = ""; // Default to today's date

  String get additionalContext => _additionalContext;

  set additionalContext(String newAdditionalContext) {
    _additionalContext = newAdditionalContext;
    notifyListeners(); // Important: Notify listeners when the date changes
  }

  Future<void> scanFoodImageOfUserWithGemini(BuildContext context) async {
    setMealLoadingState();

    if (_imageFile == null) {
      logger.d("No Image ");
      setMealErrorState("No image selected.");
      return;
    }

    final imageInBytes = await _imageFile!.readAsBytes();

    GenerateContentResponse? firstAnalysisResponseText;
    GenerateContentResponse? finalJsonResponseText;

    try {
      // First Analysis - Food Recognition without JSON
      try {
        final content = [
          Content.multi([
            TextPart(
                firstAnalyzeWhatFoodIsInTheImagesInJsonFormatOnFoodImagesPrompt(
                    foodContext: _additionalContext)),
            // The only accepted mime types are image/*.
            DataPart('image/jpeg', imageInBytes)
          ])
        ];
        firstAnalysisResponseText =
            await gemini1Point5ProForFoodScan.generateContent(content);
      } catch (e) {
        final content = [
          Content.multi([
            TextPart(
                firstAnalyzeWhatFoodIsInTheImagesInJsonFormatOnFoodImagesPrompt(
                    foodContext: _additionalContext)),
            // The only accepted mime types are image/*.
            DataPart('image/jpeg', imageInBytes)
          ])
        ];
        firstAnalysisResponseText =
            await gemini1Point5ProForFoodScan.generateContent(content);
      }

      // Second Analysis - Get Nutritional Info in JSON
      try {
        final content = [
          Content.multi([
            TextPart(returnAnalysisInJsonFormatOnFoodImagesPrompt(
                foodContext:
                    firstAnalysisResponseText.text ?? "No food identified",
                userContext: _additionalContext)),
            // The only accepted mime types are image/*.
            DataPart('image/jpeg', imageInBytes)
          ])
        ];
        finalJsonResponseText =
            await gemini1Point5ProForFoodScan.generateContent(content);
      } catch (e) {
        final content = [
          Content.multi([
            TextPart(returnAnalysisInJsonFormatOnFoodImagesPrompt(
                foodContext:
                    firstAnalysisResponseText.text ?? "No food identified",
                userContext: _additionalContext)),
            // The only accepted mime types are image/*.
            DataPart('image/jpeg', imageInBytes)
          ])
        ];
        finalJsonResponseText =
            await gemini1Point5ProForFoodScan.generateContent(content);
      }

      if (finalJsonResponseText.text != null &&
          finalJsonResponseText.text!.isNotEmpty) {
        try {
          var foodInfo =
              FoodInfo.fromJson(jsonDecode(finalJsonResponseText.text ?? ""));

          Meal? meal = convertFoodInfoToMeal(foodInfo).copyWith(
              imageUrl: _imageFile!.path,
              date: getCurrentDate(),
              timeThisMealWasLogged: getCurrentFormattedTime());

          setMealSuccessState(meal);
          final currentRouteName = GoRouter.of(context).state.name;
          if (currentRouteName != 'meal_details_screen') {
            context.pushNamed('meal_details_screen');
          }
        } catch (e) {
          rethrow;
        }
      } else {
        setMealErrorState("No response from Gemini.");
      }
    } catch (e) {
      debugPrint("Gemini API or General Error: $e");
      setMealErrorState("Error analyzing food image: $e");
    } finally {
      _additionalContext = ""; // Clear additional context after analysis
    }
  }

  Future<void> generateAnalysisForText(
      String text, BuildContext context) async {
    // Start by setting the UI to a loading state.
    setMealLoadingState();


    final generatedPrompt = generateFoodInfoClassBasedOnText(text);
    final content = [Content.text(generatedPrompt)];
    try {
      // Generate the prompt string for text analysis.

      // Call the repository to get the text analysis response.
      final response =
          await gemini1Point5ProForFoodScan.generateContent(content);
      String responseText = response.text ?? "null";

      // Log the raw response for debugging.
      logger.d("responseAPI ->\n$responseText");


      if (responseText != "null" && responseText.isNotEmpty) {
        try {
          // Try parsing the JSON into a FoodInfo instance.
          final foodInfo = FoodInfo.fromJson(
              jsonDecode(responseText) as Map<String, dynamic>);

          // Convert the FoodInfo to a Meal model.
          final Meal meal = convertFoodInfoToMeal(foodInfo).copyWith(
            // If you have an image file selected, use its path (or any other image URL).
            imageUrl: _imageFile?.path,
            date: getCurrentDate(),
            timeThisMealWasLogged: getCurrentFormattedTime(),
          );

          // Update the UI state to success.
          setMealSuccessState(meal);

          // Check the current route before navigating.
          final currentRouteName = GoRouter.of(context).state.name;
          if (currentRouteName != 'meal_details_screen') {
            context.pushNamed('meal_details_screen');
          }
        } catch (e) {
          // If parsing failed, try an alternative repository call.
          try {
            final errorResponse =
                await gemini1Point5ProForFoodScan.generateContent(content);
            final foodInfo = FoodInfo.fromJson(
                jsonDecode(errorResponse.text ?? "null")
                    as Map<String, dynamic>);
            final Meal meal = convertFoodInfoToMeal(foodInfo).copyWith(
              imageUrl: _imageFile?.path,
              date: getCurrentDate(),
              timeThisMealWasLogged: getCurrentFormattedTime(),
            );
            setMealSuccessState(meal);
            // Check the current route before navigating.
            final currentRouteName = GoRouter.of(context).state.name;
            if (currentRouteName != 'meal_details_screen') {
              context.pushNamed('meal_details_screen');
            }
          } catch (e) {
            // If still failing, update the UI state to error.
            setMealErrorState("Failed");
          }
        }
      } else {
        // If no valid JSON response is returned.
        setMealErrorState("Failed");
      }
    } catch (e) {
      debugPrint("Gemini API or General Error: $e");
      setMealErrorState("Error analyzing food text: $e");
    }
  }
}


