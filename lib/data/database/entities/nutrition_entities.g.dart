// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_entities.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNutritionCollection on Isar {
  IsarCollection<Nutrition> get nutritions => this.collection();
}

const NutritionSchema = CollectionSchema(
  name: r'Nutrition',
  id: 7179252175094545754,
  properties: {
    r'calcium': PropertySchema(
      id: 0,
      name: r'calcium',
      type: IsarType.long,
    ),
    r'calories': PropertySchema(
      id: 1,
      name: r'calories',
      type: IsarType.long,
    ),
    r'carbohydrates': PropertySchema(
      id: 2,
      name: r'carbohydrates',
      type: IsarType.long,
    ),
    r'dailyFoodReport': PropertySchema(
      id: 3,
      name: r'dailyFoodReport',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 4,
      name: r'date',
      type: IsarType.string,
    ),
    r'exerciseCalories': PropertySchema(
      id: 5,
      name: r'exerciseCalories',
      type: IsarType.string,
    ),
    r'fat': PropertySchema(
      id: 6,
      name: r'fat',
      type: IsarType.long,
    ),
    r'fiber': PropertySchema(
      id: 7,
      name: r'fiber',
      type: IsarType.long,
    ),
    r'magnesium': PropertySchema(
      id: 8,
      name: r'magnesium',
      type: IsarType.long,
    ),
    r'potassium': PropertySchema(
      id: 9,
      name: r'potassium',
      type: IsarType.long,
    ),
    r'protein': PropertySchema(
      id: 10,
      name: r'protein',
      type: IsarType.long,
    ),
    r'sodium': PropertySchema(
      id: 11,
      name: r'sodium',
      type: IsarType.long,
    ),
    r'sugar': PropertySchema(
      id: 12,
      name: r'sugar',
      type: IsarType.long,
    ),
    r'targetCalcium': PropertySchema(
      id: 13,
      name: r'targetCalcium',
      type: IsarType.long,
    ),
    r'targetCalories': PropertySchema(
      id: 14,
      name: r'targetCalories',
      type: IsarType.long,
    ),
    r'targetCarbohydrates': PropertySchema(
      id: 15,
      name: r'targetCarbohydrates',
      type: IsarType.long,
    ),
    r'targetFat': PropertySchema(
      id: 16,
      name: r'targetFat',
      type: IsarType.long,
    ),
    r'targetFiber': PropertySchema(
      id: 17,
      name: r'targetFiber',
      type: IsarType.long,
    ),
    r'targetMagnesium': PropertySchema(
      id: 18,
      name: r'targetMagnesium',
      type: IsarType.long,
    ),
    r'targetPotassium': PropertySchema(
      id: 19,
      name: r'targetPotassium',
      type: IsarType.long,
    ),
    r'targetProtein': PropertySchema(
      id: 20,
      name: r'targetProtein',
      type: IsarType.long,
    ),
    r'targetSodium': PropertySchema(
      id: 21,
      name: r'targetSodium',
      type: IsarType.long,
    ),
    r'targetSugar': PropertySchema(
      id: 22,
      name: r'targetSugar',
      type: IsarType.long,
    ),
    r'targetWater': PropertySchema(
      id: 23,
      name: r'targetWater',
      type: IsarType.long,
    ),
    r'water': PropertySchema(
      id: 24,
      name: r'water',
      type: IsarType.long,
    )
  },
  estimateSize: _nutritionEstimateSize,
  serialize: _nutritionSerialize,
  deserialize: _nutritionDeserialize,
  deserializeProp: _nutritionDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nutritionGetId,
  getLinks: _nutritionGetLinks,
  attach: _nutritionAttach,
  version: '3.1.0+1',
);

