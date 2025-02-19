import 'dart:io';
import 'dart:math';

import 'package:ai_nutrition_tracker_for_ios/data/data_classes/nutrition/NutrientDataClasses.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/user_information.dart';
import 'package:ai_nutrition_tracker_for_ios/data/gemini/GeminiModels.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetDate.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/11HowFastPerWeek.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/2GoogleSignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class DiaryProvider extends ChangeNotifier {

  //Home Screen
  String _dateForHomeScreen = getCurrentDate(); // Default to today's date

  String get dateForHomeScreen => _dateForHomeScreen;

  set dateForHomeScreen(String newDate) {
    _dateForHomeScreen = newDate;
    notifyListeners(); // Important: Notify listeners when the date changes
  }

  DateTime _dateTime = DateTime.now(); // Default to today's date

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime newDate) {
    _dateTime = newDate;
    notifyListeners(); // Important: Notify listeners when the date changes
  }
}
