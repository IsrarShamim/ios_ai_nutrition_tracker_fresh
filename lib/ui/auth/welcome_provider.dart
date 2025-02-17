import 'dart:math';

import 'package:ai_nutrition_tracker_for_ios/data/data_classes/nutrition/NutrientDataClasses.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/user_information.dart';
import 'package:ai_nutrition_tracker_for_ios/data/gemini/GeminiModels.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/11HowFastPerWeek.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/2GoogleSignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../data/FakeDataHolders.dart';
import '../../data/gemini/prompts/OnBoardingFlowSummarizingPrompt.dart';

class WelcomeScreenProvider extends ChangeNotifier {
  //general
  UserInformationEntity userInformationHolder = fakeUserUserInformation;
  NutritionPlan nutritionPlan = testNutritionPlan;

  //NameScreen --------------------------------------------------------------

  String _name = ''; // Private variable to store the name
  String get name => _name; // Getter to access the name
  void setName(String newName) {
    _name = newName;
    userInformationHolder = userInformationHolder.copyWith(
        name: newName); // Update userInformationHolder
    notifyListeners(); // Notify listeners that the name has changed
  }

  void clearName() {
    // Optional: Method to clear the name if needed
    _name = '';
    userInformationHolder = userInformationHolder.copyWith(
        name: ''); // Update userInformationHolder
    notifyListeners();
  }

  //GenderScreen ------------------------------------------------------------
  String _selectedGender = ''; // Private variable to store selected gender

