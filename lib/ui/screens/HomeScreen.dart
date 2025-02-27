import 'package:ai_nutrition_tracker_for_ios/data/database/entities/nutrition_goal_holder.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetDate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../data/database/entities/nutrition_entities.dart';
import '../../data/database/repositories/nutrition_repo.dart';
import '../auth/welcome_provider.dart';
import '../auth/welcomescreens/2GoogleSignInScreen.dart';
import 'diary/CalorieCard.dart';
import 'diary/DiaryProvider.dart'; // Ensure this import is correct for NutritionDashboard

import 'dart:async';

// Then, the HomeScreen implementation:
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Added: Initialize the future in initState() with a default Future.
    // Use the service to load new data
    initialLoad();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the provider here.
    initialLoad();
  }

  Future<void> initialLoad() async {
    final provider = Provider.of<DiaryProvider>(context, listen: false);

    late String dateOfInformation = provider.dateForHomeScreen;

    try {
      await Provider.of<NutritionLoaderService>(context, listen: false)
          .loadNutritionForDate(dateOfInformation);
    } catch (e) {
      // Handle the error appropriately
      print('Error loading nutrition data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Nutrition?>(
        stream: Provider.of<NutritionLoaderService>(context).nutritionStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final nutrition = snapshot.data;
          if (nutrition == null) {
            return const Center(child: Text('No data available'));
          }

          return NutritionDashboard(
            consumedCalories: nutrition.calories,
            targetCalories: nutrition.targetCalories,
            macros: [
              MacroNutrient(
                  'Protein', nutrition.protein, nutrition.targetProtein, 'g'),
              MacroNutrient('Carbs', nutrition.carbohydrates,
                  nutrition.targetCarbohydrates, 'g'),
              MacroNutrient('Fats', nutrition.fat, nutrition.targetFat, 'g'),
            ],
            micronutrients: [
              MicroNutrient('Sugar', nutrition.sugar, 10, ' g'),
              MicroNutrient(
                  'Sodium', nutrition.sodium, nutrition.targetSodium, ' mg'),
              MicroNutrient(
                  'Calcium', nutrition.calcium, nutrition.targetCalcium, ' mg'),
              MicroNutrient('Potassium', nutrition.potassium,
                  nutrition.targetPotassium, ' mg'),
              MicroNutrient('Magnesium', nutrition.magnesium,
                  nutrition.targetMagnesium, ' mg'),
            ],
            dateChange: (date, dateTime) async {
              final provider =
                  Provider.of<DiaryProvider>(context, listen: false);
              provider.dateForHomeScreen = date;
              provider.dateTime = dateTime;

              // Use the service to load new data
              await Provider.of<NutritionLoaderService>(context, listen: false)
                  .loadNutritionForDate(date);
            },
          );
        },
      ),
    );
  }
}

class NutritionLoaderService extends ChangeNotifier {
  final NutritionRepository nutritionRepository;

  // Stream controller to broadcast nutrition updates
  final _nutritionController = StreamController<Nutrition?>.broadcast();
  Stream<Nutrition?> get nutritionStream => _nutritionController.stream;

  // Keep track of current nutrition data
  Nutrition? _currentNutrition;
  Nutrition? get currentNutrition => _currentNutrition;

  NutritionLoaderService({required this.nutritionRepository});

