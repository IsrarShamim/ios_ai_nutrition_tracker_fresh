// recipe_details_provider.dart
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetDate.dart';
import 'package:ai_nutrition_tracker_for_ios/data/util/GetTime.dart';
import 'package:isar/isar.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart'; // Import Provider

import '../../../data/database/entities/nutrition_entities.dart';
import '../../../data/database/repositories/meal_repo.dart';
import '../../../data/database/repositories/nutrition_repo.dart';
import '../../../data/database/repositories/user_information_repo.dart';
import '../../../data/gemini/GeminiModels.dart';
import '../../../data/gemini/prompts/RecipeGeneration.dart';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../data/database/entities/meal_entities.dart';
import '../../auth/welcomescreens/2GoogleSignInScreen.dart';
import '../../common/SnackBar.dart';

class RecipeDetailsState {
  final bool isLoading;
  final AIRecipeDetail? recipeDetail;
  final String? error;

  RecipeDetailsState({
    this.isLoading = false,
    this.recipeDetail,
    this.error,
  });

  RecipeDetailsState copyWith({
    bool? isLoading,
    AIRecipeDetail? recipeDetail,
    String? error,
  }) {
    return RecipeDetailsState(
      isLoading: isLoading ?? this.isLoading,
      recipeDetail: recipeDetail ?? this.recipeDetail,
      error: error ?? this.error,
    );
  }
}

class RecipeDetailsProvider with ChangeNotifier {
  bool _isLoading = false;
  AIRecipeDetail? _recipeDetail;
  String? _error;
  final BuildContext context;

  String recipeName = "";

  // recipeName = _provider.recipeName

  RecipeDetailsProvider(this.context);

  bool get isLoading => _isLoading;

  AIRecipeDetail? get recipeDetail => _recipeDetail;

  String? get error => _error;

