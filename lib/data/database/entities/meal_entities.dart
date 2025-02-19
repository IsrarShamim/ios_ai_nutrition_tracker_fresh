import 'dart:convert';

import 'package:ai_nutrition_tracker_for_ios/data/util/GetDate.dart';
import 'package:isar/isar.dart';

import '../../data_classes/nutrition/BarcodeSearch.dart';
import '../../data_classes/nutrition/FoodInfo.dart';
import '../../https/SearchFood.dart';
import '../../util/GetTime.dart';

part 'meal_entities.g.dart';


@collection
class Meal {
  Id id = Isar.autoIncrement;

  String? mealId; // Storing the original ID

  @Index() // Make the date unique
  String? date;

  String? timeThisMealWasLogged;
  int? timeOfThisMeal;
  String? mealDescription;
  String? exactMealAmount;
  int mealCalories = 0;
  int mealWater = 0;
  int mealCarbohydrates = 0;
  int mealProtein = 0;
  int mealFat = 0;
  int mealFiber = 0;
  int mealSodium = 0;
  int mealSugar = 0;
  int mealCalcium = 0;
  int mealMagnesium = 0;
  int mealPotassium = 0;
  String? imageUrl;
  String? positives;
  String? negatives;
  String? nutritionalBrief;
  String? vitaminsAndMineralsBrief;
  String? namesOfAlternateFoods;
  String? reasonOfAlternateFoods;
  String? namesOfPairFoods;
  String? reasonsOfPairFoods;


  /// Manually implemented copyWith method
  Meal copyWith({
    Id? id,
    String? mealId,
    String? date,
    String? timeThisMealWasLogged,
    int? timeOfThisMeal,
    String? mealDescription,
    String? exactMealAmount,
    int? mealCalories,
    int? mealWater,
    int? mealCarbohydrates,
    int? mealProtein,
    int? mealFat,
    int? mealFiber,
    int? mealSodium,
    int? mealSugar,
    int? mealCalcium,
    int? mealMagnesium,
    int? mealPotassium,
    String? imageUrl,
    String? positives,
    String? negatives,
    String? nutritionalBrief,
    String? vitaminsAndMineralsBrief,
    String? namesOfAlternateFoods,
    String? reasonOfAlternateFoods,
    String? namesOfPairFoods,
    String? reasonsOfPairFoods,
  }) {
    return Meal()
      // ..id = id ?? this.id
      ..mealId = mealId ?? this.mealId
      ..date = date ?? this.date
      ..timeThisMealWasLogged = timeThisMealWasLogged ?? this.timeThisMealWasLogged
      ..timeOfThisMeal = timeOfThisMeal ?? this.timeOfThisMeal
      ..mealDescription = mealDescription ?? this.mealDescription
      ..exactMealAmount = exactMealAmount ?? this.exactMealAmount
      ..mealCalories = mealCalories ?? this.mealCalories
      ..mealWater = mealWater ?? this.mealWater
      ..mealCarbohydrates = mealCarbohydrates ?? this.mealCarbohydrates
      ..mealProtein = mealProtein ?? this.mealProtein
      ..mealFat = mealFat ?? this.mealFat
      ..mealFiber = mealFiber ?? this.mealFiber
      ..mealSodium = mealSodium ?? this.mealSodium
      ..mealSugar = mealSugar ?? this.mealSugar
      ..mealCalcium = mealCalcium ?? this.mealCalcium
      ..mealMagnesium = mealMagnesium ?? this.mealMagnesium
      ..mealPotassium = mealPotassium ?? this.mealPotassium
      ..imageUrl = imageUrl ?? this.imageUrl
      ..positives = positives ?? this.positives
      ..negatives = negatives ?? this.negatives
      ..nutritionalBrief = nutritionalBrief ?? this.nutritionalBrief
      ..vitaminsAndMineralsBrief = vitaminsAndMineralsBrief ?? this.vitaminsAndMineralsBrief
      ..namesOfAlternateFoods = namesOfAlternateFoods ?? this.namesOfAlternateFoods
      ..reasonOfAlternateFoods = reasonOfAlternateFoods ?? this.reasonOfAlternateFoods
      ..namesOfPairFoods = namesOfPairFoods ?? this.namesOfPairFoods
      ..reasonsOfPairFoods = reasonsOfPairFoods ?? this.reasonsOfPairFoods;
  }