  Future<Nutrition?> loadNutritionForDate(String date) async {
    // Try to fetch Nutrition record for the given date
    Nutrition? nutrition = await nutritionRepository.getNutritionForDate(date);

    if (nutrition == null) {
      // If no record exists, create one
      final nutritionGoalHolder = await nutritionRepository.getNutritionGoal();
      final newNutrition = Nutrition();
      newNutrition.date = date;

      // Populate target values from NutritionGoalHolder if available
      if (nutritionGoalHolder != null) {
        newNutrition.targetWater = nutritionGoalHolder.targetWater;
        newNutrition.targetCalories = nutritionGoalHolder.targetCalories;
        newNutrition.targetCarbohydrates =
            nutritionGoalHolder.targetCarbohydrates;
        newNutrition.targetProtein = nutritionGoalHolder.targetProtein;
        newNutrition.targetFat = nutritionGoalHolder.targetFat;
        newNutrition.targetFiber = nutritionGoalHolder.targetFiber;
        newNutrition.targetSodium = nutritionGoalHolder.targetSodium;
        newNutrition.targetSugar = nutritionGoalHolder.targetSugar;
        newNutrition.targetCalcium = nutritionGoalHolder.targetCalcium;
        newNutrition.targetMagnesium = nutritionGoalHolder.targetMagnesium;
        newNutrition.targetPotassium = nutritionGoalHolder.targetPotassium;
      }

      await nutritionRepository.addNutrition(newNutrition);

      nutrition = await nutritionRepository.getNutritionForDate(date);
    } else if (nutrition.targetCalories == 0) {
      nutritionRepository.deleteNutritionForDate(nutrition.date ?? date);

      // If no record exists, create one
      final nutritionGoalHolder = await nutritionRepository.getNutritionGoal();
      final newNutrition = Nutrition();
      newNutrition.date = date;

      // Populate target values from NutritionGoalHolder if available
      if (nutritionGoalHolder != null) {
        newNutrition.targetWater = nutritionGoalHolder.targetWater;
        newNutrition.targetCalories = nutritionGoalHolder.targetCalories;
        newNutrition.targetCarbohydrates =
            nutritionGoalHolder.targetCarbohydrates;
        newNutrition.targetProtein = nutritionGoalHolder.targetProtein;
        newNutrition.targetFat = nutritionGoalHolder.targetFat;
        newNutrition.targetFiber = nutritionGoalHolder.targetFiber;
        newNutrition.targetSodium = nutritionGoalHolder.targetSodium;
        newNutrition.targetSugar = nutritionGoalHolder.targetSugar;
        newNutrition.targetCalcium = nutritionGoalHolder.targetCalcium;
        newNutrition.targetMagnesium = nutritionGoalHolder.targetMagnesium;
        newNutrition.targetPotassium = nutritionGoalHolder.targetPotassium;
      }

      await nutritionRepository.addNutrition(newNutrition);
      nutrition = await nutritionRepository.getNutritionForDate(date);
    }

    // Update current nutrition and notify listeners
    _currentNutrition = nutrition;
    _nutritionController.add(nutrition);
    notifyListeners();

    return nutrition;
  }

  @override
  void dispose() {
    _nutritionController.close();
    super.dispose();
  }
}

