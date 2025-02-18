import 'package:ai_nutrition_tracker_for_ios/data/database/entities/meal_entities.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/repositories/meal_repo.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/repositories/nutrition_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../data/database/entities/nutrition_entities.dart';
import '../../../data/https/SearchFood.dart';
import '../../auth/welcomescreens/2GoogleSignInScreen.dart';
import 'RecentMealHistory.dart';
import 'TrackFoodProvider.dart'; // Import your open_food_facts_product.dart file
import 'package:provider/provider.dart';


class FoodLoggingScreen extends StatefulWidget {
  const FoodLoggingScreen({super.key});

  @override
  State<FoodLoggingScreen> createState() => _FoodLoggingScreenState();
}

class _FoodLoggingScreenState extends State<FoodLoggingScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<FoodItem> _searchResults = [];
  bool _isLoading = false;
  String _searchQuery = '';

  String _scanBarcodeResult = '';

  String consumerKey = 'f9c981257ab2459e9ddb5e73a201631b'; // Replace with your actual consumer key
  String consumerSecret = 'c9af5e1b160144c4b3a6293d8ec182dc'; // Replace with your actual consumer secret

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Log Food',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        border: null, // Clean, borderless navigation bar
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Minimalist Search Bar
                    CupertinoSearchTextField(
                      controller: _searchController,
                      backgroundColor: CupertinoColors.systemGrey5,
                      placeholder: 'Search foods...',
                      style: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.all(12),
                      borderRadius: BorderRadius.circular(12),
                      onSubmitted: (query) {
                        _startSearch(query);
                      },
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          if (_searchQuery.isEmpty) {
                            _searchResults = []; // Clear results when search query is cleared
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    if (_isLoading) // Show loading indicator when searching
                      const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    else if (_searchResults.isNotEmpty) // Show search results
                      _buildSearchResultsList()
                    else // Show original UI when not loading and no search results
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAddViaText(context),
                          const SizedBox(height: 24),
                          // Quick Actions Grid (Scan Barcode & Scan Food)
                          Row(
                            children: [
                              Expanded(
                                child: _QuickActionCard(
                                  icon: CupertinoIcons.barcode_viewfinder,
                                  title: 'Scan Barcode',
                                  subtitle: 'Quick lookup',
                                  onTap: () {_startBarcodeScan();},
                                  gradientColors: const [
                                    Color(0xFF9B6FFF),
                                    Color(0xFF7B61FF)
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _QuickActionCard(
                                  icon: CupertinoIcons.camera_fill,
                                  title: 'Scan Food',
                                  subtitle: 'Use camera',
                                  onTap: () {
                                    context.pushNamed('camera_access');
                                  },
                                  gradientColors: const [
                                    Color(0xFF4A90E2),
                                    Color(0xFF357ABD)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          // Recent History Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Recent History',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Text('See All'),
                                onPressed: () {
                                  context.pushNamed('recent_meal_history');
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          HistoryList(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultsList() {

    final provider = Provider.of<FoodAnalysisProvider>(context, listen: false);
    final mealRepo = Provider.of<MealRepository>(context);
    final nutritionRepo = Provider.of<NutritionRepository>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling within sliver
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final foodItem = _searchResults[index];
        return FoodItemRow(
          foodItem: foodItem,
          onClick: () async {
            provider.setMealLoadingState(); 
            context.pushNamed('meal_details_screen');
            // Await the result of _getFoodDetailsAndLog so that foodDataFromFatSecret is of type FoodData? (not Future<FoodData?>)
            final foodDataFromFatSecret = await _getFoodDetailsAndLog(foodItem.food_id);

            if (foodDataFromFatSecret != null) {
              final meal = convertFoodDataToMeal(foodDataFromFatSecret);
              provider.setMealSuccessState(meal);

              // Use the meal object as needed...
            } else {
              provider.setMealErrorState("Product Not Found\n\n Please try again or use other methods.");
            }
          },
          logFood: () async {
            // Await the result of _getFoodDetailsAndLog so that foodDataFromFatSecret is of type FoodData? (not Future<FoodData?>)
            final foodDataFromFatSecret = await _getFoodDetailsAndLog(foodItem.food_id);
            if (foodDataFromFatSecret != null) {
              final meal = convertFoodDataToMeal(foodDataFromFatSecret);
              addMealAndUpdateNutrition(context,meal);
            }
          },
        );
      },
    );
  }

  Future<FoodData?> _getFoodDetailsAndLog(String? foodId) async {
    if (foodId == null) return null; // Handle null foodId case

    try {
      final foodDetails = await getFoodById(
        foodId,
        consumerKey,
        consumerSecret,
      );
      return FoodData.fromJson(foodDetails);
    } catch (e) {
      return null;
      // Handle error (show error message, etc.)
    }
  }


  Future<void> _startSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _searchResults = []; // Clear previous results
    });

    try {
      final results = await searchFoods( // Now searchFoods can throw exceptions
        query,
        consumerKey,
        consumerSecret,
        0, // page number
      );
      setState(() {
        _searchResults = results!;
        _isLoading = false;
      });
    } catch (e) { // Catch exceptions thrown by searchFoods
      print("Error searching foods: $e");
      setState(() {
        _isLoading = false;
        _searchResults = []; // Ensure loading is off even on error
      });
      // Optionally show an error message to the user using SnackBar or AlertDialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error searching foods: $e')), // Show SnackBar for errors
      );
    }
  }


  // Function to initiate barcode scanning using flutter_barcode_scanner
  Future<void> _startBarcodeScan() async {
    logger.d("Inside");
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', // Replace with your desired color code for the scanner line
          'Cancel', // Text for the cancel button
          true,      // Show flash icon
          ScanMode.BARCODE // Scan mode (BARCODE, QR, or DEFAULT)
      );
    } catch (e) {
      rethrow;
    }

    // If the widget was removed from the tree while the asynchronous call was in flight,
    // we want to discard the reply rather than calling setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcodeResult = barcodeScanRes; // Store the result
      if (_scanBarcodeResult != '-1' && _scanBarcodeResult.isNotEmpty) {
        logger.d('Barcode Scan Result: $_scanBarcodeResult');
        _navigateToProductAnalysis(context, _scanBarcodeResult); // Navigate with barcode value
      } else if (_scanBarcodeResult == '-1') {
        // User cancelled scan
        print('Barcode scan cancelled');
      } else {
        _showErrorDialog('Barcode scan failed or no barcode detected.');
      }
    });
  }


  void _navigateToProductAnalysis(BuildContext context, String barcodeValue) {
    final foodAnalysisProvider = Provider.of<FoodAnalysisProvider>(context, listen: false); // Get provider instance

    foodAnalysisProvider.loadFoodProductAnalysis(barcodeValue); // Call the load function from the provider

    context.pushNamed(
      'meal_details_screen', // Replace with your actual route name
      extra: barcodeValue, // Still pass barcode as extra for potential use in the next screen
    );
  }
  void _showErrorDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }


}

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealRepo = Provider.of<MealRepository>(context, listen: false);

    return FutureBuilder<List<Meal>>(
      future: mealRepo.getMostRecentMeals(3), // Fetch 3 most recent meals
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator()); // Loading indicator
        } else if (snapshot.hasError) {
          return Center(child: Text("Error loading history"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No meal history available"));
        }

        final historyItems = snapshot.data!; // Get the fetched meals

        return Column(
          children: historyItems
              .map((meal) => HistoryItem(
            foodName: meal.mealDescription ?? "Unknown Meal",
            calories: "${meal.mealCalories}",
            time: meal.timeThisMealWasLogged ?? "Unknown Time",
            imageUrl: meal.imageUrl,
            mealId: meal.id, // Default icon
          ))
              .toList(),
        );
      },
    );
  }
}