int _nutritionEstimateSize(
  Nutrition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dailyFoodReport;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.exerciseCalories;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nutritionSerialize(
  Nutrition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calcium);
  writer.writeLong(offsets[1], object.calories);
  writer.writeLong(offsets[2], object.carbohydrates);
  writer.writeString(offsets[3], object.dailyFoodReport);
  writer.writeString(offsets[4], object.date);
  writer.writeString(offsets[5], object.exerciseCalories);
  writer.writeLong(offsets[6], object.fat);
  writer.writeLong(offsets[7], object.fiber);
  writer.writeLong(offsets[8], object.magnesium);
  writer.writeLong(offsets[9], object.potassium);
  writer.writeLong(offsets[10], object.protein);
  writer.writeLong(offsets[11], object.sodium);
  writer.writeLong(offsets[12], object.sugar);
  writer.writeLong(offsets[13], object.targetCalcium);
  writer.writeLong(offsets[14], object.targetCalories);
  writer.writeLong(offsets[15], object.targetCarbohydrates);
  writer.writeLong(offsets[16], object.targetFat);
  writer.writeLong(offsets[17], object.targetFiber);
  writer.writeLong(offsets[18], object.targetMagnesium);
  writer.writeLong(offsets[19], object.targetPotassium);
  writer.writeLong(offsets[20], object.targetProtein);
  writer.writeLong(offsets[21], object.targetSodium);
  writer.writeLong(offsets[22], object.targetSugar);
  writer.writeLong(offsets[23], object.targetWater);
  writer.writeLong(offsets[24], object.water);
}

Nutrition _nutritionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Nutrition();
  object.calcium = reader.readLong(offsets[0]);
  object.calories = reader.readLong(offsets[1]);
  object.carbohydrates = reader.readLong(offsets[2]);
  object.dailyFoodReport = reader.readStringOrNull(offsets[3]);
  object.date = reader.readStringOrNull(offsets[4]);
  object.exerciseCalories = reader.readStringOrNull(offsets[5]);
  object.fat = reader.readLong(offsets[6]);
  object.fiber = reader.readLong(offsets[7]);
  object.id = id;
  object.magnesium = reader.readLong(offsets[8]);
  object.potassium = reader.readLong(offsets[9]);
  object.protein = reader.readLong(offsets[10]);
  object.sodium = reader.readLong(offsets[11]);
  object.sugar = reader.readLong(offsets[12]);
  object.targetCalcium = reader.readLong(offsets[13]);
  object.targetCalories = reader.readLong(offsets[14]);
  object.targetCarbohydrates = reader.readLong(offsets[15]);
  object.targetFat = reader.readLong(offsets[16]);
  object.targetFiber = reader.readLong(offsets[17]);
  object.targetMagnesium = reader.readLong(offsets[18]);
  object.targetPotassium = reader.readLong(offsets[19]);
  object.targetProtein = reader.readLong(offsets[20]);
  object.targetSodium = reader.readLong(offsets[21]);
  object.targetSugar = reader.readLong(offsets[22]);
  object.targetWater = reader.readLong(offsets[23]);
  object.water = reader.readLong(offsets[24]);
  return object;
}

