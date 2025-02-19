// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BarcodeSearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenFoodFactsProduct _$OpenFoodFactsProductFromJson(
        Map<String, dynamic> json) =>
    OpenFoodFactsProduct(
      code: json['code'] as String?,
      product: json['product'] == null
          ? null
          : ProductDetails.fromJson(json['product'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toDouble(),
      statusVerbose: json['status_verbose'] as String?,
    );

Map<String, dynamic> _$OpenFoodFactsProductToJson(
        OpenFoodFactsProduct instance) =>
    <String, dynamic>{
      'code': instance.code,
      'product': instance.product,
      'status': instance.status,
      'status_verbose': instance.statusVerbose,
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      allergens: json['allergens'] as String?,
      imageUrl: json['image_url'] as String?,
      ingredientsAnalysis:
          (json['ingredients_analysis'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      nutrientLevels: (json['nutrient_levels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      nutriments: json['nutriments'] == null
          ? null
          : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
      nutriscoreData: json['nutriscore_data'] == null
          ? null
          : NutriScoreData.fromJson(
              json['nutriscore_data'] as Map<String, dynamic>),
      productName: json['product_name'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'allergens': instance.allergens,
      'image_url': instance.imageUrl,
      'ingredients_analysis': instance.ingredientsAnalysis,
      'nutrient_levels': instance.nutrientLevels,
      'nutriments': instance.nutriments,
      'nutriscore_data': instance.nutriscoreData,
      'product_name': instance.productName,
      'ingredients': instance.ingredients,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      ciqualProxyFoodCode: json['ciqual_proxy_food_code'] as String?,
      id: json['id'] as String?,
      percentEstimate: (json['percent_estimate'] as num?)?.toDouble(),
      percentMax: (json['percent_max'] as num?)?.toDouble(),
      percentMin: (json['percent_min'] as num?)?.toDouble(),
      text: json['text'] as String?,
      vegan: json['vegan'] as String?,
      vegetarian: json['vegetarian'] as String?,
      ciqualFoodCode: json['ciqual_food_code'] as String?,
      fromPalmOil: json['from_palm_oil'] as String?,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'ciqual_proxy_food_code': instance.ciqualProxyFoodCode,
      'id': instance.id,
      'percent_estimate': instance.percentEstimate,
      'percent_max': instance.percentMax,
      'percent_min': instance.percentMin,
      'text': instance.text,
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
      'ciqual_food_code': instance.ciqualFoodCode,
      'from_palm_oil': instance.fromPalmOil,
    };

Nutriments _$NutrimentsFromJson(Map<String, dynamic> json) => Nutriments(
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      carbohydrates100g: (json['carbohydrates_100g'] as num?)?.toDouble(),
      carbohydratesUnit: json['carbohydrates_unit'] as String?,
      carbohydratesValue: (json['carbohydrates_value'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      energyKcal: (json['energy-kcal'] as num?)?.toDouble(),
      energyKcal100g: (json['energy-kcal_100g'] as num?)?.toDouble(),
      energyKcalUnit: json['energy-kcal_unit'] as String?,
      energyKcalValue: (json['energy-kcal_value'] as num?)?.toDouble(),
      energyKcalValueComputed:
          (json['energy-kcal_value_computed'] as num?)?.toDouble(),
      energy100g: (json['energy_100g'] as num?)?.toDouble(),
      energyUnit: json['energy_unit'] as String?,
      energyValue: (json['energy_value'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      fat100g: (json['fat_100g'] as num?)?.toDouble(),
      fatUnit: json['fat_unit'] as String?,
      fatValue: (json['fat_value'] as num?)?.toDouble(),
      fruitsVegetablesLegumesEstimateFromIngredients100g:
          (json['fruits-vegetables-legumes-estimate-from-ingredients_100g']
                  as num?)
              ?.toDouble(),
      fruitsVegetablesLegumesEstimateFromIngredientsServing:
          (json['fruits-vegetables-legumes-estimate-from-ingredients_serving']
                  as num?)
              ?.toDouble(),
      fruitsVegetablesNutsEstimateFromIngredients100g:
          (json['fruits-vegetables-nuts-estimate-from-ingredients_100g']
                  as num?)
              ?.toDouble(),
      fruitsVegetablesNutsEstimateFromIngredientsServing:
          (json['fruits-vegetables-nuts-estimate-from-ingredients_serving']
                  as num?)
              ?.toDouble(),
      novaGroup: (json['nova-group'] as num?)?.toDouble(),
      novaGroup100g: (json['nova-group_100g'] as num?)?.toDouble(),
      novaGroupServing: (json['nova-group_serving'] as num?)?.toDouble(),
      nutritionScoreFr: (json['nutrition-score-fr'] as num?)?.toDouble(),
      nutritionScoreFr100g:
          (json['nutrition-score-fr_100g'] as num?)?.toDouble(),
      proteins: (json['proteins'] as num?)?.toDouble(),
      proteins100g: (json['proteins_100g'] as num?)?.toDouble(),
      proteinsUnit: json['proteins_unit'] as String?,
      proteinsValue: (json['proteins_value'] as num?)?.toDouble(),
      salt: (json['salt'] as num?)?.toDouble(),
      salt100g: (json['salt_100g'] as num?)?.toDouble(),
      saltUnit: json['salt_unit'] as String?,
      saltValue: (json['salt_value'] as num?)?.toDouble(),
      saturatedFat: (json['saturated-fat'] as num?)?.toDouble(),
      saturatedFat100g: (json['saturated-fat_100g'] as num?)?.toDouble(),
      saturatedFatUnit: json['saturated-fat_unit'] as String?,
      saturatedFatValue: (json['saturated-fat_value'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      sodium100g: (json['sodium_100g'] as num?)?.toDouble(),
      sodiumUnit: json['sodium_unit'] as String?,
      sodiumValue: (json['sodium_value'] as num?)?.toDouble(),
      sugars: (json['sugars'] as num?)?.toDouble(),
      sugars100g: (json['sugars_100g'] as num?)?.toDouble(),
      sugarsUnit: json['sugars_unit'] as String?,
      sugarsValue: (json['sugars_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NutrimentsToJson(Nutriments instance) =>
    <String, dynamic>{
      'carbohydrates': instance.carbohydrates,
      'carbohydrates_100g': instance.carbohydrates100g,
      'carbohydrates_unit': instance.carbohydratesUnit,
      'carbohydrates_value': instance.carbohydratesValue,
      'energy': instance.energy,
      'energy-kcal': instance.energyKcal,
      'energy-kcal_100g': instance.energyKcal100g,
      'energy-kcal_unit': instance.energyKcalUnit,
      'energy-kcal_value': instance.energyKcalValue,
      'energy-kcal_value_computed': instance.energyKcalValueComputed,
      'energy_100g': instance.energy100g,
      'energy_unit': instance.energyUnit,
      'energy_value': instance.energyValue,
      'fat': instance.fat,
      'fat_100g': instance.fat100g,
      'fat_unit': instance.fatUnit,
      'fat_value': instance.fatValue,
      'fruits-vegetables-legumes-estimate-from-ingredients_100g':
          instance.fruitsVegetablesLegumesEstimateFromIngredients100g,
      'fruits-vegetables-legumes-estimate-from-ingredients_serving':
          instance.fruitsVegetablesLegumesEstimateFromIngredientsServing,
      'fruits-vegetables-nuts-estimate-from-ingredients_100g':
          instance.fruitsVegetablesNutsEstimateFromIngredients100g,
      'fruits-vegetables-nuts-estimate-from-ingredients_serving':
          instance.fruitsVegetablesNutsEstimateFromIngredientsServing,
      'nova-group': instance.novaGroup,
      'nova-group_100g': instance.novaGroup100g,
      'nova-group_serving': instance.novaGroupServing,
      'nutrition-score-fr': instance.nutritionScoreFr,
      'nutrition-score-fr_100g': instance.nutritionScoreFr100g,
      'proteins': instance.proteins,
      'proteins_100g': instance.proteins100g,
      'proteins_unit': instance.proteinsUnit,
      'proteins_value': instance.proteinsValue,
      'salt': instance.salt,
      'salt_100g': instance.salt100g,
      'salt_unit': instance.saltUnit,
      'salt_value': instance.saltValue,
      'saturated-fat': instance.saturatedFat,
      'saturated-fat_100g': instance.saturatedFat100g,
      'saturated-fat_unit': instance.saturatedFatUnit,
      'saturated-fat_value': instance.saturatedFatValue,
      'sodium': instance.sodium,
      'sodium_100g': instance.sodium100g,
      'sodium_unit': instance.sodiumUnit,
      'sodium_value': instance.sodiumValue,
      'sugars': instance.sugars,
      'sugars_100g': instance.sugars100g,
      'sugars_unit': instance.sugarsUnit,
      'sugars_value': instance.sugarsValue,
    };

NutriScoreData _$NutriScoreDataFromJson(Map<String, dynamic> json) =>
    NutriScoreData(
      energy: (json['energy'] as num?)?.toDouble(),
      energyPoints: (json['energy_points'] as num?)?.toDouble(),
      energyValue: (json['energy_value'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      fiberPoints: (json['fiber_points'] as num?)?.toDouble(),
      fiberValue: (json['fiber_value'] as num?)?.toDouble(),
      fruitsVegetablesNutsColzaWalnutOliveOils:
          (json['fruits_vegetables_nuts_colza_walnut_olive_oils'] as num?)
              ?.toDouble(),
      fruitsVegetablesNutsColzaWalnutOliveOilsPoints:
          (json['fruits_vegetables_nuts_colza_walnut_olive_oils_points']
                  as num?)
              ?.toDouble(),
      fruitsVegetablesNutsColzaWalnutOliveOilsValue:
          (json['fruits_vegetables_nuts_colza_walnut_olive_oils_value'] as num?)
              ?.toDouble(),
      grade: json['grade'] as String?,
      isBeverage: (json['is_beverage'] as num?)?.toDouble(),
      isCheese: (json['is_cheese'] as num?)?.toDouble(),
      isFat: (json['is_fat'] as num?)?.toDouble(),
      isWater: (json['is_water'] as num?)?.toDouble(),
      negativePoints: (json['negative_points'] as num?)?.toDouble(),
      positivePoints: (json['positive_points'] as num?)?.toDouble(),
      proteins: (json['proteins'] as num?)?.toDouble(),
      proteinsPoints: (json['proteins_points'] as num?)?.toDouble(),
      proteinsValue: (json['proteins_value'] as num?)?.toDouble(),
      saturatedFat: (json['saturated_fat'] as num?)?.toDouble(),
      saturatedFatPoints: (json['saturated_fat_points'] as num?)?.toDouble(),
      saturatedFatValue: (json['saturated_fat_value'] as num?)?.toDouble(),
      score: (json['score'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      sodiumPoints: (json['sodium_points'] as num?)?.toDouble(),
      sodiumValue: (json['sodium_value'] as num?)?.toDouble(),
      sugars: (json['sugars'] as num?)?.toDouble(),
      sugarsPoints: (json['sugars_points'] as num?)?.toDouble(),
      sugarsValue: (json['sugars_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NutriScoreDataToJson(NutriScoreData instance) =>
    <String, dynamic>{
      'energy': instance.energy,
      'energy_points': instance.energyPoints,
      'energy_value': instance.energyValue,
      'fiber': instance.fiber,
      'fiber_points': instance.fiberPoints,
      'fiber_value': instance.fiberValue,
      'fruits_vegetables_nuts_colza_walnut_olive_oils':
          instance.fruitsVegetablesNutsColzaWalnutOliveOils,
      'fruits_vegetables_nuts_colza_walnut_olive_oils_points':
          instance.fruitsVegetablesNutsColzaWalnutOliveOilsPoints,
      'fruits_vegetables_nuts_colza_walnut_olive_oils_value':
          instance.fruitsVegetablesNutsColzaWalnutOliveOilsValue,
      'grade': instance.grade,
      'is_beverage': instance.isBeverage,
      'is_cheese': instance.isCheese,
      'is_fat': instance.isFat,
      'is_water': instance.isWater,
      'negative_points': instance.negativePoints,
      'positive_points': instance.positivePoints,
      'proteins': instance.proteins,
      'proteins_points': instance.proteinsPoints,
      'proteins_value': instance.proteinsValue,
      'saturated_fat': instance.saturatedFat,
      'saturated_fat_points': instance.saturatedFatPoints,
      'saturated_fat_value': instance.saturatedFatValue,
      'score': instance.score,
      'sodium': instance.sodium,
      'sodium_points': instance.sodiumPoints,
      'sodium_value': instance.sodiumValue,
      'sugars': instance.sugars,
      'sugars_points': instance.sugarsPoints,
      'sugars_value': instance.sugarsValue,
    };
