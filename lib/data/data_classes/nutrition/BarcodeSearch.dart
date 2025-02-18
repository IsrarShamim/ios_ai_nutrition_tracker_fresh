import 'package:json_annotation/json_annotation.dart';

part 'BarcodeSearch.g.dart';

@JsonSerializable()
class OpenFoodFactsProduct {
  final String? code;
  final ProductDetails? product;
  final double? status;
  @JsonKey(name: 'status_verbose')
  final String? statusVerbose;

  OpenFoodFactsProduct({
    this.code,
    this.product,
    this.status,
    this.statusVerbose,
  });

  factory OpenFoodFactsProduct.fromJson(Map<String, dynamic> json) =>
      _$OpenFoodFactsProductFromJson(json);

  Map<String, dynamic> toJson() => _$OpenFoodFactsProductToJson(this);
}

@JsonSerializable()
class ProductDetails {
  final String? allergens;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'ingredients_analysis')
  final Map<String, List<String>>? ingredientsAnalysis;
  @JsonKey(name: 'nutrient_levels')
  final Map<String, String>? nutrientLevels;
  final Nutriments? nutriments;
  @JsonKey(name: 'nutriscore_data')
  final NutriScoreData? nutriscoreData;
  @JsonKey(name: 'product_name')
  final String? productName;
  final List<Ingredient>? ingredients; // <-- Added ingredients field

  ProductDetails({
    this.allergens,
    this.imageUrl,
    this.ingredientsAnalysis,
    this.nutrientLevels,
    this.nutriments,
    this.nutriscoreData,
    this.productName,
    this.ingredients,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}

@JsonSerializable()
class Ingredient {
  @JsonKey(name: 'ciqual_proxy_food_code')
  final String? ciqualProxyFoodCode;
  final String? id;
  @JsonKey(name: 'percent_estimate')
  final double? percentEstimate;
  @JsonKey(name: 'percent_max')
  final double? percentMax;
  @JsonKey(name: 'percent_min')
  final double? percentMin;
  final String? text;
  final String? vegan;
  final String? vegetarian;
  @JsonKey(name: 'ciqual_food_code')
  final String? ciqualFoodCode;
  @JsonKey(name: 'from_palm_oil')
  final String? fromPalmOil;

  Ingredient({
    this.ciqualProxyFoodCode,
    this.id,
    this.percentEstimate,
    this.percentMax,
    this.percentMin,
    this.text,
    this.vegan,
    this.vegetarian,
    this.ciqualFoodCode,
    this.fromPalmOil,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Nutriments {
  final double? carbohydrates;
  @JsonKey(name: 'carbohydrates_100g')
  final double? carbohydrates100g;
  @JsonKey(name: 'carbohydrates_unit')
  final String? carbohydratesUnit;
  @JsonKey(name: 'carbohydrates_value')
  final double? carbohydratesValue;
  final double? energy;
  @JsonKey(name: 'energy-kcal')
  final double? energyKcal;
  @JsonKey(name: 'energy-kcal_100g')
  final double? energyKcal100g;
  @JsonKey(name: 'energy-kcal_unit')
  final String? energyKcalUnit;
  @JsonKey(name: 'energy-kcal_value')
  final double? energyKcalValue;
  @JsonKey(name: 'energy-kcal_value_computed')
  final double? energyKcalValueComputed;
  @JsonKey(name: 'energy_100g')
  final double? energy100g;
  @JsonKey(name: 'energy_unit')
  final String? energyUnit;
  @JsonKey(name: 'energy_value')
  final double? energyValue;
  final double? fat;
  @JsonKey(name: 'fat_100g')
  final double? fat100g;
  @JsonKey(name: 'fat_unit')
  final String? fatUnit;
  @JsonKey(name: 'fat_value')
  final double? fatValue;
  @JsonKey(name: 'fruits-vegetables-legumes-estimate-from-ingredients_100g')
  final double? fruitsVegetablesLegumesEstimateFromIngredients100g;
  @JsonKey(name: 'fruits-vegetables-legumes-estimate-from-ingredients_serving')
  final double? fruitsVegetablesLegumesEstimateFromIngredientsServing;
  @JsonKey(name: 'fruits-vegetables-nuts-estimate-from-ingredients_100g')
  final double? fruitsVegetablesNutsEstimateFromIngredients100g;
  @JsonKey(name: 'fruits-vegetables-nuts-estimate-from-ingredients_serving')
  final double? fruitsVegetablesNutsEstimateFromIngredientsServing;
  @JsonKey(name: 'nova-group')
  final double? novaGroup;
  @JsonKey(name: 'nova-group_100g')
  final double? novaGroup100g;
  @JsonKey(name: 'nova-group_serving')
  final double? novaGroupServing;
  @JsonKey(name: 'nutrition-score-fr')
  final double? nutritionScoreFr;
  @JsonKey(name: 'nutrition-score-fr_100g')
  final double? nutritionScoreFr100g;
  final double? proteins;
  @JsonKey(name: 'proteins_100g')
  final double? proteins100g;
  @JsonKey(name: 'proteins_unit')
  final String? proteinsUnit;
  @JsonKey(name: 'proteins_value')
  final double? proteinsValue;
  final double? salt;
  @JsonKey(name: 'salt_100g')
  final double? salt100g;
  @JsonKey(name: 'salt_unit')
  final String? saltUnit;
  @JsonKey(name: 'salt_value')
  final double? saltValue;
  @JsonKey(name: 'saturated-fat')
  final double? saturatedFat;
  @JsonKey(name: 'saturated-fat_100g')
  final double? saturatedFat100g;
  @JsonKey(name: 'saturated-fat_unit')
  final String? saturatedFatUnit;
  @JsonKey(name: 'saturated-fat_value')
  final double? saturatedFatValue;
  final double? sodium;
  @JsonKey(name: 'sodium_100g')
  final double? sodium100g;
  @JsonKey(name: 'sodium_unit')
  final String? sodiumUnit;
  @JsonKey(name: 'sodium_value')
  final double? sodiumValue;
  final double? sugars;
  @JsonKey(name: 'sugars_100g')
  final double? sugars100g;
  @JsonKey(name: 'sugars_unit')
  final String? sugarsUnit;
  @JsonKey(name: 'sugars_value')
  final double? sugarsValue;

  Nutriments({
    this.carbohydrates,
    this.carbohydrates100g,
    this.carbohydratesUnit,
    this.carbohydratesValue,
    this.energy,
    this.energyKcal,
    this.energyKcal100g,
    this.energyKcalUnit,
    this.energyKcalValue,
    this.energyKcalValueComputed,
    this.energy100g,
    this.energyUnit,
    this.energyValue,
    this.fat,
    this.fat100g,
    this.fatUnit,
    this.fatValue,
    this.fruitsVegetablesLegumesEstimateFromIngredients100g,
    this.fruitsVegetablesLegumesEstimateFromIngredientsServing,
    this.fruitsVegetablesNutsEstimateFromIngredients100g,
    this.fruitsVegetablesNutsEstimateFromIngredientsServing,
    this.novaGroup,
    this.novaGroup100g,
    this.novaGroupServing,
    this.nutritionScoreFr,
    this.nutritionScoreFr100g,
    this.proteins,
    this.proteins100g,
    this.proteinsUnit,
    this.proteinsValue,
    this.salt,
    this.salt100g,
    this.saltUnit,
    this.saltValue,
    this.saturatedFat,
    this.saturatedFat100g,
    this.saturatedFatUnit,
    this.saturatedFatValue,
    this.sodium,
    this.sodium100g,
    this.sodiumUnit,
    this.sodiumValue,
    this.sugars,
    this.sugars100g,
    this.sugarsUnit,
    this.sugarsValue,
  });

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsFromJson(json);

  Map<String, dynamic> toJson() => _$NutrimentsToJson(this);
}

@JsonSerializable()
class NutriScoreData {
  final double? energy;
  @JsonKey(name: 'energy_points')
  final double? energyPoints;
  @JsonKey(name: 'energy_value')
  final double? energyValue;
  final double? fiber;
  @JsonKey(name: 'fiber_points')
  final double? fiberPoints;
  @JsonKey(name: 'fiber_value')
  final double? fiberValue;
  @JsonKey(name: 'fruits_vegetables_nuts_colza_walnut_olive_oils')
  final double? fruitsVegetablesNutsColzaWalnutOliveOils;
  @JsonKey(name: 'fruits_vegetables_nuts_colza_walnut_olive_oils_points')
  final double? fruitsVegetablesNutsColzaWalnutOliveOilsPoints;
  @JsonKey(name: 'fruits_vegetables_nuts_colza_walnut_olive_oils_value')
  final double? fruitsVegetablesNutsColzaWalnutOliveOilsValue;
  final String? grade;
  @JsonKey(name: 'is_beverage')
  final double? isBeverage;
  @JsonKey(name: 'is_cheese')
  final double? isCheese;
  @JsonKey(name: 'is_fat')
  final double? isFat;
  @JsonKey(name: 'is_water')
  final double? isWater;
  @JsonKey(name: 'negative_points')
  final double? negativePoints;
  @JsonKey(name: 'positive_points')
  final double? positivePoints;
  final double? proteins;
  @JsonKey(name: 'proteins_points')
  final double? proteinsPoints;
  @JsonKey(name: 'proteins_value')
  final double? proteinsValue;
  @JsonKey(name: 'saturated_fat')
  final double? saturatedFat;
  @JsonKey(name: 'saturated_fat_points')
  final double? saturatedFatPoints;
  @JsonKey(name: 'saturated_fat_value')
  final double? saturatedFatValue;
  final double? score;
  final double? sodium;
  @JsonKey(name: 'sodium_points')
  final double? sodiumPoints;
  @JsonKey(name: 'sodium_value')
  final double? sodiumValue;
  final double? sugars;
  @JsonKey(name: 'sugars_points')
  final double? sugarsPoints;
  @JsonKey(name: 'sugars_value')
  final double? sugarsValue;

  NutriScoreData({
    this.energy,
    this.energyPoints,
    this.energyValue,
    this.fiber,
    this.fiberPoints,
    this.fiberValue,
    this.fruitsVegetablesNutsColzaWalnutOliveOils,
    this.fruitsVegetablesNutsColzaWalnutOliveOilsPoints,
    this.fruitsVegetablesNutsColzaWalnutOliveOilsValue,
    this.grade,
    this.isBeverage,
    this.isCheese,
    this.isFat,
    this.isWater,
    this.negativePoints,
    this.positivePoints,
    this.proteins,
    this.proteinsPoints,
    this.proteinsValue,
    this.saturatedFat,
    this.saturatedFatPoints,
    this.saturatedFatValue,
    this.score,
    this.sodium,
    this.sodiumPoints,
    this.sodiumValue,
    this.sugars,
    this.sugarsPoints,
    this.sugarsValue,
  });

  factory NutriScoreData.fromJson(Map<String, dynamic> json) =>
      _$NutriScoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$NutriScoreDataToJson(this);
}