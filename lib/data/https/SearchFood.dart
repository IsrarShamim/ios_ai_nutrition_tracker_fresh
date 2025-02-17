import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:random_string/random_string.dart';
import '../../ui/auth/welcomescreens/2GoogleSignInScreen.dart'; // For nonce generation
part 'SearchFood.g.dart';

// Data Classes

@JsonSerializable()
class FoodFromBarcode {
  final FoodId food_id;

  FoodFromBarcode({required this.food_id});

  factory FoodFromBarcode.fromJson(Map<String, dynamic> json) =>
      _$FoodFromBarcodeFromJson(json);

  Map<String, dynamic> toJson() => _$FoodFromBarcodeToJson(this);
}

@JsonSerializable()
class FoodId {
  final String value;

  FoodId({required this.value});

  factory FoodId.fromJson(Map<String, dynamic> json) => _$FoodIdFromJson(json);

  Map<String, dynamic> toJson() => _$FoodIdToJson(this);
}

@JsonSerializable()
class FoodSearchResult {
  final Foods? foods;

  FoodSearchResult({this.foods});

  factory FoodSearchResult.fromJson(Map<String, dynamic> json) =>
      _$FoodSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$FoodSearchResultToJson(this);
}

@JsonSerializable()
class Foods {
  final List<FoodItem>? food;

  Foods({this.food});

  factory Foods.fromJson(Map<String, dynamic> json) => _$FoodsFromJson(json);

  Map<String, dynamic> toJson() => _$FoodsToJson(this);
}

@JsonSerializable()
class FoodItem {
  final String? food_name;
  final String? food_id;
  final String? food_description;
  final String? food_type;
  final String? food_url;

  FoodItem({
    this.food_name,
    this.food_id,
    this.food_description,
    this.food_type,
    this.food_url,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoodItemToJson(this);
}



Future<List<FoodItem>> searchFoods( // Changed return type to Future<List<FoodItem>> (non-nullable)
    String query,
    String consumerKey,
    String consumerSecret,
    int pageNumber,
    ) async {
  final url = "https://platform.fatsecret.com/rest/server.api";
  final params = <String, String>{
    "method": "foods.search",
    "page_number": pageNumber.toString(),
    "max_results": "50",
    "search_expression": query,
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

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    logger.d("decodedResponse -- > $decodedResponse"); // Log the full response
    try {
      final foods = Foods.fromJson(decodedResponse['foods'] as Map<String, dynamic>);
      logger.d("foods -- > ${foods.food?.first}"); // Log the full response
      return foods.food ?? [];// Return empty list if foods or food is null
    } catch (e) {
      logger.e("Error parsing JSON in searchFoods: $e", error: e, stackTrace: StackTrace.current); // Log error with stacktrace
      throw Exception('Error parsing food search JSON response: $e'); // Throw exception for parsing errors
    }
  } else {
    logger.e("HTTP Error in searchFoods: ${response.statusCode}, body: ${response.body}"); // Log HTTP error
    throw Exception( // Throw exception for HTTP errors
        'HTTP request failed in food search with status: ${response.statusCode}, body: ${response.body}');
  }
}

Future<Map<String, dynamic>> getFoodById(
    String foodId,
    String consumerKey,
    String consumerSecret,
    ) async {
  final url = "https://platform.fatsecret.com/rest/server.api";
  final params = <String, String>{
    "method": "food.get.v4",
    "food_id": foodId,
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
  print("getFoodById URL: $uri"); // Log the URL for debugging

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    print("getFoodById Response: ${response.body}"); // Log the response body
    try {
      return decodedResponse['food'] as Map<String, dynamic>; // Return the food details as a map
    } catch (e) {
      print("Error parsing JSON in getFoodById: $e");
      throw Exception('Error parsing food details JSON response: $e');
    }

  } else {
    print("HTTP Error in getFoodById: ${response.statusCode}, ${response.body}");
    throw Exception(
        'HTTP request failed in getFoodById with status: ${response.statusCode}, body: ${response.body}');
  }
}

Future<String> findFoodIdForBarcode(
    String barcode,
    String consumerKey,
    String consumerSecret,
    ) async {
  final url = "https://platform.fatsecret.com/rest/server.api";
  final params = <String, String>{
    "method": "food.find_id_for_barcode",
    "barcode": barcode,
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
  print("findFoodIdForBarcode URL: $uri"); // Log the URL for debugging

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    print("findFoodIdForBarcode Response: ${response.body}"); // Log the response body
    try {
      return decodedResponse['food']['food_id'].toString(); // Extract and return food_id
    } catch (e) {
      print("Error parsing JSON in findFoodIdForBarcode: $e");
      throw Exception('Error parsing barcode search JSON response: $e');
    }
  } else {
    print("HTTP Error in findFoodIdForBarcode: ${response.statusCode}, ${response.body}");
    throw Exception(
        'HTTP request failed in barcode search with status: ${response.statusCode}, body: ${response.body}');
  }
}


// OAuth Signature Generation (Dart)

String generateOAuthSignature({
  required String httpMethod,
  required String baseUrl,
  required Map<String, String> params,
  required String consumerSecret,
}) {
  final parameterString = buildParameterString(params);
  final signatureBaseString =
      '$httpMethod&${Uri.encodeComponent(baseUrl)}&${Uri.encodeComponent(parameterString)}';

  final signingKey = '${Uri.encodeComponent(consumerSecret)}&'; // No token secret for public calls

  final hmacSha1 = Hmac(sha1, utf8.encode(signingKey));
  final signatureBytes = hmacSha1.convert(utf8.encode(signatureBaseString)).bytes;
  return base64.encode(signatureBytes);
}

String buildParameterString(Map<String, String> params) {
  final sortedParams = params.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key)); // Sort alphabetically
  return sortedParams.map((entry) {
    return '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}';
  }).join('&');
}