  FoodData toFoodData() {
    final serving = Serving(
      servingId: null,
      servingDescription: exactMealAmount,
      servingUrl: null,
      metricServingAmount: null,
      metricServingUnit: null,
      numberOfUnits: null,
      measurementDescription: null,
      calories: mealCalories.toDouble(),
      carbohydrate: mealCarbohydrates.toDouble(),
      protein: mealProtein.toDouble(),
      fat: mealFat.toDouble(),
      saturatedFat: null,
      polyunsaturatedFat: null,
      monounsaturatedFat: null,
      cholesterol: null,
      sodium: mealSodium.toDouble(),
      potassium: mealPotassium.toDouble(),
      fiber: mealFiber.toDouble(),
      sugar: mealSugar.toDouble(),
      vitaminA: null,
      vitaminC: null,
      vitaminD: null,
      transFat: null,
      calcium: mealCalcium.toDouble(),
      iron: null,
    );

    final foodFromFatSecret = FoodFromFatSecret(
      foodId: mealId,
      foodName: mealDescription,
      foodType: null,
      foodSubCategories: null,
      foodUrl: null,
      foodImages: FoodImages([FoodImage(imageUrl: imageUrl, imageType: null)]),
      foodAttributes: null,
      servings: Servings([serving]),
    );

    return FoodData(food: foodFromFatSecret);
  }
  @override
  String toString() {
    return '''
Meal(
  id: $id
  mealId: $mealId,
  date: $date,
  timeThisMealWasLogged: $timeThisMealWasLogged,
  timeOfThisMeal: $timeOfThisMeal,
  mealDescription: $mealDescription,
  exactMealAmount: $exactMealAmount,
  mealCalories: $mealCalories,
  mealWater: $mealWater,
  mealCarbohydrates: $mealCarbohydrates,
  mealProtein: $mealProtein,
  mealFat: $mealFat,
  mealFiber: $mealFiber,
  mealSodium: $mealSodium,
  mealSugar: $mealSugar,
  mealCalcium: $mealCalcium,
  mealMagnesium: $mealMagnesium,
  mealPotassium: $mealPotassium,
  imageUrl: $imageUrl,
  positives: $positives,
  negatives: $negatives,
  nutritionalBrief: $nutritionalBrief,
  vitaminsAndMineralsBrief: $vitaminsAndMineralsBrief,
  namesOfAlternateFoods: $namesOfAlternateFoods,
  reasonOfAlternateFoods: $reasonOfAlternateFoods,
  namesOfPairFoods: $namesOfPairFoods,
  reasonsOfPairFoods: $reasonsOfPairFoods,
)
''';
  }
}


Meal multiplyMeal(Meal meal, double multiplier) {
  return meal.copyWith(
    timeThisMealWasLogged: getCurrentFormattedTime(),
    date: getCurrentDate(),
    mealCalories: (meal.mealCalories * multiplier).round(),
    mealWater: (meal.mealWater * multiplier).round(),
    mealCarbohydrates: (meal.mealCarbohydrates * multiplier).round(),
    mealProtein: (meal.mealProtein * multiplier).round(),
    mealFat: (meal.mealFat * multiplier).round(),
    mealFiber: (meal.mealFiber * multiplier).round(),
    mealSodium: (meal.mealSodium * multiplier).round(),
    mealSugar: (meal.mealSugar * multiplier).round(),
    mealCalcium: (meal.mealCalcium * multiplier).round(),
    mealMagnesium: (meal.mealMagnesium * multiplier).round(),
    mealPotassium: (meal.mealPotassium * multiplier).round(),
  );
}