P _nutritionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nutritionGetId(Nutrition object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nutritionGetLinks(Nutrition object) {
  return [];
}

void _nutritionAttach(IsarCollection<dynamic> col, Id id, Nutrition object) {
  object.id = id;
}

extension NutritionByIndex on IsarCollection<Nutrition> {
  Future<Nutrition?> getByDate(String? date) {
    return getByIndex(r'date', [date]);
  }

  Nutrition? getByDateSync(String? date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(String? date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(String? date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<Nutrition?>> getAllByDate(List<String?> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<Nutrition?> getAllByDateSync(List<String?> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<String?> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<String?> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(Nutrition object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(Nutrition object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<Nutrition> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<Nutrition> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension NutritionQueryWhereSort
    on QueryBuilder<Nutrition, Nutrition, QWhere> {
  QueryBuilder<Nutrition, Nutrition, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NutritionQueryWhere
    on QueryBuilder<Nutrition, Nutrition, QWhereClause> {
  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [null],
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> dateEqualTo(
      String? date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterWhereClause> dateNotEqualTo(
      String? date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NutritionQueryFilter
    on QueryBuilder<Nutrition, Nutrition, QFilterCondition> {
  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> calciumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> calciumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> calciumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> calciumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calcium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> caloriesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> caloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> caloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> caloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      carbohydratesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      carbohydratesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      carbohydratesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      carbohydratesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyFoodReport',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyFoodReport',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyFoodReport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyFoodReport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyFoodReport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyFoodReport',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dailyFoodReport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dailyFoodReport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dailyFoodReport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dailyFoodReport',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyFoodReport',
        value: '',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      dailyFoodReportIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dailyFoodReport',
        value: '',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exerciseCalories',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exerciseCalories',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseCalories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseCalories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseCalories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseCalories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseCalories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseCalories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseCalories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseCalories',
        value: '',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      exerciseCaloriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseCalories',
        value: '',
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fatEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fiberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fiberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fiberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> fiberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> magnesiumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'magnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      magnesiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'magnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> magnesiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'magnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> magnesiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'magnesium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> potassiumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'potassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      potassiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'potassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> potassiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'potassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> potassiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'potassium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> proteinEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> proteinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> proteinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> proteinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sodiumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sodiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sodiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sodiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sodium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sugarEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sugarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sugarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> sugarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCalciumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCalciumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCalciumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCalciumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCalcium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCaloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCaloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCaloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCaloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCarbohydratesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCarbohydratesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCarbohydratesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetCarbohydratesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCarbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetFatEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetFatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetFatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetFatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetFiberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetFiberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetFiberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetFiberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetFiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetMagnesiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetMagnesiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetMagnesiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetMagnesiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetMagnesium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetPotassiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetPotassiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetPotassiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetPotassiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPotassium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetProteinEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetProteinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetProteinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetProteinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetSodiumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetSodiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetSodiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetSodiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetSodium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetSugarEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetSugarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetSugarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetSugarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetSugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetWaterEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition>
      targetWaterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetWaterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> targetWaterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetWater',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> waterEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'water',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> waterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'water',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> waterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'water',
        value: value,
      ));
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterFilterCondition> waterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'water',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NutritionQueryObject
    on QueryBuilder<Nutrition, Nutrition, QFilterCondition> {}

extension NutritionQueryLinks
    on QueryBuilder<Nutrition, Nutrition, QFilterCondition> {}

extension NutritionQuerySortBy on QueryBuilder<Nutrition, Nutrition, QSortBy> {
  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calcium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calcium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByDailyFoodReport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyFoodReport', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByDailyFoodReportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyFoodReport', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByExerciseCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCalories', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy>
      sortByExerciseCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCalories', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'magnesium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'magnesium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potassium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potassium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortBySodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sodium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortBySodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sodium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortBySugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugar', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortBySugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugar', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy>
      sortByTargetCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByTargetWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> sortByWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.desc);
    });
  }
}

extension NutritionQuerySortThenBy
    on QueryBuilder<Nutrition, Nutrition, QSortThenBy> {
  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calcium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calcium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByDailyFoodReport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyFoodReport', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByDailyFoodReportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyFoodReport', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByExerciseCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCalories', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy>
      thenByExerciseCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCalories', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'magnesium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'magnesium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potassium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potassium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenBySodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sodium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenBySodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sodium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenBySugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugar', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenBySugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugar', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy>
      thenByTargetCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByTargetWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.desc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.asc);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QAfterSortBy> thenByWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.desc);
    });
  }
}

extension NutritionQueryWhereDistinct
    on QueryBuilder<Nutrition, Nutrition, QDistinct> {
  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calcium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbohydrates');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByDailyFoodReport(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyFoodReport',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByExerciseCalories(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseCalories',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fat');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiber');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'magnesium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'potassium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protein');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctBySodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sodium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctBySugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sugar');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalcium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalories');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct>
      distinctByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCarbohydrates');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFat');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFiber');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetMagnesium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPotassium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetProtein');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSodium');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSugar');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetWater');
    });
  }

  QueryBuilder<Nutrition, Nutrition, QDistinct> distinctByWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'water');
    });
  }
}

extension NutritionQueryProperty
    on QueryBuilder<Nutrition, Nutrition, QQueryProperty> {
  QueryBuilder<Nutrition, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> calciumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calcium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> carbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbohydrates');
    });
  }

  QueryBuilder<Nutrition, String?, QQueryOperations> dailyFoodReportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyFoodReport');
    });
  }

  QueryBuilder<Nutrition, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Nutrition, String?, QQueryOperations>
      exerciseCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseCalories');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> fatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fat');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> fiberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiber');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> magnesiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'magnesium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> potassiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'potassium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> proteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protein');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> sodiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sodium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> sugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sugar');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetCalciumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalcium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalories');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetCarbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCarbohydrates');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFat');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetFiberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFiber');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetMagnesiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetMagnesium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetPotassiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPotassium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetProtein');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetSodiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSodium');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetSugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSugar');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> targetWaterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetWater');
    });
  }

  QueryBuilder<Nutrition, int, QQueryOperations> waterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'water');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNutritionGoalCollection on Isar {
  IsarCollection<NutritionGoal> get nutritionGoals => this.collection();
}

