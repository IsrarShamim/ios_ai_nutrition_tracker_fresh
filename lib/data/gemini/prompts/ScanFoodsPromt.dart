import 'dart:core';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

String getDisplayCountry() {
  final locale = ui.window.locale;
  final countryCode = locale.countryCode;
  return countryCode ?? "Unknown";
}

final String userIsFromThisCountry =
    "Important detail: You need to keep in mind that the user is from ${getDisplayCountry()}. so make sure your responses are generated in the Context of ${getDisplayCountry()} and they are relatable to the ${getDisplayCountry()}";

String firstAnalyzeWhatFoodIsInTheImagesInJsonFormatOnFoodImagesPrompt({
  String? foodContext,
}) {
  String prompt = """
You are an eagle-eyed food detective, specializing in identifying and quantifying food from images. Your mission is to meticulously analyze the image(s) provided and give me a precise report of what you discover.
$userIsFromThisCountry

## Image Analysis Instructions:

1. **Identify Every Food Item:** Carefully scrutinize the image(s). Identify *all* the distinct food items you see, no matter how small or partially obscured. Leave no edible morsel overlooked!
2. **Verify Your Findings:** Double- and triple-check your identifications. Make sure you are absolutely confident about each food you list. Accuracy is paramount!
3. **Estimate Quantities:**  Once you're certain about the food items, make your best estimate of the quantity of each. For example:
    * "One slice of pizza"
    * "Two cups of coffee"
    * "A handful of grapes"
4. **Detailed Report:** Provide a clear, itemized list of your findings, combining your identification and quantity assessment for each food item.

## Begin Your Investigation!
""";

  if (foodContext != null && foodContext.isNotEmpty) {
    prompt += """
here is some information or context about the food in the image by user
$foodContext
""";
  }
  return prompt.trim();
}

String returnAnalysisInJsonFormatOnFoodImagesPrompt({
  required String foodContext,
  required String userContext,
}) {
  String prompt = """
$userIsFromThisCountry

Your are given images of food. User wants nutritional information of the food in the images. Your task is to
analyze these images and return the Net/Total, Complete, and accurate nutritional information of the total food in the image as a JSON format.
First look at the pictures I sent you, and think what food is in the images? and then ask yourself how many servings are there in this food?
Now after you have identified all the food , think of the nutritional information of this food or all these foods and now continue:
""";

  if (userContext.isNotEmpty) {
    prompt += """

**here is the context from user :**
$userContext

""";
  }
  if (foodContext.isNotEmpty) {
    prompt += """

**Food Context :**
$foodContext
""";
  }

  prompt += """

**JSON Structure:**(everything is nullable and also dont return a list of the below, just one json structure like the below which contains every food)
 example:
{
"numberOfServings" : 1, //type: Double (this will always remain 1 , it represents this serving of meal/meals or food/foods)
"allergens": "", //Not important keep null 
"nutritionalValue":{
"productName": "name of this product or food you see in the image",(e,g: Apple, layz, white rice, egg)(name of this product, one important note : don't mention the name unless you are sure. don't mislead) //type: String
"servingSize": 60.0, (this variable contains the total weight or volume of the food/foods in the above statement ) //type: Double
"servingUnit": "g", //type: String (this will most likely be grams but it can be mls if the food is all liquid with ml being the servingUnit)
"calories": 205.0, //type: Double
"protein": 4.2, //type: Double
"carbohydrates": 44.5, //type: Double
"sugar": 0.8, //type: Double
"addedSugars": 0.0, //Not important keep null 
"fiber": 2.6, //type: Double
"fat": 0.5, //type: Double
"saturatedFat": 0.2, //Not important keep null 
"monounsaturatedFat": 0.1, //Not important keep null 
"polyunsaturatedFat": 0.2, //Not important keep null 
"transFat": 0.0, //Not important keep null 
"cholesterol": 5.0, //Not important keep null 
"sodium": 10.0, //type: Double//Not important keep null 
"potassium": 150.0, //type: Double
"vitaminA": 0.02, //Not important keep null 
"vitaminC": 0.01, //Not important keep null 
"calcium": 0.05, //type: Double
"iron": 0.01 //Not important keep null 
}
}

""";
  return prompt.trim();
}


String generateFoodInfoClassBasedOnText(String foodContext) {
  // Ensure that userIsFromThisCountry is defined somewhere in your Dart code.
  // For example:
  // const userIsFromThisCountry = "User is from [Country Name]";

  return '''
$userIsFromThisCountry
statement:
$foodContext


Give me the nutritional information of all the above food/foods that you can find in the above statement 
go through all of them one by one, calculate the nutritional information based on there size in the statement 
and than return the complete nutritional information of all the food/foods in the following JSON structure
**JSON Structure:**(everything is nullable but you must come up with the nutritional value and also dont return a list of the below, just one json structure like the below which contains every food)
 example:
 ```
{
"numberOfServings" : 1, //type: Double (this will always remain 1 , it represents this serving of meal/meals or food/foods)
"allergens": "",(e.g nuts, milk), //type: String  leave empty
"nutritionalValue":{
"productName": "exact description of the Food with the exact amount",(e,g: 6 eggs and 1 cup cooked rice, 2 omelette) //type: String 
"servingSize": 60.0, (this variable contains the total weight or volume of the food/foods in the above statement ) //type: Double
"servingUnit": "g", //type: String (this will most likely be grams but it can be mls if the food is all liquid with ml being the servingUnit) 
"calories": 205.0, //type: Double
"protein": 4.2, //type: Double
"carbohydrates": 44.5, //type: Double
"sugar": 0.8, //type: Double 
"addedSugars": 0.0, //type: Double 
"fiber": 2.6, //type: Double
"fat": 0.5, //type: Double
"saturatedFat": 0.2, //type: Double 
"monounsaturatedFat": 0.1, //type: Double 
"polyunsaturatedFat": 0.2, //type: Double
"transFat": 0.0, //type: Double 
"cholesterol": 5.0, //type: Double
"sodium": 10.0, //type: Double
"potassium": 150.0, //type: Double
"vitaminA": 0.02, //type: Double 
"vitaminC": 0.01, //type: Double 
"calcium": 0.05, //type: Double 
"iron": 0.01   //type: Double 
}
}

only return the json structure in your response and nothing else
''';
}