Meal convertFoodInfoToMeal(FoodInfo foodInfo) {
  final nutritional = foodInfo.nutritionalValue;
  final servings = foodInfo.numberOfServings;

  // Multiply nutritional values by the number of servings.
  final calories = ((nutritional?.calories ?? 0) * servings).round();
  final protein = ((nutritional?.protein ?? 0) * servings).round();
  final carbohydrates = ((nutritional?.carbohydrates ?? 0) * servings).round();
  final sugar = ((nutritional?.sugar ?? 0) * servings).round();
  final fiber = ((nutritional?.fiber ?? 0) * servings).round();
  final fat = ((nutritional?.fat ?? 0) * servings).round();
  final sodium = ((nutritional?.sodium ?? 0) * servings).round();
  final calcium = ((nutritional?.calcium ?? 0) * servings).round();
  final potassium = ((nutritional?.potassium ?? 0) * servings).round();

  final meal = Meal();
  meal.mealDescription = nutritional?.productName;
  meal.exactMealAmount = servings.toString();
  meal.mealCalories = calories;
  meal.mealProtein = protein;
  meal.mealCarbohydrates = carbohydrates;
  meal.mealSugar = sugar;
  meal.mealFiber = fiber;
  meal.mealFat = fat;
  meal.mealSodium = sodium;
  meal.mealCalcium = calcium;
  meal.mealPotassium = potassium;
  meal.imageUrl = foodInfo.imageUrl;

  // Optionally, set negatives to allergens if provided.
  if (foodInfo.allergens != null && foodInfo.allergens!.isNotEmpty) {
    meal.negatives = "Allergens: ${foodInfo.allergens}";
  }

  return meal;
}


/// Converts a [FoodItem] into a [Meal] instance.
Meal convertFoodItemToMeal(FoodItem food) {
  final meal = Meal();

  // Use the food's id as the meal's unique identifier.
  meal.mealId = food.food_id;

  // Use the food's name as the meal description.
  meal.mealDescription = food.food_name;

  // Optionally, store the food_url as the imageUrl.
  meal.imageUrl = food.food_url;

  // You might use the food description as additional information.
  // (If needed, assign to another Meal field or concatenate with mealDescription)

  // Set the current date for the meal.
  meal.date = getCurrentDate();

  // Optionally, you could set the time this meal was logged.
  meal.timeThisMealWasLogged = getCurrentFormattedTime();
  meal.timeOfThisMeal = getCurrentTime();

  // Nutritional values (calories, carbohydrates, protein, etc.) are not provided
  // in FoodItem, so they remain at their default values (0).
  // If you later fetch detailed nutritional info, update these fields accordingly.

  return meal;
}

/// Converts an OpenFoodFactsProduct into a Meal instance.
Meal convertOpenFoodFactsToMeal(OpenFoodFactsProduct offProduct) {
  final meal = Meal();

  // Use the product code as the mealId and product name as the description.
  meal.mealId = offProduct.code;
  meal.mealDescription = offProduct.product?.productName;
  meal.imageUrl = offProduct.product?.imageUrl;

  // Use the current date in ISO 8601 format if no date is provided.
  meal.date = getCurrentDate();

  meal.timeThisMealWasLogged = getCurrentFormattedTime();
  meal.timeOfThisMeal = getCurrentTime();
  // Map nutritional information from the Nutriments section.
  final nutriments = offProduct.product?.nutriments;
  if (nutriments != null) {
    // Energy (kcal) value is used for calories.
    meal.mealCalories = (nutriments.energyKcalValue ?? 0).toInt();

    // Carbohydrates, proteins, fats, sugars, and salt.
    meal.mealCarbohydrates = (nutriments.carbohydratesValue ?? 0).toInt();
    meal.mealProtein = (nutriments.proteinsValue ?? 0).toInt();
    meal.mealFat = (nutriments.fatValue ?? 0).toInt();
    meal.mealSugar = (nutriments.sugarsValue ?? 0).toInt();

    // We use saltValue for sodium.
    meal.mealSodium = (nutriments.saltValue ?? 0).toInt();
  }

  // If available, you might have fiber data in the NutriScoreData section.
  final nutriScore = offProduct.product?.nutriscoreData;
  if (nutriScore != null) {
    meal.mealFiber = (nutriScore.fiberValue ?? 0).toInt();
  }

  // Optionally, you can also try to set other fields (if you have them) such as
  // positives/negatives or extra descriptive texts from other parts of the product.
  // For example:
  //
  // meal.nutritionalBrief = offProduct.product?.nutriments != null
  //     ? "Calories: ${meal.mealCalories}, Carbs: ${meal.mealCarbohydrates}g, Protein: ${meal.mealProtein}g, Fat: ${meal.mealFat}g"
  //     : null;
  //
  // You can add more mapping as required.

  return meal;
}


