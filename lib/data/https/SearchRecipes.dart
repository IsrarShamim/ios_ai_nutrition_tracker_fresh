import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'SearchFood.dart';
part 'SearchRecipes.g.dart';

// Data Classes for Recipes

@JsonSerializable()
class RecipeSearchResult {
  @JsonKey(name: 'recipes')
  final Recipes? recipes;

  RecipeSearchResult({this.recipes});

  factory RecipeSearchResult.fromJson(Map<String, dynamic> json) =>
      _$RecipeSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeSearchResultToJson(this);
}

@JsonSerializable()
class Recipes {
  @JsonKey(name: 'max_results')
  final int maxResults;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'page_number')
  final int pageNumber;
  @JsonKey(name: 'recipe')
  final List<RecipeItem>? recipe;

  Recipes({
    required this.maxResults,
    required this.totalResults,
    required this.pageNumber,
    this.recipe,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) => _$RecipesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesToJson(this);
}

@JsonSerializable()
class RecipeItem {
  @JsonKey(name: 'recipe_id')
  final int recipeId; // Changed to int to match Long in Kotlin and typical JSON
  @JsonKey(name: 'recipe_name')
  final String recipeName;
  @JsonKey(name: 'recipe_description')
  final String? recipeDescription;
  @JsonKey(name: 'recipe_image')
  final String? recipeImage;
  @JsonKey(name: 'recipe_nutrition')
  final RecipeNutrition? recipeNutrition;

  RecipeItem({
    required this.recipeId,
    required this.recipeName,
    this.recipeDescription,
    this.recipeImage,
    this.recipeNutrition,
  });

  factory RecipeItem.fromJson(Map<String, dynamic> json) =>
      _$RecipeItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeItemToJson(this);
}

@JsonSerializable()
class RecipeNutrition {
  @JsonKey(name: 'calories')
  final double calories;
  @JsonKey(name: 'carbohydrate')
  final double carbohydrate;
  @JsonKey(name: 'protein')
  final double protein;
  @JsonKey(name: 'fat')
  final double fat;

  RecipeNutrition({
    required this.calories,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
  });

  factory RecipeNutrition.fromJson(Map<String, dynamic> json) =>
      _$RecipeNutritionFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeNutritionToJson(this);
}

@JsonSerializable()
class RecipeTypesResult {
  @JsonKey(name: 'recipe_types')
  final RecipeTypes recipeTypes;

  RecipeTypesResult({required this.recipeTypes});

  factory RecipeTypesResult.fromJson(Map<String, dynamic> json) =>
      _$RecipeTypesResultFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeTypesResultToJson(this);
}

@JsonSerializable()
class RecipeTypes {
  @JsonKey(name: 'recipe_type')
  final List<String>? recipe_type;

  RecipeTypes({this.recipe_type});

  factory RecipeTypes.fromJson(Map<String, dynamic> json) =>
      _$RecipeTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeTypesToJson(this);
}

// Function to search Recipes (Dart)
Future<List<RecipeItem>> searchRecipes(
    String query,
    String consumerKey,
    String consumerSecret, {
      List<String>? recipeTypes,
      bool? recipeTypesMatchAll,
      bool? mustHaveImages,
      int? caloriesFrom,
      int? caloriesTo,
      int? carbPercentageFrom,
      int? carbPercentageTo,
      int? proteinPercentageFrom,
      int? proteinPercentageTo,
      int? fatPercentageFrom,
      int? fatPercentageTo,
      int? prepTimeFrom,
      int? prepTimeTo,
      int? pageNumber,
      int? maxResults,
      String? sortBy,
    }) async {
  final url = "https://platform.fatsecret.com/rest/server.api";
  final params = <String, String>{
    "method": "recipes.search.v3",
    "search_expression": query,
    "format": "json",
    "oauth_consumer_key": consumerKey,
    "oauth_signature_method": "HMAC-SHA1",
    "oauth_timestamp": (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
    "oauth_nonce": generateNonce(),
    "oauth_version": "1.0",
  };

  // Add optional parameters
  if (recipeTypes != null) {
    params["recipe_types"] = recipeTypes.join(",");
  }
  if (recipeTypesMatchAll != null) {
    params["recipe_types_matchall"] = recipeTypesMatchAll.toString();
  }
  if (mustHaveImages != null) {
    params["must_have_images"] = mustHaveImages.toString();
  }
  if (caloriesFrom != null) {
    params["calories.from"] = caloriesFrom.toString();
  }
  if (caloriesTo != null) {
    params["calories.to"] = caloriesTo.toString();
  }
  if (carbPercentageFrom != null) {
    params["carb_percentage.from"] = carbPercentageFrom.toString();
  }
  if (carbPercentageTo != null) {
    params["carb_percentage.to"] = carbPercentageTo.toString();
  }
  if (proteinPercentageFrom != null) {
    params["protein_percentage.from"] = proteinPercentageFrom.toString();
  }
  if (proteinPercentageTo != null) {
    params["protein_percentage.to"] = proteinPercentageTo.toString();
  }
  if (fatPercentageFrom != null) {
    params["fat_percentage.from"] = fatPercentageFrom.toString();
  }
  if (fatPercentageTo != null) {
    params["fat_percentage.to"] = fatPercentageTo.toString();
  }
  if (prepTimeFrom != null) {
    params["prep_time.from"] = prepTimeFrom.toString();
  }
  if (prepTimeTo != null) {
    params["prep_time.to"] = prepTimeTo.toString();
  }
  if (pageNumber != null) {
    params["page_number"] = pageNumber.toString();
  }
  if (maxResults != null) {
    params["max_results"] = maxResults.toString();
  }
  if (sortBy != null) {
    params["sort_by"] = sortBy;
  }

  params["oauth_signature"] = generateOAuthSignature(
    httpMethod: "GET",
    baseUrl: url,
    params: params,
    consumerSecret: consumerSecret,
  );

  final uri = Uri.parse('$url?${buildParameterString(params)}');
  print("searchRecipes URL: $uri"); // Log the URL

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    print("searchRecipes Response: ${response.body}"); // Log response body
    try {
      final recipeSearchResult = RecipeSearchResult.fromJson(
          decodedResponse as Map<String, dynamic>); // No need to access 'recipes' here directly
      return recipeSearchResult.recipes?.recipe ?? [];
    } catch (e) {
      print("Error parsing JSON in searchRecipes: $e");
      throw Exception('Error parsing recipe search JSON response: $e');
    }
  } else {
    print(
        "HTTP Error in searchRecipes: ${response.statusCode}, ${response.body}");
    throw Exception(
        'HTTP request failed in recipe search with status: ${response.statusCode}, body: ${response.body}');
  }
}