const NutritionGoalSchema = CollectionSchema(
  name: r'NutritionGoal',
  id: -6176738821382431484,
  properties: {
    r'targetCalcium': PropertySchema(
      id: 0,
      name: r'targetCalcium',
      type: IsarType.long,
    ),
    r'targetCalories': PropertySchema(
      id: 1,
      name: r'targetCalories',
      type: IsarType.long,
    ),
    r'targetCarbohydrates': PropertySchema(
      id: 2,
      name: r'targetCarbohydrates',
      type: IsarType.long,
    ),
    r'targetFat': PropertySchema(
      id: 3,
      name: r'targetFat',
      type: IsarType.long,
    ),
    r'targetFiber': PropertySchema(
      id: 4,
      name: r'targetFiber',
      type: IsarType.long,
    ),
    r'targetMagnesium': PropertySchema(
      id: 5,
      name: r'targetMagnesium',
      type: IsarType.long,
    ),
    r'targetPotassium': PropertySchema(
      id: 6,
      name: r'targetPotassium',
      type: IsarType.long,
    ),
    r'targetProtein': PropertySchema(
      id: 7,
      name: r'targetProtein',
      type: IsarType.long,
    ),
    r'targetSodium': PropertySchema(
      id: 8,
      name: r'targetSodium',
      type: IsarType.long,
    ),
    r'targetSugar': PropertySchema(
      id: 9,
      name: r'targetSugar',
      type: IsarType.long,
    ),
    r'targetWater': PropertySchema(
      id: 10,
      name: r'targetWater',
      type: IsarType.long,
    ),
    r'uniqueId': PropertySchema(
      id: 11,
      name: r'uniqueId',
      type: IsarType.string,
    )
  },
  estimateSize: _nutritionGoalEstimateSize,
  serialize: _nutritionGoalSerialize,
  deserialize: _nutritionGoalDeserialize,
  deserializeProp: _nutritionGoalDeserializeProp,
  idName: r'id',
  indexes: {
    r'uniqueId': IndexSchema(
      id: -6275468996282682414,
      name: r'uniqueId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uniqueId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nutritionGoalGetId,
  getLinks: _nutritionGoalGetLinks,
  attach: _nutritionGoalAttach,
  version: '3.1.0+1',
);

int _nutritionGoalEstimateSize(
  NutritionGoal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.uniqueId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nutritionGoalSerialize(
  NutritionGoal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.targetCalcium);
  writer.writeLong(offsets[1], object.targetCalories);
  writer.writeLong(offsets[2], object.targetCarbohydrates);
  writer.writeLong(offsets[3], object.targetFat);
  writer.writeLong(offsets[4], object.targetFiber);
  writer.writeLong(offsets[5], object.targetMagnesium);
  writer.writeLong(offsets[6], object.targetPotassium);
  writer.writeLong(offsets[7], object.targetProtein);
  writer.writeLong(offsets[8], object.targetSodium);
  writer.writeLong(offsets[9], object.targetSugar);
  writer.writeLong(offsets[10], object.targetWater);
  writer.writeString(offsets[11], object.uniqueId);
}

NutritionGoal _nutritionGoalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutritionGoal(
    uniqueId: reader.readStringOrNull(offsets[11]),
  );
  object.id = id;
  object.targetCalcium = reader.readLong(offsets[0]);
  object.targetCalories = reader.readLong(offsets[1]);
  object.targetCarbohydrates = reader.readLong(offsets[2]);
  object.targetFat = reader.readLong(offsets[3]);
  object.targetFiber = reader.readLong(offsets[4]);
  object.targetMagnesium = reader.readLong(offsets[5]);
  object.targetPotassium = reader.readLong(offsets[6]);
  object.targetProtein = reader.readLong(offsets[7]);
  object.targetSodium = reader.readLong(offsets[8]);
  object.targetSugar = reader.readLong(offsets[9]);
  object.targetWater = reader.readLong(offsets[10]);
  return object;
}

P _nutritionGoalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nutritionGoalGetId(NutritionGoal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nutritionGoalGetLinks(NutritionGoal object) {
  return [];
}

void _nutritionGoalAttach(
    IsarCollection<dynamic> col, Id id, NutritionGoal object) {
  object.id = id;
}

extension NutritionGoalByIndex on IsarCollection<NutritionGoal> {
  Future<NutritionGoal?> getByUniqueId(String? uniqueId) {
    return getByIndex(r'uniqueId', [uniqueId]);
  }

  NutritionGoal? getByUniqueIdSync(String? uniqueId) {
    return getByIndexSync(r'uniqueId', [uniqueId]);
  }

  Future<bool> deleteByUniqueId(String? uniqueId) {
    return deleteByIndex(r'uniqueId', [uniqueId]);
  }

  bool deleteByUniqueIdSync(String? uniqueId) {
    return deleteByIndexSync(r'uniqueId', [uniqueId]);
  }

  Future<List<NutritionGoal?>> getAllByUniqueId(List<String?> uniqueIdValues) {
    final values = uniqueIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'uniqueId', values);
  }

  List<NutritionGoal?> getAllByUniqueIdSync(List<String?> uniqueIdValues) {
    final values = uniqueIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uniqueId', values);
  }

  Future<int> deleteAllByUniqueId(List<String?> uniqueIdValues) {
    final values = uniqueIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uniqueId', values);
  }

  int deleteAllByUniqueIdSync(List<String?> uniqueIdValues) {
    final values = uniqueIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uniqueId', values);
  }

  Future<Id> putByUniqueId(NutritionGoal object) {
    return putByIndex(r'uniqueId', object);
  }

  Id putByUniqueIdSync(NutritionGoal object, {bool saveLinks = true}) {
    return putByIndexSync(r'uniqueId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUniqueId(List<NutritionGoal> objects) {
    return putAllByIndex(r'uniqueId', objects);
  }

  List<Id> putAllByUniqueIdSync(List<NutritionGoal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uniqueId', objects, saveLinks: saveLinks);
  }
}

extension NutritionGoalQueryWhereSort
    on QueryBuilder<NutritionGoal, NutritionGoal, QWhere> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NutritionGoalQueryWhere
    on QueryBuilder<NutritionGoal, NutritionGoal, QWhereClause> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause>
      uniqueIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uniqueId',
        value: [null],
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause>
      uniqueIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uniqueId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> uniqueIdEqualTo(
      String? uniqueId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uniqueId',
        value: [uniqueId],
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause>
      uniqueIdNotEqualTo(String? uniqueId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uniqueId',
              lower: [],
              upper: [uniqueId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uniqueId',
              lower: [uniqueId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uniqueId',
              lower: [uniqueId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uniqueId',
              lower: [],
              upper: [uniqueId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NutritionGoalQueryFilter
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCalciumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCalciumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCalciumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCalciumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCalcium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbohydratesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbohydratesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbohydratesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbohydratesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCarbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFiberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFiberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFiberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFiberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetFiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetMagnesiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetMagnesiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetMagnesiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetMagnesiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetMagnesium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetPotassiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetPotassiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetPotassiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetPotassiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPotassium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSodiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSodiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSodiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSodiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetSodium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSugarEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSugarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSugarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetSugarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetSugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetWaterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetWaterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetWaterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetWaterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetWater',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uniqueId',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uniqueId',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uniqueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uniqueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uniqueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uniqueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uniqueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uniqueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uniqueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uniqueId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uniqueId',
        value: '',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      uniqueIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uniqueId',
        value: '',
      ));
    });
  }
}

extension NutritionGoalQueryObject
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {}

extension NutritionGoalQueryLinks
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {}

extension NutritionGoalQuerySortBy
    on QueryBuilder<NutritionGoal, NutritionGoal, QSortBy> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByUniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueId', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByUniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueId', Sort.desc);
    });
  }
}