// Changed: Converted HomeScreen from StatelessWidget to StatefulWidget
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState(); // Added createState()
// }
//
//
// class _HomeScreenState extends State<HomeScreen> {
//   // Added: A state variable to hold the Future result
//   late Future<Nutrition?> _nutritionFuture;
//   NutritionRepository? nutritionRepository; // Keep a local copy.
//
//
//   @override
//   void initState() {
//     super.initState();
//     // Added: Initialize the future in initState() with a default Future.
//     _nutritionFuture = Future.value(null);
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Access the provider here.
//     nutritionRepository = Provider.of<NutritionRepository>(context);
//     _loadNutrition(); // Load the data
//   }
//
//   // Added: An async function to load (or create) today's Nutrition record
//   Future<Nutrition?> _loadNutrition() async {
//     logger.d("Inside");
//     final provider = Provider.of<DiaryProvider>(context, listen: false);
//
//     late String dateOfInformation =  provider.dateForHomeScreen;
//
//     if (nutritionRepository == null) {
//       return null; // or handle the error as appropriate
//     }
//
//     // Try to fetch today's Nutrition record
//     Nutrition? nutrition = await nutritionRepository!.getNutritionForDate(dateOfInformation); // use ! after checking for null
//
//     if (nutrition == null) { // If no record exists, create one
//       final nutritionGoalHolder = await nutritionRepository!.getNutritionGoal(); // use ! after checking for null
//       final newNutrition = Nutrition();
//       newNutrition.date = dateOfInformation; // Set today's date using helper
//
//       // Added: Populate target values from NutritionGoalHolder if available
//       if (nutritionGoalHolder != null) {
//         newNutrition.targetWater = nutritionGoalHolder.targetWater;
//         newNutrition.targetCalories = nutritionGoalHolder.targetCalories;
//         newNutrition.targetCarbohydrates = nutritionGoalHolder.targetCarbohydrates;
//         newNutrition.targetProtein = nutritionGoalHolder.targetProtein;
//         newNutrition.targetFat = nutritionGoalHolder.targetFat;
//         newNutrition.targetFiber = nutritionGoalHolder.targetFiber;
//         newNutrition.targetSodium = nutritionGoalHolder.targetSodium;
//         newNutrition.targetSugar = nutritionGoalHolder.targetSugar;
//         newNutrition.targetCalcium = nutritionGoalHolder.targetCalcium;
//         newNutrition.targetMagnesium = nutritionGoalHolder.targetMagnesium;
//         newNutrition.targetPotassium = nutritionGoalHolder.targetPotassium;
//       }
//
//       await nutritionRepository!.addNutrition(newNutrition); // use ! after checking for null
//       nutrition = await nutritionRepository!.getNutritionForDate(dateOfInformation); // use ! after checking for null
//     }
//     // setState(() {
//       _nutritionFuture = Future.value(nutrition);
//     // });
//     return nutrition;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DiaryProvider>(context);  // No need to read provider here, it is already available.
//     return Scaffold(
//       body: FutureBuilder<Nutrition?>(
//         // Changed: Now using _nutritionFuture
//         future: _nutritionFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             logger.d("Error: ${snapshot.error}");
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (snapshot.hasData && snapshot.data != null) {
//             final nutrition = snapshot.data!;
//             return NutritionDashboard(
//               consumedCalories: nutrition.calories,
//               targetCalories: nutrition.targetCalories,
//               macros: [
//                 MacroNutrient('Protein', nutrition.protein, nutrition.targetProtein, 'g'),
//                 MacroNutrient('Carbs', nutrition.carbohydrates, nutrition.targetCarbohydrates, 'g'),
//                 MacroNutrient('Fats', nutrition.fat, nutrition.targetFat, 'g'),
//               ],
//               micronutrients: [
//                 MicroNutrient('Sugar', nutrition.sugar, nutrition.targetSugar, ' g'),
//                 MicroNutrient('Sodium', nutrition.sodium, nutrition.targetSodium, ' mg'),
//                 MicroNutrient('Calcium', nutrition.calcium, nutrition.targetCalcium, ' mg'),
//                 MicroNutrient('Magnesium', nutrition.magnesium, nutrition.targetMagnesium, ' mg'),
//                 MicroNutrient('Potassium', nutrition.potassium, nutrition.targetPotassium, ' mg'),
//               ],
//               dateChange: (date,dateTime) async {
//                 logger.d("daate-- > $date");
//                 logger.d("daateFor Homescree-- > ${provider.dateForHomeScreen}");
//                 provider.dateForHomeScreen = date;
//                 provider.dateTime = dateTime;
//                 logger.d("daateFor Homescree 2-- > ${provider.dateForHomeScreen}");
//                 Nutrition? newNutritionClass = await nutritionRepository!.getNutritionForDate(date); //Use local copy
//                 if(newNutritionClass == null){
//                   final nutritionGoalHolder = await nutritionRepository!.getNutritionGoal(); // Use local copy
//
//                   final newNutrition = Nutrition();
//                   newNutrition.date = date; //Use local copy
//                   if(nutritionGoalHolder != null) {
//                     newNutrition.targetWater = nutritionGoalHolder.targetWater;
//                     newNutrition.targetCalories = nutritionGoalHolder.targetCalories;
//                     newNutrition.targetCarbohydrates = nutritionGoalHolder.targetCarbohydrates;
//                     newNutrition.targetProtein = nutritionGoalHolder.targetProtein;
//                     newNutrition.targetFat = nutritionGoalHolder.targetFat;
//                     newNutrition.targetFiber = nutritionGoalHolder.targetFiber;
//                     newNutrition.targetSodium = nutritionGoalHolder.targetSodium;
//                     newNutrition.targetSugar = nutritionGoalHolder.targetSugar;
//                     newNutrition.targetCalcium = nutritionGoalHolder.targetCalcium;
//                     newNutrition.targetMagnesium = nutritionGoalHolder.targetMagnesium;
//                     newNutrition.targetPotassium = nutritionGoalHolder.targetPotassium;
//                   }
//                   await nutritionRepository!.addNutrition(newNutrition);
//                   newNutritionClass = await nutritionRepository!.getNutritionForDate(date); // Use local copy.
//                 }
//                 setState(() {
//                   _nutritionFuture = Future.value(newNutritionClass);
//                 });
//               },
//             );
//           }
//           // Fallback UI in case something unexpected happens
//           return NutritionDashboard(
//             consumedCalories: 1500,
//             targetCalories: 2500,
//             macros: [
//               MacroNutrient('Protein', 80, 150, 'g'),
//               MacroNutrient('Carbs', 120, 200, 'g'),
//               MacroNutrient('Fats', 40, 70, 'g'),
//             ],
//             micronutrients: const [
//               MicroNutrient('Sugar', 75, 100, ' g'),
//               MicroNutrient('Sodium', 2600, 2300, ' mg'),
//               MicroNutrient('Calcium', 800, 1200, ' mg'),
//               MicroNutrient('Magnesium', 300, 400, ' mg'),
//               MicroNutrient('Potassium', 3500, 4700, ' mg'),
//             ],
//             dateChange: (date,dateTime) async {
//               logger.d("daate-- > $date");
//               logger.d("daateFor Homescree-- > ${provider.dateForHomeScreen}");
//               provider.dateForHomeScreen = date;
//               provider.dateTime = dateTime;
//               logger.d("daateFor Homescree 2-- > ${provider.dateForHomeScreen}");
//               Nutrition? newNutritionClass = await nutritionRepository!.getNutritionForDate(date); //Use local copy
//               if(newNutritionClass == null){
//                 final newNutrition = Nutrition();
//                 final nutritionGoalHolder = await nutritionRepository!.getNutritionGoal();
//                 if(nutritionGoalHolder != null) {
//                   newNutrition.targetWater = nutritionGoalHolder.targetWater;
//                   newNutrition.targetCalories = nutritionGoalHolder.targetCalories;
//                   newNutrition.targetCarbohydrates = nutritionGoalHolder.targetCarbohydrates;
//                   newNutrition.targetProtein = nutritionGoalHolder.targetProtein;
//                   newNutrition.targetFat = nutritionGoalHolder.targetFat;
//                   newNutrition.targetFiber = nutritionGoalHolder.targetFiber;
//                   newNutrition.targetSodium = nutritionGoalHolder.targetSodium;
//                   newNutrition.targetSugar = nutritionGoalHolder.targetSugar;
//                   newNutrition.targetCalcium = nutritionGoalHolder.targetCalcium;
//                   newNutrition.targetMagnesium = nutritionGoalHolder.targetMagnesium;
//                   newNutrition.targetPotassium = nutritionGoalHolder.targetPotassium;
//                 }
//
//                 await nutritionRepository!.addNutrition(newNutrition);
//                 newNutritionClass = await nutritionRepository!.getNutritionForDate(date); // Use local copy.
//               }
//               setState(() {
//                 _nutritionFuture = Future.value(newNutritionClass);
//               });
//             },
//           );
//         },
//       ),
//     );
//   }
// }
