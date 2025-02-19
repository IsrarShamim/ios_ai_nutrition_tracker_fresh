
import '../../database/entities/user_information.dart';
import 'ScanFoodsPromt.dart';

/// Represents the entire response containing a list of recipes.
class AIRecipeSearchItems {
  final List<AIRecipeSearchItem> recipes;

  AIRecipeSearchItems({
    required this.recipes,
  });

  /// Creates an instance from a JSON map.
  factory AIRecipeSearchItems.fromJson(Map<String, dynamic> json) {
    return AIRecipeSearchItems(
      recipes: (json['recipes'] as List<dynamic>)
          .map((item) => AIRecipeSearchItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes.map((recipe) => recipe.toJson()).toList(),
    };
  }
}

/// Represents an individual recipe item.
class AIRecipeSearchItem {
  final String name;
  final String nutritionalInfo;

  AIRecipeSearchItem({
    required this.name,
    required this.nutritionalInfo,
  });

  /// Creates an instance from a JSON map.
  factory AIRecipeSearchItem.fromJson(Map<String, dynamic> json) {
    return AIRecipeSearchItem(
      name: json['name'] as String,
      nutritionalInfo: json['nutritionalInfo'] as String,
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nutritionalInfo': nutritionalInfo,
    };
  }
}

/// Generates a detailed prompt for the AI chef using the user's information.
/// The AI chef is expected to analyze the provided ingredients (via image, text, or both)
/// and generate innovative, delicious recipes. The generated recipes should include the name
/// and very short nutritional info. The AI must always respond in JSON format using the structure below.
///
/// Additional text (from a textfield) and a list of recipe types can be provided to give extra
/// instructions and preferences.
///
/// Example JSON structure:
/// {
///   "recipes": [
///     {
///       "name": "Recipe Name",
///       "nutritionalInfo": "Per serving: Calories: X Kcal | Protein: Y"
///     },
///     // ... up to 10 recipes
///   ]
/// }
String generateChefPrompt(
    UserInformationEntity user, {
      String? additionalText,
      List<String>? recipeTypes,
      required bool  useOnlyMyIngredients
    }) {
  // Assuming `user.goal` is a list of strings describing the user's culinary goals/preferences.
  String goals = user.goal.join(', ');

  // If the user entered any extra instructions, include them.
  String extraInstructions = (additionalText != null && additionalText.trim().isNotEmpty)
      ? "\nAdditional instructions: $additionalText"
      : "";

  // If there is a list of recipe types, join them into a string.
  String requestedTypes = (recipeTypes != null && recipeTypes.isNotEmpty)
      ? "\nRequested Recipe Types: ${recipeTypes.join(', ')}"
      : "";

  // If generating a recipe using only the user's available ingredients
  String ifOnlyIncludeUserIngredient = (useOnlyMyIngredients)
      ? "\nGenerate recipes that can be made exclusively with the ingredients available to the user. Only include essential items such as basic salt and common kitchen staples; do not add any extra ingredients like cheese or other items that may not be on hand."
      : "Alternatively, feel free to include a few additional ingredients that are easy to obtain, while still keeping the recipe simple and accessible.";

  return '''
You are an AI-powered chef with extensive culinary expertise and creativity. Your mission is to generate innovative, delicious recipes based on the ingredients provided by the user, which may be in the form of images, text descriptions, or both. You possess a deep understanding of global cuisines, flavor pairings, and nutritional balance.

Below is the user’s information:
- **Name:** ${user.name}
- **Age:** ${user.age}
- **Weight:** ${user.weight} ${user.weightUnit}
- **Height:** ${user.height} ${user.heightUnit}
- **Gender:** ${user.gender}
- **Location country code:** ${userIsFromThisCountry}
- **Current Diet:** ${user.diet}
- **Culinary Goals/Preferences:** $goals
$extraInstructions
$requestedTypes
$ifOnlyIncludeUserIngredient

Keep the above information in mind. When provided with a set of ingredients, analyze them carefully and generate creative, step-by-step recipes. Include the recipe name and very short nutritional info.

**Important:** Always respond in JSON format using the following structure:
{
  "recipes": [
    {
      "name": "Recipe Name",
      "nutritionalInfo": "Per serving: Calories: X Kcal | Protein: Y"
    },
    // ... up to 10 recipes
  ]
}

Be imaginative, confident, and precise in your culinary guidance.
''';
}

/// Generates a detailed prompt for the AI chef when no user information is available.
/// In this case, the chef should generate recipes based solely on the provided ingredients
/// (which may come as images, text, or both) and any extra instructions and recipe types provided.
/// Always respond in JSON format using the structure below.
String generateChefPromptWhenUserInfoIsNotAvailable({
  String? additionalText,
  List<String>? recipeTypes,
  required bool  useOnlyMyIngredients
}) {
  String extraInstructions = (additionalText != null && additionalText.trim().isNotEmpty)
      ? "\nAdditional instructions: $additionalText"
      : "";

  String requestedTypes = (recipeTypes != null && recipeTypes.isNotEmpty)
      ? "\nRequested Recipe Types: ${recipeTypes.join(', ')}"
      : "";

  // If generating a recipe using only the user's available ingredients
  String ifOnlyIncludeUserIngredient = (useOnlyMyIngredients)
      ? "\nGenerate recipes that can be made exclusively with the ingredients available to the user. Only include essential items such as basic salt and common kitchen staples; do not add any extra ingredients like cheese or other items that may not be on hand."
      : "Alternatively, feel free to include a few additional ingredients that are easy to obtain, while still keeping the recipe simple and accessible.";


  return '''
You are an AI-powered chef with extensive culinary expertise and creativity. Your mission is to generate innovative and delicious recipes based solely on the ingredients provided by the user, which may be in the form of images, text descriptions, or both. Please generate creative, step-by-step recipes that include the recipe name and very short nutritional info.
$extraInstructions
$requestedTypes
$ifOnlyIncludeUserIngredient

**Important:** Always respond in JSON format using the following structure:
{
  "recipes": [
    {
      "name": "Recipe Name",
      "nutritionalInfo": "Per serving: Calories: X Kcal | Protein: Y"
    },
    // ... up to 10 recipes
  ]
}

Be imaginative, confident, and precise in your culinary advice.
''';
}


//******************************************************************* Recipe  DETAILS  this below code will be used for the details screen .

/// Generates a detailed recipe prompt for the AI chef using the user's information
/// and a previously generated recipe summary (AIRecipeSearchItem).
/// The AI must expand the summary into a creative, detailed recipe and respond in JSON format.
///
/// **Important:** Always respond in JSON format using the following structure:
///
/// {
///   "recipe": {
///     "name": "Recipe Name",
///     "ingredients": [
///       { "item": "Ingredient Name", "quantity": "Quantity" },
///       // ... more ingredients
///     ],
///     "instructions": "Detailed step-by-step cooking instructions",
///     "cookingTime": "Estimated cooking time (e.g., 45 minutes)",
///     "nutritionalInfo": {
///         "calories": X,
///         "protein": Y,
///         "carbohydrates": Z,
///         "fat": W,
///         "fiber": A,
///         "sodium": B,
///         "sugar": C,
///         "calcium": D,
///         "magnesium": E,
///         "potassium": F
///     },
///     "servings": Number of servings,
///     "tips": "Additional tips for plating or serving"
///   }
/// }
String generateDetailedRecipePromptFromSearchItem(
    UserInformationEntity user, AIRecipeSearchItem searchItem) {
  // Assuming `user.goal` is a list of strings describing the user's culinary goals/preferences.
  String goals = user.goal.join(', ');

  return '''
You are an AI-powered chef with extensive culinary expertise and creativity. Your mission is to generate an innovative, detailed recipe based on the previously generated recipe summary provided below as well as the user's information. Use the summary as a starting point to create a creative and comprehensive recipe.

**Previously generated recipe summary:**
- **Name:** ${searchItem.name}
- **Nutritional Info:** ${searchItem.nutritionalInfo}

**User Information:**
- **Name:** ${user.name}
- **Age:** ${user.age}
- **Weight:** ${user.weight} ${user.weightUnit}
- **Height:** ${user.height} ${user.heightUnit}
- **Gender:** ${user.gender}
- **Location country code:** ${userIsFromThisCountry}
- **Current Diet:** ${user.diet}
- **Culinary Goals/Preferences:** $goals

Now, generate a detailed recipe that includes:
- A complete list of ingredients (with quantities),
- Detailed step-by-step cooking instructions,
- Estimated cooking time (e.g., "45 minutes"),
- Nutritional information per serving as a nested object (with keys for calories, protein, carbohydrates, fat, fiber, sodium, sugar, calcium, magnesium, and potassium),
- Number of servings,
- Additional tips for plating or serving.

**Important:** Always respond in JSON format using the following structure:

{
  "recipe": {
    "name": "Recipe Name",
    "ingredients": [
      { "item": "Ingredient Name", "quantity": "Quantity" },
      // ... more ingredients
    ],
    "instructions": "Detailed step-by-step cooking instructions",
    "cookingTime": "Estimated cooking time (e.g., 45 minutes)",
    "nutritionalInfo": {
         "calories": X,
         "protein": Y,
         "carbohydrates": Z,
         "fat": W,
         "fiber": A,
         "sodium": B,
         "sugar": C,
         "calcium": D,
         "magnesium": E,
         "potassium": F
    },
    "servings": Number of servings,
    "tips": "Additional tips for plating or serving"
  }
}

Generate a creative and detailed recipe accordingly.
''';
}

/// Generates a detailed recipe prompt for the AI chef when no user information is available.
/// It accepts a previously generated recipe summary (AIRecipeSearchItem) and instructs the AI
/// to expand that summary into a detailed recipe. The nutritional information must be returned as a nested object.
///
/// **Important:** Always respond in JSON format using the following structure:
///
/// {
///   "recipe": {
///     "name": "Recipe Name",
///     "ingredients": [
///       { "item": "Ingredient Name", "quantity": "Quantity" },
///       // ... more ingredients
///     ],
///     "instructions": "Detailed step-by-step cooking instructions",
///     "cookingTime": "Estimated cooking time (e.g., 45 minutes)",
///     "nutritionalInfo": {
///         "calories": X,
///         "protein": Y,
///         "carbohydrates": Z,
///         "fat": W,
///         "fiber": A,
///         "sodium": B,
///         "sugar": C,
///         "calcium": D,
///         "magnesium": E,
///         "potassium": F
///     },
///     "servings": Number of servings,
///     "tips": "Additional tips for plating or serving"
///   }
/// }
String generateDetailedRecipePromptFromSearchItemWhenUserInfoIsNotAvailable(
    AIRecipeSearchItem searchItem) {
  return '''
You are an AI-powered chef with extensive culinary expertise and creativity. Your mission is to generate an innovative, detailed recipe based solely on the previously generated recipe summary provided below. Use the summary as a starting point to create a creative and comprehensive recipe.

**Previously generated recipe summary:**
- **Name:** ${searchItem.name}
- **Nutritional Info:** ${searchItem.nutritionalInfo}

Now, generate a detailed recipe that includes:
- A complete list of ingredients (with quantities),
- Detailed step-by-step cooking instructions,
- Estimated cooking time (e.g., "45 minutes"),
- Nutritional information per serving as a nested object (with keys for calories, protein, carbohydrates, fat, fiber, sodium, sugar, calcium, magnesium, and potassium),
- Number of servings,
- Additional tips for plating or serving.

**Important:** Always respond in JSON format using the following structure:

{
  "recipe": {
    "name": "Recipe Name",
    "ingredients": [
      { "item": "Ingredient Name", "quantity": "Quantity" },
      // ... more ingredients
    ],
    "instructions": "Detailed step-by-step cooking instructions",
    "cookingTime": "Estimated cooking time (e.g., 45 minutes)",
    "nutritionalInfo": {
         "calories": X,
         "protein": Y,
         "carbohydrates": Z,
         "fat": W,
         "fiber": A,
         "sodium": B,
         "sugar": C,
         "calcium": D,
         "magnesium": E,
         "potassium": F
    },
    "servings": Number of servings,
    "tips": "Additional tips for plating or serving"
  }
}

Generate a creative and detailed recipe accordingly.
''';
}


/// Represents the top-level response for a detailed recipe.
class AIRecipeDetail {
  final Recipe recipe;

