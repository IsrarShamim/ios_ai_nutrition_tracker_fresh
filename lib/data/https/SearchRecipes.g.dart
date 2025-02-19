// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchRecipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSearchResult _$RecipeSearchResultFromJson(Map<String, dynamic> json) =>
    RecipeSearchResult(
      recipes: json['recipes'] == null
          ? null
          : Recipes.fromJson(json['recipes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeSearchResultToJson(RecipeSearchResult instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };

Recipes _$RecipesFromJson(Map<String, dynamic> json) => Recipes(
      maxResults: (json['max_results'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
      pageNumber: (json['page_number'] as num).toInt(),
      recipe: (json['recipe'] as List<dynamic>?)
          ?.map((e) => RecipeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipesToJson(Recipes instance) => <String, dynamic>{
      'max_results': instance.maxResults,
      'total_results': instance.totalResults,
      'page_number': instance.pageNumber,
      'recipe': instance.recipe,
    };

RecipeItem _$RecipeItemFromJson(Map<String, dynamic> json) => RecipeItem(
      recipeId: (json['recipe_id'] as num).toInt(),
      recipeName: json['recipe_name'] as String,
      recipeDescription: json['recipe_description'] as String?,
      recipeImage: json['recipe_image'] as String?,
      recipeNutrition: json['recipe_nutrition'] == null
          ? null
          : RecipeNutrition.fromJson(
              json['recipe_nutrition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeItemToJson(RecipeItem instance) =>
    <String, dynamic>{
      'recipe_id': instance.recipeId,
      'recipe_name': instance.recipeName,
      'recipe_description': instance.recipeDescription,
      'recipe_image': instance.recipeImage,
      'recipe_nutrition': instance.recipeNutrition,
    };

RecipeNutrition _$RecipeNutritionFromJson(Map<String, dynamic> json) =>
    RecipeNutrition(
      calories: (json['calories'] as num).toDouble(),
      carbohydrate: (json['carbohydrate'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
    );

Map<String, dynamic> _$RecipeNutritionToJson(RecipeNutrition instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
      'fat': instance.fat,
    };

RecipeTypesResult _$RecipeTypesResultFromJson(Map<String, dynamic> json) =>
    RecipeTypesResult(
      recipeTypes:
          RecipeTypes.fromJson(json['recipe_types'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeTypesResultToJson(RecipeTypesResult instance) =>
    <String, dynamic>{
      'recipe_types': instance.recipeTypes,
    };

RecipeTypes _$RecipeTypesFromJson(Map<String, dynamic> json) => RecipeTypes(
      recipe_type: (json['recipe_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeTypesToJson(RecipeTypes instance) =>
    <String, dynamic>{
      'recipe_type': instance.recipe_type,
    };