  String get selectedGender => _selectedGender; // Getter for selected gender

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    userInformationHolder = userInformationHolder.copyWith(
        gender: gender); // Update userInformationHolder
    notifyListeners(); // Notify listeners of gender change
  }

  //WeightAndDietScreen -------------------------------------------------------

  bool _ifMetric =
      false; // Default to Imperial (false) initially, or true for Metric default
  bool get ifMetric => _ifMetric;

  void setIfMetric(bool value) {
    _ifMetric = value;
    userInformationHolder =
        userInformationHolder.copyWith(weightUnit: ifMetric ? "kg" : "lbs");
    notifyListeners();
  }

  int _height = 170; // Default height in cm
  int get height => _height;

  void setHeight(int value) {
    _height = value;
    userInformationHolder = userInformationHolder.copyWith(
        height: value
            .toDouble()); // Update userInformationHolder, convert int to double
    notifyListeners();
  }

  void _updateHeightFromFeetAndInches() {
    // Convert feet and inches to centimeters.
    final totalInches = (_feet * 12) + _inches;
    final heightCm = totalInches * 2.54;
    // Update the height (assuming setHeight expects an int, so round if needed)
    setHeight(heightCm.round());
  }

  int _feet = 5; // Default feet
  int get feet => _feet;

  void setFeet(int value) {
    _feet = value;
    _updateHeightFromFeetAndInches();
    notifyListeners();
  }

  int _inches = 9; // Default inches
  int get inches => _inches;

  void setInches(int value) {
    _inches = value;
    _updateHeightFromFeetAndInches();
    notifyListeners();
  }

  int _weightInKgs = 30; // Default weight in kg
  int get weightInKgs => _weightInKgs;

  void setWeightInKgs(int value, bool ifUserHasSelectedMetric) {
    _weightInKgs = value;
    if (ifUserHasSelectedMetric) {
      userInformationHolder = userInformationHolder.copyWith(
          weight: value
              .toDouble()); // Update userInformationHolder, convert int to double
      logger.d(
          "INSIDE KGS AND SET USERINFO HOLDER . WEIGHT --> ${userInformationHolder.weight}");
    }
    notifyListeners();
  }

  int _weightInLbs = 100; // Default weight in lbs
  int get weightInLbs => _weightInLbs;

  void setWeightInLbs(int value, bool ifUserHasSelectedImperial) {
    _weightInLbs = value;
    if (ifUserHasSelectedImperial) {
      userInformationHolder = userInformationHolder.copyWith(
          weight: value
              .toDouble()); // Update userInformationHolder, convert int to double
      logger.d(
          "INSIDE LBS AND SET USERINFO HOLDER . WEIGHT --> ${userInformationHolder.weight}");
    }
    notifyListeners();
  }

  // double get weight {
  //   // Unified weight getter in kg
  //   userInformationHolder = userInformationHolder.copyWith(weightUnit: weightUnit); // Ensure weightUnit is updated when weight is accessed
  //   return ifMetric
  //       ? _weightInKgs.toDouble()
  //       : _weightInLbs * 0.453592; // Convert lbs to kg
  // }
  //
  // double get heightInCm {
  //   // Unified height getter in cm
  //   userInformationHolder = userInformationHolder.copyWith(heightUnit: heightUnit); // Ensure heightUnit is updated when height is accessed
  //   return ifMetric
  //       ? _height.toDouble()
  //       : ((_feet * 12) + _inches) * 2.54; // Convert feet and inches to cm
  // }

  String get weightUnit => ifMetric ? "kg" : "lbs";

  String get heightUnit => ifMetric ? "cm" : "ft";

  //AgeScreen -----------------------------------------------------------------
  int _age = 25; // Default age
  int get age => _age;

  void setAge(int value) {
    _age = value;
    userInformationHolder = userInformationHolder.copyWith(
        age: value); // Update userInformationHolder
    notifyListeners();
  }

  int _birthMonth = 6; // Default birth month (June)
  int get birthMonth => _birthMonth;

  void setBirthMonth(int value) {
    _birthMonth = value;
    notifyListeners();
  }

  int _birthDay = 15; // Default birth day (15th)
  int get birthDay => _birthDay;

  void setBirthDay(int value) {
    _birthDay = value;
    notifyListeners();
  }

  int _birthYear = 2000; // Default birth year (2000)
  int get birthYear => _birthYear;

  void setBirthYear(int value) {
    _birthYear = value;
    notifyListeners();
  }

  // ***************** GoalSettingScreen **************
  final List<String> _selectedGoals = []; // List to store selected goals
  List<String> get selectedGoals => _selectedGoals; // Getter for selected goals

  void toggleGoalSelection(String goal) {
    if (_selectedGoals.contains(goal)) {
      _selectedGoals.remove(goal);
    } else {
      // Logic to handle mutually exclusive goals (Weight Gain, Loss, Maintain)
      if (goal == "Weight Gain") {
        _selectedGoals.remove("Weight Loss");
        _selectedGoals.remove("Weight Maintain");
      } else if (goal == "Weight Loss") {
        _selectedGoals.remove("Weight Gain");
        _selectedGoals.remove("Weight Maintain");
      } else if (goal == "Weight Maintain") {
        _selectedGoals.remove("Weight Gain");
        _selectedGoals.remove("Weight Loss");
      }
      _selectedGoals.add(goal);
    }
    logger.e(_selectedGoals);
    logger.e(userInformationHolder.goal);
    userInformationHolder = userInformationHolder.copyWith(
        goal: _selectedGoals); // Update userInformationHolder
    notifyListeners(); // Notify listeners about changes in selected goals
  }

  int _weightGoalAsInt = 0;

  int get weightGoalAsInt => _weightGoalAsInt;

  void setWeightGoalAsInt(int value) {
    _weightGoalAsInt = value;
    userInformationHolder = userInformationHolder.copyWith(
        weightGoal:
            value.toString()); // Update userInformationHolder, store as String
    notifyListeners();
  }

  // How Fast Per Week SCREen
  double weightGoalPerWeek = 8;

  void setWeightGoalPerWeek(double value) {
    weightGoalPerWeek = value;
    final valuesList = values(ifMetric);
    final int roundedIndex = weightGoalPerWeek.round();
    final String displayValue =
        valuesList[min(roundedIndex, valuesList.length - 1)];

    userInformationHolder = userInformationHolder.copyWith(
        weightGoalPerWeek: displayValue
            .toString()); // Update userInformationHolder, store as String
    notifyListeners();
  }

  // ***************** ActivityAndGoalScreen *********
  // Added for ActivityAndGoalScreen
  Pair _selectedActivityLevel =
      Pair("Sedentary", "Little or no exercise"); // Default activity level
  Pair get selectedActivityLevel => _selectedActivityLevel;

  void setSelectedActivityLevel(Pair level) {
    _selectedActivityLevel = level;
    userInformationHolder = userInformationHolder.copyWith(
        currentActivityLevel: level
            .activityLevel); // Update userInformationHolder using Pair's value1
    notifyListeners();
  }

  final List<Pair> _activityLevels = [
    // Activity levels data (as Pairs)
    Pair("Sedentary", "Little or no exercise"),
    Pair("Lightly Active", "Light exercise/sports 1-3 days/week"),
    Pair("Moderately Active", "Moderate exercise/sports 3-5 days/week"),
    Pair("Very Active", "Hard exercise/sports 6-7 days a week"),
    Pair("Extra Active", "Very hard daily exercise/sports & physical job"),
  ];

  List<Pair> get activityLevels => _activityLevels;

  // ***************** DietScreen ********************
  String _selectedDiet = ''; // Track selected diet

  String get selectedDiet => _selectedDiet;

  void setSelectedDiet(String diet) {
    _selectedDiet = diet;
    userInformationHolder = userInformationHolder.copyWith(
        diet: diet); // Update userInformationHolder
    notifyListeners();
  }

  //Other Goals Screen

  void toggleOtherGoalSelection(String goal) {
    if (_selectedGoals.contains(goal)) {
      _selectedGoals.remove(goal);
    } else {
      _selectedGoals.add(goal);
    }
    userInformationHolder = userInformationHolder.copyWith(
        goal: _selectedGoals); // Update userInformationHolder
    // `exercise` and `exerciseAmount` are related to "Other Goals" screen based on your previous example, but not directly mapped to `_selectedOtherGoals` list.
    // You'll need to determine how you want to map "Other Goals" selections to `exercise` and `exerciseAmount` if needed.
    // For now, `_selectedOtherGoals` list itself is not directly updating `userInformationHolder`.

    notifyListeners();
  }

  // ADVICE SCREEN ****************************************

  //Welcome Message Generation --------------------------------------------------
  String _welcomeMessageAfterOnboardingFlow = '';

  String get welcomeMessageAfterOnboardingFlow =>
      _welcomeMessageAfterOnboardingFlow;

  set welcomeMessageAfterOnboardingFlow(String value) {
    _welcomeMessageAfterOnboardingFlow = value;
    notifyListeners();
  }

  bool _isWelcomeMessageLoaded = false;

  bool get isWelcomeMessageLoaded => _isWelcomeMessageLoaded;

  set isWelcomeMessageLoaded(bool value) {
    _isWelcomeMessageLoaded = value;
    notifyListeners();
  }

  Future<void> generateWelcomeMessage(BuildContext context) async {
    logger.d("inside");
    if (_welcomeMessageAfterOnboardingFlow.isNotEmpty) {
      return;
    }
    // Using Future for async operations, no viewModelScope.launch/Dispatchers.IO in Flutter
    try {
      final content = [
        Content.text(onBoardingFlowSummarizePromptDart(userInformationHolder))
        // Use the correct prompt function
      ];
      logger.d("FIRST TRYE");

      // TRY WITH 1.5 PRO (Placeholder for Gemini API call)
      // Simulate Gemini 1.5 Pro call
      final geminiResponse =
          gemini1Point5ProWelcomeMessage.generateContentStream(content);
      await for (final response in geminiResponse) {
        final text = response.text; // Extract text from GenerateContentResponse
        if (text != null) {
          logger.d("response -- >  ${response.text}");
          welcomeMessageAfterOnboardingFlow +=
              text; // Append text chunk to responseText
          isWelcomeMessageLoaded = true;
        }
      }
      // Assign accumulated text
    } catch (e) {
      logger.d("SECOND TRYE");
      // TRY AGAIN WITH 1.5 PRO
      try {
        final content = [
          Content.text(onBoardingFlowSummarizePromptDart(userInformationHolder))
          // Use the correct prompt function
        ];
        final geminiResponse =
            gemini1Point5ProWelcomeMessage.generateContentStream(content);
        await for (final response in geminiResponse) {
          final text =
              response.text; // Extract text from GenerateContentResponse
          if (text != null) {
            welcomeMessageAfterOnboardingFlow =
                text; // Append text chunk to responseText
        isWelcomeMessageLoaded = true;
          }
        }
      } catch (e) {
        logger.d("THIRD TRYE");
        // 1.5 PRO FAILED!. NOW TRY WITH 1.5 FLASH
        try {
          final content = [
            Content.text(
                onBoardingFlowSummarizePromptDart(userInformationHolder))
            // Use the correct prompt function
          ];
          final geminiResponse =
              gemini1Point5FlashWelcomeMessage.generateContentStream(content);
          await for (final response in geminiResponse) {
            final text =
                response.text; // Extract text from GenerateContentResponse
            if (text != null) {
              welcomeMessageAfterOnboardingFlow =
                  text; // Append text chunk to responseText
          isWelcomeMessageLoaded = true;
            }
          }
        } catch (e) {
          logger.d("FOURTH TRYE");
          // TRY WITH 1.5 FLASH AGAIN
          try {
            final content = [
              Content.text(
                  onBoardingFlowSummarizePromptDart(userInformationHolder))
              // Use the correct prompt function
            ];
            final geminiResponse =
                gemini1Point5FlashWelcomeMessage.generateContentStream(content);
            await for (final response in geminiResponse) {
              final text =
                  response.text; // Extract text from GenerateContentResponse
              if (text != null) {
                welcomeMessageAfterOnboardingFlow =
                    text; // Append text chunk to responseText
            isWelcomeMessageLoaded = true;
              }
            }
          } catch (e) {
            logger.d("FIFTH TRYE");
            // NOW TRY WITH 1.0 PRO
            try {
              final content = [
                Content.text(
                    onBoardingFlowSummarizePromptDart(userInformationHolder))
                // Use the correct prompt function
              ];
              final geminiResponse =
                  gemini1WelcomeMessage.generateContentStream(content);
              await for (final response in geminiResponse) {
                final text =
                    response.text; // Extract text from GenerateContentResponse
                if (text != null) {
                  welcomeMessageAfterOnboardingFlow =
                      text; // Append text chunk to responseText
              isWelcomeMessageLoaded = true;
                }
              }
            } catch (e) {
              logger.d("FAILED EVERYTHING TRYE");
              logger.d("ERROR -- > ${e}");
              // EVERYTHING FAILED, GENERATE CUSTOM MESSAGE
              isWelcomeMessageLoaded = true;
              welcomeMessageAfterOnboardingFlow =
                  "Failed to generate personalized welcome message. Please check your internet connection or try again later.";
            }
          }
        }
      }
    }
  }

  // Exercise related variables (if you want to manage them in this provider based on "Other Goals")
  String _exercise = '';

  String get exercise => _exercise;

  void setExercise(String exercise) {
    _exercise = exercise;
    userInformationHolder = userInformationHolder.copyWith(exercise: exercise);
    notifyListeners();
  }

  int _exerciseAmount = 0;

  int get exerciseAmount => _exerciseAmount;

  void setExerciseAmount(int amount) {
    _exerciseAmount = amount;
    userInformationHolder =
        userInformationHolder.copyWith(exerciseAmount: amount);
    notifyListeners();
  }

  // Location variable
  String _location = '';

  String get location => _location;

  void setLocation(String location) {
    _location = location;
    userInformationHolder = userInformationHolder.copyWith(location: location);
    notifyListeners();
  }
}

class Pair {
  // <-- Pair class is nested here
  String activityLevel;
  String description;

  Pair(this.activityLevel, this.description);
}