  AIRecipeDetail({required this.recipe});

  /// Creates an instance from a JSON map.
  factory AIRecipeDetail.fromJson(Map<String, dynamic> json) {
    return AIRecipeDetail(
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'recipe': recipe.toJson(),
    };
  }
}

/// Represents a detailed recipe.
class Recipe {
  final String name;
  final List<Ingredient> ingredients;
  final String instructions;
  final String cookingTime;
  final NutritionalInfo nutritionalInfo;
  final int servings;
  final String tips;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.cookingTime,
    required this.nutritionalInfo,
    required this.servings,
    required this.tips,
  });

  /// Creates an instance from a JSON map.
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((item) => Ingredient.fromJson(item as Map<String, dynamic>))
          .toList(),
      instructions: json['instructions'] as String,
      cookingTime: json['cookingTime'] as String,
      nutritionalInfo: NutritionalInfo.fromJson(
          json['nutritionalInfo'] as Map<String, dynamic>),
      servings: json['servings'] as int,
      tips: json['tips'] as String,
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
      'instructions': instructions,
      'cookingTime': cookingTime,
      'nutritionalInfo': nutritionalInfo.toJson(),
      'servings': servings,
      'tips': tips,
    };
  }
}

/// Represents an ingredient with its name and quantity.
class Ingredient {
  final String item;
  final String quantity;