// Nonce Generator (using random_string package)
String generateNonce() {
  return randomNumeric(8) + randomAlphaNumeric(16); // Example nonce, adjust as needed
}


// Example Usage (in your Flutter Widget or function)
/*
import 'package:flutter/material.dart';

class FatSecretExample extends StatefulWidget {
  @override
  _FatSecretExampleState createState() => _FatSecretExampleState();
}

class _FatSecretExampleState extends State<FatSecretExample> {
  List<FoodItem> _foodItems = [];
  String _foodDetails = "";

  String consumerKey = 'YOUR_CONSUMER_KEY'; // Replace with your actual consumer key
  String consumerSecret = 'YOUR_CONSUMER_SECRET'; // Replace with your actual consumer secret


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FatSecret API Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Search Food'),
              onSubmitted: (query) async {
                try {
                  final items = await searchFoods(query, consumerKey, consumerSecret, 0);
                  setState(() {
                    _foodItems = items;
                    _foodDetails = ""; // Clear details when searching
                  });
                } catch (e) {
                  print('Error searching foods: $e');
                  // Handle error, show snackbar, etc.
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = _foodItems[index];
                  return ListTile(
                    title: Text(foodItem.food_name ?? 'N/A'),
                    subtitle: Text(foodItem.food_description ?? 'N/A'),
                    onTap: () async {
                      if (foodItem.food_id != null) {
                        try {
                          final details = await getFoodById(foodItem.food_id!, consumerKey, consumerSecret);
                          setState(() {
                            _foodDetails = "Food Details:\n${jsonEncode(details)}";
                          });
                        } catch (e) {
                          print('Error getting food details: $e');
                          _foodDetails = "Error fetching details: $e";
                        }
                      }
                    },
                  );
                },
              ),
            ),
            if (_foodDetails.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(_foodDetails),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  String barcodeToSearch = "0041570054161"; // Example barcode
                  final foodIdFromBarcode = await findFoodIdForBarcode(barcodeToSearch, consumerKey, consumerSecret);
                  print("Food ID from Barcode: $foodIdFromBarcode");
                  // You can now use foodIdFromBarcode to get food details
                  if (foodIdFromBarcode.isNotEmpty) {
                      final details = await getFoodById(foodIdFromBarcode, consumerKey, consumerSecret);
                      setState(() {
                        _foodDetails = "Food Details from Barcode:\n${jsonEncode(details)}";
                      });
                   }
                } catch (e) {
                  print('Error finding food ID by barcode: $e');
                   _foodDetails = "Error fetching food ID by barcode: $e";
                }
              },
              child: Text('Find Food ID by Barcode (Example)'),
            ),
             if (_foodDetails.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(_foodDetails),
            ],
          ],
        ),
      ),
    );
  }
}
*/