/// Converts a [FoodData] instance (from FatSecret) into a [Meal] instance.
Meal convertFoodDataToMeal(FoodData foodData) {
  final meal = Meal();

  // Use the foodId as the meal ID.
  meal.mealId = foodData.food?.foodId;

  // Use the foodName as the meal description.
  meal.mealDescription = foodData.food?.foodName;

  // Set the current date and time for the meal.
  meal.date = getCurrentDate();
  meal.timeThisMealWasLogged = getCurrentFormattedTime();
  meal.timeOfThisMeal = getCurrentTime();

  // If servings are available, use the first serving's nutritional values.
  if (foodData.food?.servings != null &&
      foodData.food!.servings!.serving.isNotEmpty) {
    final serving = foodData.food!.servings!.serving.first;
    meal.exactMealAmount = serving.servingDescription;
    meal.mealCalories = serving.calories.toInt();
    meal.mealCarbohydrates = serving.carbohydrate.toInt();
    meal.mealProtein = serving.protein.toInt();
    meal.mealFat = serving.fat.toInt();
    meal.mealSodium = serving.sodium.toInt();
    meal.mealSugar = serving.sugar.toInt();
    meal.mealPotassium = serving.potassium.toInt();
    // You can map additional fields (fiber, etc.) as needed.
  }

  return meal;
}






// Data classes (no @collection needed)
class FoodReportClass {
  String? imageUrl;
  String? positives;
  String? negatives;
  String? nutritionalBrief;
  String? vitaminsAndMineralsBrief;
  String? namesOfAlternateFoods;
  String? reasonOfAlternateFoods;
  String? namesOfPairFoods;
  String? reasonsOfAlternateFoods;
}

@collection
class IndividualWaterLog {
  Id id = Isar.autoIncrement;
  String? logId; // Store original ID if needed
  String? date;
  String? timeThisMealWasLogged; // Or rename to timeThisWaterWasLogged for clarity
  int waterAmount = 0;
}




// The rest of the data classes (FoodData, FoodFromFatSecret, etc.)
// should also be converted to Dart classes. The structure will be very similar
// to what you have in Kotlin, just using Dart syntax and making fields nullable where appropriate.


// These are your data classes with factory constructors.

class FoodData {
  FoodFromFatSecret? food;

  FoodData({this.food});

  factory FoodData.fromJson(Map<String, dynamic> json) {
    // In your JSON the food details are at the top level.
    // Wrap them into a FoodFromFatSecret instance.
    return FoodData(
      food: FoodFromFatSecret.fromJson(json),
    );
  }
}

class FoodFromFatSecret {
  String? foodId;
  String? foodName;
  String? foodType;
  List<String>? foodSubCategories; // Not provided in the sample JSON.
  String? foodUrl;
  FoodImages? foodImages; // Not provided in the sample JSON.
  dynamic foodAttributes; // Not provided.
  Servings? servings;

  FoodFromFatSecret({
    this.foodId,
    this.foodName,
    this.foodType,
    this.foodSubCategories,
    this.foodUrl,
    this.foodImages,
    this.foodAttributes,
    this.servings,
  });

  factory FoodFromFatSecret.fromJson(Map<String, dynamic> json) {
    return FoodFromFatSecret(
      foodId: json['food_id']?.toString(),
      foodName: json['food_name'],
      foodType: json['food_type'],
      foodUrl: json['food_url'],
      // The API sample does not include foodSubCategories, foodImages, or foodAttributes.
      servings: json['servings'] != null
          ? Servings.fromJson(json['servings'] as Map<String, dynamic>)
          : null,
    );
  }
}

class FoodImages {
  List<FoodImage>? foodImages;
  FoodImages(this.foodImages);

  factory FoodImages.fromJson(Map<String, dynamic> json) {
    // Not used in our example.
    return FoodImages(null);
  }
}

class FoodImage {
  String? imageUrl;
  String? imageType; // Consider an enum if needed

  FoodImage({this.imageUrl, this.imageType});

  factory FoodImage.fromJson(Map<String, dynamic> json) {
    return FoodImage(
      imageUrl: json['image_url'],
      imageType: json['image_type'],
    );
  }
}