  Ingredient({
    required this.item,
    required this.quantity,
  });

  /// Creates an instance from a JSON map.
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      item: json['item'] as String,
      quantity: json['quantity'] as String,
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'quantity': quantity,
    };
  }
}

/// Represents detailed nutritional information.
class NutritionalInfo {
  final int calories;
  final int protein;
  final int carbohydrates;
  final int fat;
  final int fiber;
  final int sodium;
  final int sugar;
  final int calcium;
  final int magnesium;
  final int potassium;

  NutritionalInfo({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    required this.sodium,
    required this.sugar,
    required this.calcium,
    required this.magnesium,
    required this.potassium,
  });

  /// Creates an instance from a JSON map.
  factory NutritionalInfo.fromJson(Map<String, dynamic> json) {
    return NutritionalInfo(
      calories: json['calories'] as int,
      protein: json['protein'] as int,
      carbohydrates: json['carbohydrates'] as int,
      fat: json['fat'] as int,
      fiber: json['fiber'] as int,
      sodium: json['sodium'] as int,
      sugar: json['sugar'] as int,
      calcium: json['calcium'] as int,
      magnesium: json['magnesium'] as int,
      potassium: json['potassium'] as int,
    );
  }

  /// Converts the instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'fiber': fiber,
      'sodium': sodium,
      'sugar': sugar,
      'calcium': calcium,
      'magnesium': magnesium,
      'potassium': potassium,
    };
  }
}