// Function to get Recipe Types (Dart)
Future<List<String>> getRecipeTypes(
    String consumerKey,
    String consumerSecret,
    ) async {
  final url = "https://platform.fatsecret.com/rest/server.api";
  final params = <String, String>{
    "method": "recipe_types.get.v2",
    "format": "json",
    "oauth_consumer_key": consumerKey,
    "oauth_signature_method": "HMAC-SHA1",
    "oauth_timestamp": (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
    "oauth_nonce": generateNonce(),
    "oauth_version": "1.0",
  };

  params["oauth_signature"] = generateOAuthSignature(
    httpMethod: "GET",
    baseUrl: url,
    params: params,
    consumerSecret: consumerSecret,
  );

  final uri = Uri.parse('$url?${buildParameterString(params)}');
  print("getRecipeTypes URL: $uri"); // Log URL

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    print("getRecipeTypes Response: ${response.body}"); // Log response body
    try {
      final recipeTypesResult = RecipeTypesResult.fromJson(
          decodedResponse as Map<String, dynamic>); // Parse directly
      return recipeTypesResult.recipeTypes.recipe_type ?? [];
    } catch (e) {
      print("Error parsing JSON in getRecipeTypes: $e");
      throw Exception('Error parsing recipe types JSON response: $e');
    }
  } else {
    print(
        "HTTP Error in getRecipeTypes: ${response.statusCode}, ${response.body}");
    throw Exception(
        'HTTP request failed in getRecipeTypes with status: ${response.statusCode}, body: ${response.body}');
  }
}


// Example Usage (in your Flutter Widget or function)
/*
import 'package:flutter/material.dart';
import 'fat_secret_recipe.dart'; // Import recipe related classes

class FatSecretRecipeExample extends StatefulWidget {
  @override
  _FatSecretRecipeExampleState createState() => _FatSecretRecipeExampleState();
}

class _FatSecretRecipeExampleState extends State<FatSecretRecipeExample> {
  List<RecipeItem> _recipeItems = [];
  String _recipeDetails = "";
  List<String> _recipeTypesList = [];

  String consumerKey = 'YOUR_CONSUMER_KEY'; // Replace with your actual consumer key
  String consumerSecret = 'YOUR_CONSUMER_SECRET'; // Replace with your actual consumer secret


  @override
  void initState() {
    super.initState();
    _loadRecipeTypes(); // Load recipe types when the widget initializes
  }

  Future<void> _loadRecipeTypes() async {
    try {
      final types = await getRecipeTypes(consumerKey, consumerSecret);
      setState(() {
        _recipeTypesList = types;
      });
      print("Recipe Types Loaded: $_recipeTypesList");
    } catch (e) {
      print('Error loading recipe types: $e');
      // Handle error loading recipe types
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FatSecret Recipe API Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Search Recipes'),
              onSubmitted: (query) async {
                try {
                  final items = await searchRecipes(
                    query,
                    consumerKey,
                    consumerSecret,
                    recipeTypes: ['Breakfast', 'Lunch'], // Example recipe types filter
                    mustHaveImages: true, // Example filter: must have images
                  );
                  setState(() {
                    _recipeItems = items;
                    _recipeDetails = ""; // Clear details when searching
                  });
                } catch (e) {
                  print('Error searching recipes: $e');
                  // Handle error, show snackbar, etc.
                }
              },
            ),
            SizedBox(height: 20),
            Text("Available Recipe Types: ${_recipeTypesList.join(', ')}"), // Display recipe types
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _recipeItems.length,
                itemBuilder: (context, index) {
                  final recipeItem = _recipeItems[index];
                  return ListTile(
                    title: Text(recipeItem.recipeName),
                    subtitle: Text(recipeItem.recipeDescription ?? 'No description'),
                    leading: recipeItem.recipeImage != null ? Image.network(recipeItem.recipeImage!) : null,
                    // You can add onTap to view recipe details if needed
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
*/