class Servings {
  List<Serving> serving;
  Servings(this.serving);

  factory Servings.fromJson(Map<String, dynamic> json) {
    final dynamic servingData = json['serving'];
    List<dynamic> servingList;
    if (servingData is List) {
      servingList = servingData;
    } else if (servingData is Map) {
      servingList = [servingData];
    } else {
      servingList = [];
    }
    return Servings(
      servingList.map((s) => Serving.fromJson(s as Map<String, dynamic>)).toList(),
    );
  }
}

class Serving {
  String? servingId;
  String? servingDescription;
  String? servingUrl;
  double? metricServingAmount;
  String? metricServingUnit;
  double? numberOfUnits;
  String? measurementDescription;
  double calories;
  double carbohydrate;
  double protein;
  double fat;
  double? saturatedFat;
  double? polyunsaturatedFat;
  double? monounsaturatedFat;
  double? cholesterol;
  double sodium;
  double potassium;
  double fiber;
  double sugar;
  double? vitaminA;
  double? vitaminC;
  double? vitaminD;
  double? transFat;
  double calcium;
  double? iron;

  Serving({
    this.servingId,
    this.servingDescription,
    this.servingUrl,
    this.metricServingAmount,
    this.metricServingUnit,
    this.numberOfUnits,
    this.measurementDescription,
    required this.calories,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
    this.saturatedFat,
    this.polyunsaturatedFat,
    this.monounsaturatedFat,
    this.cholesterol,
    required this.sodium,
    required this.potassium,
    required this.fiber,
    required this.sugar,
    this.vitaminA,
    this.vitaminC,
    this.vitaminD,
    this.transFat,
    required this.calcium,
    this.iron,
  });

  factory Serving.fromJson(Map<String, dynamic> json) {
    return Serving(
      servingId: json['serving_id']?.toString(),
      servingDescription: json['serving_description'] as String?,
      servingUrl: json['serving_url'] as String?,
      metricServingAmount: json['metric_serving_amount'] != null
          ? double.tryParse(json['metric_serving_amount'].toString())
          : null,
      metricServingUnit: json['metric_serving_unit'] as String?,
      numberOfUnits: json['number_of_units'] != null
          ? double.tryParse(json['number_of_units'].toString())
          : null,
      measurementDescription: json['measurement_description'] as String?,
      calories: double.tryParse(json['calories']?.toString() ?? '0') ?? 0,
      carbohydrate: double.tryParse(json['carbohydrate']?.toString() ?? '0') ?? 0,
      protein: double.tryParse(json['protein']?.toString() ?? '0') ?? 0,
      fat: double.tryParse(json['fat']?.toString() ?? '0') ?? 0,
      saturatedFat: json['saturated_fat'] != null
          ? double.tryParse(json['saturated_fat'].toString())
          : null,
      polyunsaturatedFat: json['polyunsaturated_fat'] != null
          ? double.tryParse(json['polyunsaturated_fat'].toString())
          : null,
      monounsaturatedFat: json['monounsaturated_fat'] != null
          ? double.tryParse(json['monounsaturated_fat'].toString())
          : null,
      cholesterol: json['cholesterol'] != null
          ? double.tryParse(json['cholesterol'].toString())
          : null,
      sodium: double.tryParse(json['sodium']?.toString() ?? '0') ?? 0,
      potassium: double.tryParse(json['potassium']?.toString() ?? '0') ?? 0,
      fiber: double.tryParse(json['fiber']?.toString() ?? '0') ?? 0,
      sugar: double.tryParse(json['sugar']?.toString() ?? '0') ?? 0,
      vitaminA: json['vitamin_a'] != null
          ? double.tryParse(json['vitamin_a'].toString())
          : null,
      vitaminC: json['vitamin_c'] != null
          ? double.tryParse(json['vitamin_c'].toString())
          : null,
      vitaminD: json['vitamin_d'] != null
          ? double.tryParse(json['vitamin_d'].toString())
          : null,
      transFat: json['trans_fat'] != null
          ? double.tryParse(json['trans_fat'].toString())
          : null,
      calcium: double.tryParse(json['calcium']?.toString() ?? '0') ?? 0,
      iron: json['iron'] != null ? double.tryParse(json['iron'].toString()) : null,
    );
  }
}
