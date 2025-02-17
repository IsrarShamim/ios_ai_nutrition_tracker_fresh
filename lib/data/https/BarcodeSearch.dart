import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../data_classes/nutrition/BarcodeSearch.dart'; // For debugPrint

Future<void> loadFoodAnalysis({
  String barCode = "3017624010701",
  Function? error, // Optional error callback, use Function? for nullable
  required Function(OpenFoodFactsProduct) getOpenFoodFactsProduct, // Required success callback
}) async {
  // List of fields to retrieve from Open Food Facts API
  final List<String> listOfField = [
    "image_url",
    "allergens",
    "ingredients_analysis",
    "nutriscore_data",
    "product_name",
    "nutriments",
    "nutrient_levels",
    "nutriscore_grade",
    "ingredients"
  ];
  final String fields = listOfField.join(',');

  final String url =
      "https://world.openfoodfacts.org/api/v2/product/$barCode?fields=$fields";

  debugPrint("FoodAnalysisRequest: url $url"); // Use debugPrint for logging in Flutter

  try {
    final response = await http.get(Uri.parse(url));

    debugPrint("FoodAnalysisRequest: Response status code: ${response.statusCode}");
    debugPrint("FoodAnalysisRequest: Full Response body: ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      if (jsonResponse["status"].toString() == "1") {
        try {
          final openFoodFactsProduct = OpenFoodFactsProduct.fromJson(jsonResponse);
          getOpenFoodFactsProduct(openFoodFactsProduct);
        } catch (e) {
          debugPrint("FoodAnalysisRequest: Error parsing JSON response: $e");
          error?.call(); // Call error callback if parsing fails
        }
      } else {
        debugPrint("FoodAnalysisRequest: Product not found for barcode: $barCode");
        error?.call(); // Call error callback when product is not found
        // In Flutter, you would typically use a SnackBar or AlertDialog instead of Toast
        // to inform the user about errors in the UI layer.
      }
    } else {
      debugPrint("FoodAnalysisRequest: HTTP request failed with status code: ${response.statusCode}");
      error?.call(); // Call error callback for HTTP errors
    }
  } catch (e) {
    debugPrint("FoodAnalysisRequest: Network or other error: $e");
    error?.call(); // Call error callback for network or other exceptions
  }
}