  Future<void> generateRecipeDetails(AIRecipeSearchItem searchItem) async {
    recipeName = searchItem.name;
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final userInfoRepository =
          Provider.of<UserInfoRepository>(context, listen: false);
      final userInfo = await userInfoRepository.getUserInformationEntity();

      String prompt;
      if (userInfo != null) {
        prompt =
            generateDetailedRecipePromptFromSearchItem(userInfo, searchItem);
      } else {
        prompt =
            generateDetailedRecipePromptFromSearchItemWhenUserInfoIsNotAvailable(
                searchItem);
      }
      logger.d("prompt -- > \n$prompt");

      final content = Content.text(prompt);
      final response = await geminiForRecipeGeneration.sendMessage(content);

      logger.d("response -- > \n${response.text}");
      _recipeDetail = AIRecipeDetail.fromJson(
          jsonDecode(response.text ?? "") as Map<String, dynamic>);
      logger.d("_recipeDetail -- > \n${_recipeDetail?.recipe.name}");
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to generate recipe details: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveMeal(BuildContext contextPara) async {
    if (_recipeDetail == null) return;

    try {
      final recipe = _recipeDetail!.recipe;
      final nutritionalInfo = recipe.nutritionalInfo;

      final meal = Meal()
        ..mealId = recipe.name
        ..date = getCurrentDate()
        ..timeThisMealWasLogged = getCurrentFormattedTime()
        ..timeOfThisMeal = getCurrentTime()
        ..mealDescription = recipe.name
        ..exactMealAmount = '${recipe.servings} servings'
        ..mealCalories = nutritionalInfo.calories
        ..mealCarbohydrates = nutritionalInfo.carbohydrates
        ..mealProtein = nutritionalInfo.protein
        ..mealFat = nutritionalInfo.fat
        ..mealFiber = nutritionalInfo.fiber
        ..mealSodium = nutritionalInfo.sodium
        ..mealSugar = nutritionalInfo.sugar
        ..mealCalcium = nutritionalInfo.calcium
        ..mealMagnesium = nutritionalInfo.magnesium
        ..mealPotassium = nutritionalInfo.potassium;

      addMealAndUpdateNutrition(
          contextPara, meal);
    } catch (e) {
      _error = 'Failed to save meal: ${e.toString()}';
      notifyListeners();
    }
  }
}

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 140 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (_scrollController.offset <= 140 && _showTitle) {
      setState(() => _showTitle = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeDetailsProvider>(
      builder: (context, provider, child) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.systemBackground.withOpacity(0.8),
            border: null,
            middle: AnimatedOpacity(
              opacity: _showTitle ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                provider.recipeName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          child: provider.isLoading
              ? const Center(child: CupertinoActivityIndicator())
              : provider.error != null
                  ? _buildErrorState(provider.error!)
                  : _buildContent(provider),
        );
      },
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_circle,
            size: 48,
            color: CupertinoColors.systemRed,
          ),
          const SizedBox(height: 16),
          Text(
            error,
            style: const TextStyle(
              color: CupertinoColors.systemRed,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(RecipeDetailsProvider provider) {
    return Builder(
      builder: (BuildContext context) {


        if (provider.recipeDetail == null) return const SizedBox.shrink();

        final recipe = provider.recipeDetail!.recipe;
        return Stack(  // <-- Added return here.
          children: [
            CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 100,
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.label,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${recipe.servings} servings • ${recipe.nutritionalInfo.calories} calories',
                          style: TextStyle(
                            fontSize: 17,
                            color: CupertinoColors.label.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildNutritionSection(recipe.nutritionalInfo),
                _buildIngredientSection(recipe.ingredients),
                _buildInstructionsSection(recipe.instructions),
                _buildTipsSection(recipe.tips),
                const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: SafeArea(
                child: CupertinoButton.filled(
                  onPressed: () async {
                    await provider.saveMeal(context);
                  },
                  child: const Text('Save to Meals'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  Widget _buildNutritionSection(NutritionalInfo info) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Nutrition Facts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
            ),
            _buildNutrientGrid(info),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientGrid(NutritionalInfo info) {
    final nutrients = [
      {'label': 'Calories', 'value': '${info.calories} kcal'},
      {'label': 'Protein', 'value': '${info.protein}g'},
      {'label': 'Carbs', 'value': '${info.carbohydrates}g'},
      {'label': 'Fat', 'value': '${info.fat}g'},
      {'label': 'Fiber', 'value': '${info.fiber}g'},
      {'label': 'Sugar', 'value': '${info.sugar}g'},
      {'label': 'Sodium', 'value': '${info.sodium}mg'},
      {'label': 'Calcium', 'value': '${info.calcium}mg'},
      {'label': 'Magnesium', 'value': '${info.magnesium}mg'},
      {'label': 'Potassium', 'value': '${info.potassium}mg'},
    ];

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.8, // Increased from 2.5 to give more vertical space
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: nutrients.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          // Reduced vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nutrients[index]['label']!,
                style: TextStyle(
                  fontSize: 13, // Reduced from 14
                  color: CupertinoColors.label.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 2), // Reduced from 4
              Text(
                nutrients[index]['value']!,
                style: const TextStyle(
                  fontSize: 15, // Reduced from 17
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.label,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIngredientSection(List<Ingredient> ingredients) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.label,
              ),
            ),
            const SizedBox(height: 32),
            ...ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${ingredient.quantity} ${ingredient.item}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: CupertinoColors.label,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionsSection(String instructions) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Instructions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.label,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              instructions,
              style: const TextStyle(
                fontSize: 17,
                height: 1.6,
                color: CupertinoColors.label,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsSection(String tips) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CupertinoColors.systemYellow.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  CupertinoIcons.lightbulb_fill,
                  color: CupertinoColors.systemYellow,
                ),
                SizedBox(width: 8),
                Text(
                  'Chef\'s Tips',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              tips,
              style: const TextStyle(
                fontSize: 17,
                height: 1.6,
                color: CupertinoColors.label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