class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final List<Color> gradientColors;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.gradientColors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (MediaQuery.of(context).size.width - 48) / 2;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: CupertinoColors.systemGrey4),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with a subtle background accent
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: gradientColors.first.withOpacity(0.1),
              ),
              child: Icon(icon, color: gradientColors.first, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.systemGrey.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FoodItemRow extends StatelessWidget {
  final FoodItem foodItem;
  final VoidCallback onClick;
  final VoidCallback logFood;

  const FoodItemRow({
    Key? key,
    required this.foodItem,
    required this.onClick,
    required this.logFood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
      child: Card(
        margin: EdgeInsets.zero,
        color: CupertinoColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        foodItem.food_name ?? "N/A",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                          letterSpacing: -0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        foodItem.food_description ?? "No description",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.3,
                          color: CupertinoColors.systemGrey.withOpacity(0.8),
                          letterSpacing: -0.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12.0),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: logFood,
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      size: 20,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _buildAddViaText(BuildContext context) {
  final TextEditingController _contextController = TextEditingController();
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: CupertinoColors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: CupertinoColors.systemGrey4),
      boxShadow: [
        BoxShadow(
          color: CupertinoColors.systemGrey.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Add',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        CupertinoTextField(
          controller: _contextController,
          placeholder: 'E.g., 2 eggs, toast, and coffee',
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(12),
          ),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton.filled(
            padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            borderRadius: BorderRadius.circular(10),
            child: const Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              final provider = Provider.of<FoodAnalysisProvider>(context, listen: false);
              context.pushNamed('meal_details_screen');
              provider.generateAnalysisForText(_contextController.text, context);
            },
          ),
        ),
      ],
    ),
  );
}