// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchFood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodFromBarcode _$FoodFromBarcodeFromJson(Map<String, dynamic> json) =>
    FoodFromBarcode(
      food_id: FoodId.fromJson(json['food_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodFromBarcodeToJson(FoodFromBarcode instance) =>
    <String, dynamic>{
      'food_id': instance.food_id,
    };

FoodId _$FoodIdFromJson(Map<String, dynamic> json) => FoodId(
      value: json['value'] as String,
    );

Map<String, dynamic> _$FoodIdToJson(FoodId instance) => <String, dynamic>{
      'value': instance.value,
    };

FoodSearchResult _$FoodSearchResultFromJson(Map<String, dynamic> json) =>
    FoodSearchResult(
      foods: json['foods'] == null
          ? null
          : Foods.fromJson(json['foods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodSearchResultToJson(FoodSearchResult instance) =>
    <String, dynamic>{
      'foods': instance.foods,
    };

Foods _$FoodsFromJson(Map<String, dynamic> json) => Foods(
      food: (json['food'] as List<dynamic>?)
          ?.map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodsToJson(Foods instance) => <String, dynamic>{
      'food': instance.food,
    };

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) => FoodItem(
      food_name: json['food_name'] as String?,
      food_id: json['food_id'] as String?,
      food_description: json['food_description'] as String?,
      food_type: json['food_type'] as String?,
      food_url: json['food_url'] as String?,
    );

Map<String, dynamic> _$FoodItemToJson(FoodItem instance) => <String, dynamic>{
      'food_name': instance.food_name,
      'food_id': instance.food_id,
      'food_description': instance.food_description,
      'food_type': instance.food_type,
      'food_url': instance.food_url,
    };
