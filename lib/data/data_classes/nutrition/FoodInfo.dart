import 'dart:convert';

class FoodInfo {
  final double numberOfServings;
  final String? allergens; // e.g., "nuts, milk"
  final String? imageUrl; // URL of the image
  final NutritionalValue? nutritionalValue;

  FoodInfo({
    required this.numberOfServings,
    this.allergens,
    this.imageUrl,
    this.nutritionalValue,
  });

  // Factory constructor to create a FoodInfo instance from JSON.
  factory FoodInfo.fromJson(Map<String, dynamic> json) {
    return FoodInfo(
      numberOfServings: (json['numberOfServings'] as num).toDouble(),
      allergens: json['allergens'] as String?,
      imageUrl: json['imageUrl'] as String?,
      nutritionalValue: json['nutritionalValue'] != null
          ? NutritionalValue.fromJson(json['nutritionalValue'] as Map<String, dynamic>)
          : null,
    );
  }
}

class NutritionalValue {
  final String? productName;
  final double? servingSize;
  final double? sizeOfPackaging;
  final String? servingUnit;
  final double? calories;
  final double? protein;
  final double? carbohydrates;
  final double? sugar;
  final double? addedSugars;
  final double? fiber;
  final double? fat;
  final double? saturatedFat;
  final double? monounsaturatedFat;
  final double? polyunsaturatedFat;
  final double? transFat;
  final double? cholesterol;
  final double? sodium;
  final double? potassium;
  final double? vitaminA;
  final double? vitaminC;
  final double? calcium;
  final double? iron;

  NutritionalValue({
    this.productName,
    this.servingSize,
    this.sizeOfPackaging,
    this.servingUnit,
    this.calories,
    this.protein,
    this.carbohydrates,
    this.sugar,
    this.addedSugars,
    this.fiber,
    this.fat,
    this.saturatedFat,
    this.monounsaturatedFat,
    this.polyunsaturatedFat,
    this.transFat,
    this.cholesterol,
    this.sodium,
    this.potassium,
    this.vitaminA,
    this.vitaminC,
    this.calcium,
    this.iron,
  });

  // Factory constructor to create a NutritionalValue instance from JSON.
  factory NutritionalValue.fromJson(Map<String, dynamic> json) {
    return NutritionalValue(
      productName: json['productName'] as String?,
      servingSize: json['servingSize'] != null ? (json['servingSize'] as num).toDouble() : null,
      sizeOfPackaging: json['sizeOfPackaging'] != null ? (json['sizeOfPackaging'] as num).toDouble() : null,
      servingUnit: json['servingUnit'] as String?,
      calories: json['calories'] != null ? (json['calories'] as num).toDouble() : null,
      protein: json['protein'] != null ? (json['protein'] as num).toDouble() : null,
      carbohydrates: json['carbohydrates'] != null ? (json['carbohydrates'] as num).toDouble() : null,
      sugar: json['sugar'] != null ? (json['sugar'] as num).toDouble() : null,
      addedSugars: json['addedSugars'] != null ? (json['addedSugars'] as num).toDouble() : null,
      fiber: json['fiber'] != null ? (json['fiber'] as num).toDouble() : null,
      fat: json['fat'] != null ? (json['fat'] as num).toDouble() : null,
      saturatedFat: json['saturatedFat'] != null ? (json['saturatedFat'] as num).toDouble() : null,
      monounsaturatedFat: json['monounsaturatedFat'] != null ? (json['monounsaturatedFat'] as num).toDouble() : null,
      polyunsaturatedFat: json['polyunsaturatedFat'] != null ? (json['polyunsaturatedFat'] as num).toDouble() : null,
      transFat: json['transFat'] != null ? (json['transFat'] as num).toDouble() : null,
      cholesterol: json['cholesterol'] != null ? (json['cholesterol'] as num).toDouble() : null,
      sodium: json['sodium'] != null ? (json['sodium'] as num).toDouble() : null,
      potassium: json['potassium'] != null ? (json['potassium'] as num).toDouble() : null,
      vitaminA: json['vitaminA'] != null ? (json['vitaminA'] as num).toDouble() : null,
      vitaminC: json['vitaminC'] != null ? (json['vitaminC'] as num).toDouble() : null,
      calcium: json['calcium'] != null ? (json['calcium'] as num).toDouble() : null,
      iron: json['iron'] != null ? (json['iron'] as num).toDouble() : null,
    );
  }
}

void main() {
  // Example JSON string. In your case, it comes from finalJsonResponseText.text.
  String jsonString = '''
  {
    "numberOfServings": 2,
    "allergens": "nuts, milk",
    "imageUrl": "http://example.com/image.jpg",
    "nutritionalValue": {
      "productName": "Example Product",
      "servingSize": 100,
      "calories": 250,
      "protein": 5,
      "carbohydrates": 30,
      "sugar": 10,
      "fat": 12
    }
  }
  ''';

  // Decode JSON string into a Map.
  final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  // Create a FoodInfo instance using the factory constructor.
  final foodInfo = FoodInfo.fromJson(jsonMap);

  print('Number of Servings: ${foodInfo.numberOfServings}');
  print('Allergens: ${foodInfo.allergens}');
  print('Image URL: ${foodInfo.imageUrl}');
  if (foodInfo.nutritionalValue != null) {
    print('Product Name: ${foodInfo.nutritionalValue!.productName}');
    print('Calories: ${foodInfo.nutritionalValue!.calories}');
  }
}