extension NutritionGoalQuerySortThenBy
    on QueryBuilder<NutritionGoal, NutritionGoal, QSortThenBy> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByUniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueId', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByUniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueId', Sort.desc);
    });
  }
}

extension NutritionGoalQueryWhereDistinct
    on QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> {
  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalcium');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalories');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCarbohydrates');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFat');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFiber');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetMagnesium');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPotassium');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetProtein');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSodium');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSugar');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetWater');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByUniqueId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uniqueId', caseSensitive: caseSensitive);
    });
  }
}

extension NutritionGoalQueryProperty
    on QueryBuilder<NutritionGoal, NutritionGoal, QQueryProperty> {
  QueryBuilder<NutritionGoal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetCalciumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalcium');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalories');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations>
      targetCarbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCarbohydrates');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFat');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetFiberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFiber');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetMagnesiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetMagnesium');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetPotassiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPotassium');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetProtein');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetSodiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSodium');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetSugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSugar');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetWaterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetWater');
    });
  }

  QueryBuilder<NutritionGoal, String?, QQueryOperations> uniqueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uniqueId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNutritionUploadStatusCollection on Isar {
  IsarCollection<NutritionUploadStatus> get nutritionUploadStatus =>
      this.collection();
}

const NutritionUploadStatusSchema = CollectionSchema(
  name: r'NutritionUploadStatus',
  id: 1829171160786485809,
  properties: {
    r'userId': PropertySchema(
      id: 0,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _nutritionUploadStatusEstimateSize,
  serialize: _nutritionUploadStatusSerialize,
  deserialize: _nutritionUploadStatusDeserialize,
  deserializeProp: _nutritionUploadStatusDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nutritionUploadStatusGetId,
  getLinks: _nutritionUploadStatusGetLinks,
  attach: _nutritionUploadStatusAttach,
  version: '3.1.0+1',
);

int _nutritionUploadStatusEstimateSize(
  NutritionUploadStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nutritionUploadStatusSerialize(
  NutritionUploadStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.userId);
}

NutritionUploadStatus _nutritionUploadStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutritionUploadStatus();
  object.id = id;
  object.userId = reader.readStringOrNull(offsets[0]);
  return object;
}

P _nutritionUploadStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nutritionUploadStatusGetId(NutritionUploadStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nutritionUploadStatusGetLinks(
    NutritionUploadStatus object) {
  return [];
}

void _nutritionUploadStatusAttach(
    IsarCollection<dynamic> col, Id id, NutritionUploadStatus object) {
  object.id = id;
}

extension NutritionUploadStatusByIndex
    on IsarCollection<NutritionUploadStatus> {
  Future<NutritionUploadStatus?> getByUserId(String? userId) {
    return getByIndex(r'userId', [userId]);
  }

  NutritionUploadStatus? getByUserIdSync(String? userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String? userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String? userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<NutritionUploadStatus?>> getAllByUserId(
      List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<NutritionUploadStatus?> getAllByUserIdSync(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(NutritionUploadStatus object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(NutritionUploadStatus object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<NutritionUploadStatus> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<NutritionUploadStatus> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension NutritionUploadStatusQueryWhereSort
    on QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QWhere> {
  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NutritionUploadStatusQueryWhere on QueryBuilder<NutritionUploadStatus,
    NutritionUploadStatus, QWhereClause> {
  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      userIdEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterWhereClause>
      userIdNotEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NutritionUploadStatusQueryFilter on QueryBuilder<
    NutritionUploadStatus, NutritionUploadStatus, QFilterCondition> {
  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension NutritionUploadStatusQueryObject on QueryBuilder<
    NutritionUploadStatus, NutritionUploadStatus, QFilterCondition> {}

extension NutritionUploadStatusQueryLinks on QueryBuilder<NutritionUploadStatus,
    NutritionUploadStatus, QFilterCondition> {}

extension NutritionUploadStatusQuerySortBy
    on QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QSortBy> {
  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension NutritionUploadStatusQuerySortThenBy
    on QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QSortThenBy> {
  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension NutritionUploadStatusQueryWhereDistinct
    on QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QDistinct> {
  QueryBuilder<NutritionUploadStatus, NutritionUploadStatus, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension NutritionUploadStatusQueryProperty on QueryBuilder<
    NutritionUploadStatus, NutritionUploadStatus, QQueryProperty> {
  QueryBuilder<NutritionUploadStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NutritionUploadStatus, String?, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
