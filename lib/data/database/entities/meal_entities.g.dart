// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_entities.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealCollection on Isar {
  IsarCollection<Meal> get meals => this.collection();
}

const MealSchema = CollectionSchema(
  name: r'Meal',
  id: 2462895270179255875,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'exactMealAmount': PropertySchema(
      id: 1,
      name: r'exactMealAmount',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 2,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'mealCalcium': PropertySchema(
      id: 3,
      name: r'mealCalcium',
      type: IsarType.long,
    ),
    r'mealCalories': PropertySchema(
      id: 4,
      name: r'mealCalories',
      type: IsarType.long,
    ),
    r'mealCarbohydrates': PropertySchema(
      id: 5,
      name: r'mealCarbohydrates',
      type: IsarType.long,
    ),
    r'mealDescription': PropertySchema(
      id: 6,
      name: r'mealDescription',
      type: IsarType.string,
    ),
    r'mealFat': PropertySchema(
      id: 7,
      name: r'mealFat',
      type: IsarType.long,
    ),
    r'mealFiber': PropertySchema(
      id: 8,
      name: r'mealFiber',
      type: IsarType.long,
    ),
    r'mealId': PropertySchema(
      id: 9,
      name: r'mealId',
      type: IsarType.string,
    ),
    r'mealMagnesium': PropertySchema(
      id: 10,
      name: r'mealMagnesium',
      type: IsarType.long,
    ),
    r'mealPotassium': PropertySchema(
      id: 11,
      name: r'mealPotassium',
      type: IsarType.long,
    ),
    r'mealProtein': PropertySchema(
      id: 12,
      name: r'mealProtein',
      type: IsarType.long,
    ),
    r'mealSodium': PropertySchema(
      id: 13,
      name: r'mealSodium',
      type: IsarType.long,
    ),
    r'mealSugar': PropertySchema(
      id: 14,
      name: r'mealSugar',
      type: IsarType.long,
    ),
    r'mealWater': PropertySchema(
      id: 15,
      name: r'mealWater',
      type: IsarType.long,
    ),
    r'namesOfAlternateFoods': PropertySchema(
      id: 16,
      name: r'namesOfAlternateFoods',
      type: IsarType.string,
    ),
    r'namesOfPairFoods': PropertySchema(
      id: 17,
      name: r'namesOfPairFoods',
      type: IsarType.string,
    ),
    r'negatives': PropertySchema(
      id: 18,
      name: r'negatives',
      type: IsarType.string,
    ),
    r'nutritionalBrief': PropertySchema(
      id: 19,
      name: r'nutritionalBrief',
      type: IsarType.string,
    ),
    r'positives': PropertySchema(
      id: 20,
      name: r'positives',
      type: IsarType.string,
    ),
    r'reasonOfAlternateFoods': PropertySchema(
      id: 21,
      name: r'reasonOfAlternateFoods',
      type: IsarType.string,
    ),
    r'reasonsOfPairFoods': PropertySchema(
      id: 22,
      name: r'reasonsOfPairFoods',
      type: IsarType.string,
    ),
    r'timeOfThisMeal': PropertySchema(
      id: 23,
      name: r'timeOfThisMeal',
      type: IsarType.long,
    ),
    r'timeThisMealWasLogged': PropertySchema(
      id: 24,
      name: r'timeThisMealWasLogged',
      type: IsarType.string,
    ),
    r'vitaminsAndMineralsBrief': PropertySchema(
      id: 25,
      name: r'vitaminsAndMineralsBrief',
      type: IsarType.string,
    )
  },
  estimateSize: _mealEstimateSize,
  serialize: _mealSerialize,
  deserialize: _mealDeserialize,
  deserializeProp: _mealDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
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
  getId: _mealGetId,
  getLinks: _mealGetLinks,
  attach: _mealAttach,
  version: '3.1.0+1',
);

int _mealEstimateSize(
  Meal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.exactMealAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mealDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mealId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.namesOfAlternateFoods;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.namesOfPairFoods;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.negatives;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nutritionalBrief;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.positives;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reasonOfAlternateFoods;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reasonsOfPairFoods;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timeThisMealWasLogged;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vitaminsAndMineralsBrief;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mealSerialize(
  Meal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeString(offsets[1], object.exactMealAmount);
  writer.writeString(offsets[2], object.imageUrl);
  writer.writeLong(offsets[3], object.mealCalcium);
  writer.writeLong(offsets[4], object.mealCalories);
  writer.writeLong(offsets[5], object.mealCarbohydrates);
  writer.writeString(offsets[6], object.mealDescription);
  writer.writeLong(offsets[7], object.mealFat);
  writer.writeLong(offsets[8], object.mealFiber);
  writer.writeString(offsets[9], object.mealId);
  writer.writeLong(offsets[10], object.mealMagnesium);
  writer.writeLong(offsets[11], object.mealPotassium);
  writer.writeLong(offsets[12], object.mealProtein);
  writer.writeLong(offsets[13], object.mealSodium);
  writer.writeLong(offsets[14], object.mealSugar);
  writer.writeLong(offsets[15], object.mealWater);
  writer.writeString(offsets[16], object.namesOfAlternateFoods);
  writer.writeString(offsets[17], object.namesOfPairFoods);
  writer.writeString(offsets[18], object.negatives);
  writer.writeString(offsets[19], object.nutritionalBrief);
  writer.writeString(offsets[20], object.positives);
  writer.writeString(offsets[21], object.reasonOfAlternateFoods);
  writer.writeString(offsets[22], object.reasonsOfPairFoods);
  writer.writeLong(offsets[23], object.timeOfThisMeal);
  writer.writeString(offsets[24], object.timeThisMealWasLogged);
  writer.writeString(offsets[25], object.vitaminsAndMineralsBrief);
}

Meal _mealDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Meal();
  object.date = reader.readStringOrNull(offsets[0]);
  object.exactMealAmount = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[2]);
  object.mealCalcium = reader.readLong(offsets[3]);
  object.mealCalories = reader.readLong(offsets[4]);
  object.mealCarbohydrates = reader.readLong(offsets[5]);
  object.mealDescription = reader.readStringOrNull(offsets[6]);
  object.mealFat = reader.readLong(offsets[7]);
  object.mealFiber = reader.readLong(offsets[8]);
  object.mealId = reader.readStringOrNull(offsets[9]);
  object.mealMagnesium = reader.readLong(offsets[10]);
  object.mealPotassium = reader.readLong(offsets[11]);
  object.mealProtein = reader.readLong(offsets[12]);
  object.mealSodium = reader.readLong(offsets[13]);
  object.mealSugar = reader.readLong(offsets[14]);
  object.mealWater = reader.readLong(offsets[15]);
  object.namesOfAlternateFoods = reader.readStringOrNull(offsets[16]);
  object.namesOfPairFoods = reader.readStringOrNull(offsets[17]);
  object.negatives = reader.readStringOrNull(offsets[18]);
  object.nutritionalBrief = reader.readStringOrNull(offsets[19]);
  object.positives = reader.readStringOrNull(offsets[20]);
  object.reasonOfAlternateFoods = reader.readStringOrNull(offsets[21]);
  object.reasonsOfPairFoods = reader.readStringOrNull(offsets[22]);
  object.timeOfThisMeal = reader.readLongOrNull(offsets[23]);
  object.timeThisMealWasLogged = reader.readStringOrNull(offsets[24]);
  object.vitaminsAndMineralsBrief = reader.readStringOrNull(offsets[25]);
  return object;
}

P _mealDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
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
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mealGetId(Meal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealGetLinks(Meal object) {
  return [];
}

void _mealAttach(IsarCollection<dynamic> col, Id id, Meal object) {
  object.id = id;
}

extension MealQueryWhereSort on QueryBuilder<Meal, Meal, QWhere> {
  QueryBuilder<Meal, Meal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealQueryWhere on QueryBuilder<Meal, Meal, QWhereClause> {
  QueryBuilder<Meal, Meal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Meal, Meal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> idBetween(
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

  QueryBuilder<Meal, Meal, QAfterWhereClause> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [null],
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> dateEqualTo(String? date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> dateNotEqualTo(String? date) {
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

extension MealQueryFilter on QueryBuilder<Meal, Meal, QFilterCondition> {
  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateEqualTo(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateStartsWith(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateEndsWith(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exactMealAmount',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exactMealAmount',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exactMealAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exactMealAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exactMealAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exactMealAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exactMealAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exactMealAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exactMealAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exactMealAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exactMealAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> exactMealAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exactMealAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCalciumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCalciumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCalciumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCalciumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealCalcium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCaloriesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCaloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCaloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCaloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCarbohydratesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCarbohydratesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCarbohydratesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealCarbohydratesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealCarbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mealDescription',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mealDescription',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mealDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mealDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mealDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mealDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mealDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFatEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealFat',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealFat',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealFat',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFiberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFiberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFiberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealFiberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealFiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mealId',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mealId',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mealId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealId',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mealId',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealMagnesiumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealMagnesiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealMagnesiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealMagnesiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealMagnesium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealPotassiumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealPotassiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealPotassiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealPotassiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealPotassium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealProteinEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealProteinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealProteinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealProteinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSodiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSodiumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSodiumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSodiumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealSodium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSugarEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSugarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSugarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealSugarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealSugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealWaterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealWaterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealWaterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> mealWaterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealWater',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      namesOfAlternateFoodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namesOfAlternateFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      namesOfAlternateFoodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namesOfAlternateFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfAlternateFoodsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namesOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      namesOfAlternateFoodsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namesOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfAlternateFoodsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namesOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfAlternateFoodsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namesOfAlternateFoods',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      namesOfAlternateFoodsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namesOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfAlternateFoodsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namesOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfAlternateFoodsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namesOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfAlternateFoodsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namesOfAlternateFoods',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      namesOfAlternateFoodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namesOfAlternateFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      namesOfAlternateFoodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namesOfAlternateFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namesOfPairFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namesOfPairFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namesOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namesOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namesOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namesOfPairFoods',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namesOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namesOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namesOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namesOfPairFoods',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namesOfPairFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> namesOfPairFoodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namesOfPairFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'negatives',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'negatives',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'negatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'negatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'negatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'negatives',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'negatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'negatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'negatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'negatives',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'negatives',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> negativesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'negatives',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nutritionalBrief',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nutritionalBrief',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nutritionalBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nutritionalBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nutritionalBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nutritionalBrief',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nutritionalBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nutritionalBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nutritionalBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nutritionalBrief',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nutritionalBrief',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nutritionalBriefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nutritionalBrief',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'positives',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'positives',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'positives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'positives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'positives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'positives',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'positives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'positives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'positives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'positives',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'positives',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> positivesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'positives',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reasonOfAlternateFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reasonOfAlternateFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonOfAlternateFoodsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasonOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasonOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonOfAlternateFoodsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasonOfAlternateFoods',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasonOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasonOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasonOfAlternateFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonOfAlternateFoodsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasonOfAlternateFoods',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonOfAlternateFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonOfAlternateFoodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasonOfAlternateFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reasonsOfPairFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonsOfPairFoodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reasonsOfPairFoods',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonsOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasonsOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasonsOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasonsOfPairFoods',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasonsOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasonsOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasonsOfPairFoods',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasonsOfPairFoods',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> reasonsOfPairFoodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonsOfPairFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      reasonsOfPairFoodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasonsOfPairFoods',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeOfThisMealIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeOfThisMeal',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeOfThisMealIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeOfThisMeal',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeOfThisMealEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfThisMeal',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeOfThisMealGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeOfThisMeal',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeOfThisMealLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeOfThisMeal',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeOfThisMealBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeOfThisMeal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      timeThisMealWasLoggedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeThisMealWasLogged',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      timeThisMealWasLoggedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeThisMealWasLogged',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeThisMealWasLoggedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      timeThisMealWasLoggedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeThisMealWasLoggedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeThisMealWasLoggedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeThisMealWasLogged',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      timeThisMealWasLoggedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeThisMealWasLoggedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeThisMealWasLoggedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> timeThisMealWasLoggedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeThisMealWasLogged',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      timeThisMealWasLoggedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeThisMealWasLogged',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      timeThisMealWasLoggedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeThisMealWasLogged',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vitaminsAndMineralsBrief',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vitaminsAndMineralsBrief',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vitaminsAndMineralsBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vitaminsAndMineralsBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vitaminsAndMineralsBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vitaminsAndMineralsBrief',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vitaminsAndMineralsBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vitaminsAndMineralsBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vitaminsAndMineralsBrief',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vitaminsAndMineralsBrief',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vitaminsAndMineralsBrief',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      vitaminsAndMineralsBriefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vitaminsAndMineralsBrief',
        value: '',
      ));
    });
  }
}

extension MealQueryObject on QueryBuilder<Meal, Meal, QFilterCondition> {}

extension MealQueryLinks on QueryBuilder<Meal, Meal, QFilterCondition> {}

extension MealQuerySortBy on QueryBuilder<Meal, Meal, QSortBy> {
  QueryBuilder<Meal, Meal, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByExactMealAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exactMealAmount', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByExactMealAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exactMealAmount', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalcium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalcium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalories', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalories', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealDescription', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealDescription', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFat', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFat', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFiber', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFiber', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealMagnesium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealMagnesium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealPotassium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealPotassium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealProtein', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealProtein', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSodium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSodium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSugar', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSugar', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealWater', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByMealWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealWater', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNamesOfAlternateFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfAlternateFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNamesOfAlternateFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfAlternateFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNamesOfPairFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfPairFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNamesOfPairFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfPairFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNegatives() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negatives', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNegativesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negatives', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNutritionalBrief() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalBrief', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNutritionalBriefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalBrief', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByPositives() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positives', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByPositivesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positives', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByReasonOfAlternateFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonOfAlternateFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByReasonOfAlternateFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonOfAlternateFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByReasonsOfPairFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonsOfPairFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByReasonsOfPairFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonsOfPairFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByTimeOfThisMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfThisMeal', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByTimeOfThisMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfThisMeal', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByTimeThisMealWasLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByTimeThisMealWasLoggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByVitaminsAndMineralsBrief() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vitaminsAndMineralsBrief', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByVitaminsAndMineralsBriefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vitaminsAndMineralsBrief', Sort.desc);
    });
  }
}

extension MealQuerySortThenBy on QueryBuilder<Meal, Meal, QSortThenBy> {
  QueryBuilder<Meal, Meal, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByExactMealAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exactMealAmount', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByExactMealAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exactMealAmount', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalcium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalcium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalories', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCalories', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealDescription', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealDescription', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFat', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFat', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFiber', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFiber', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealMagnesium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealMagnesium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealPotassium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealPotassium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealProtein', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealProtein', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSodium', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSodium', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSugar', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealSugar', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealWater', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByMealWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealWater', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNamesOfAlternateFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfAlternateFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNamesOfAlternateFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfAlternateFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNamesOfPairFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfPairFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNamesOfPairFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namesOfPairFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNegatives() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negatives', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNegativesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negatives', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNutritionalBrief() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalBrief', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNutritionalBriefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalBrief', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByPositives() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positives', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByPositivesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positives', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByReasonOfAlternateFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonOfAlternateFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByReasonOfAlternateFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonOfAlternateFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByReasonsOfPairFoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonsOfPairFoods', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByReasonsOfPairFoodsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonsOfPairFoods', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByTimeOfThisMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfThisMeal', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByTimeOfThisMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfThisMeal', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByTimeThisMealWasLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByTimeThisMealWasLoggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByVitaminsAndMineralsBrief() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vitaminsAndMineralsBrief', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByVitaminsAndMineralsBriefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vitaminsAndMineralsBrief', Sort.desc);
    });
  }
}

extension MealQueryWhereDistinct on QueryBuilder<Meal, Meal, QDistinct> {
  QueryBuilder<Meal, Meal, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByExactMealAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exactMealAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealCalcium');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealCalories');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealCarbohydrates');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealFat');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealFiber');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealMagnesium');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealPotassium');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealProtein');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealSodium');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealSugar');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByMealWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealWater');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByNamesOfAlternateFoods(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namesOfAlternateFoods',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByNamesOfPairFoods(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namesOfPairFoods',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByNegatives(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'negatives', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByNutritionalBrief(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nutritionalBrief',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByPositives(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'positives', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByReasonOfAlternateFoods(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasonOfAlternateFoods',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByReasonsOfPairFoods(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasonsOfPairFoods',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByTimeOfThisMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeOfThisMeal');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByTimeThisMealWasLogged(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeThisMealWasLogged',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByVitaminsAndMineralsBrief(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vitaminsAndMineralsBrief',
          caseSensitive: caseSensitive);
    });
  }
}

extension MealQueryProperty on QueryBuilder<Meal, Meal, QQueryProperty> {
  QueryBuilder<Meal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> exactMealAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exactMealAmount');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealCalciumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealCalcium');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealCalories');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealCarbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealCarbohydrates');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> mealDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealDescription');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealFat');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealFiberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealFiber');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> mealIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealId');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealMagnesiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealMagnesium');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealPotassiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealPotassium');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealProtein');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealSodiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealSodium');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealSugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealSugar');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> mealWaterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealWater');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations>
      namesOfAlternateFoodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namesOfAlternateFoods');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> namesOfPairFoodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namesOfPairFoods');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> negativesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'negatives');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> nutritionalBriefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutritionalBrief');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> positivesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'positives');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations>
      reasonOfAlternateFoodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasonOfAlternateFoods');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> reasonsOfPairFoodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasonsOfPairFoods');
    });
  }

  QueryBuilder<Meal, int?, QQueryOperations> timeOfThisMealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeOfThisMeal');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations>
      timeThisMealWasLoggedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeThisMealWasLogged');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations>
      vitaminsAndMineralsBriefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vitaminsAndMineralsBrief');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIndividualWaterLogCollection on Isar {
  IsarCollection<IndividualWaterLog> get individualWaterLogs =>
      this.collection();
}

const IndividualWaterLogSchema = CollectionSchema(
  name: r'IndividualWaterLog',
  id: -5796706202745240620,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'logId': PropertySchema(
      id: 1,
      name: r'logId',
      type: IsarType.string,
    ),
    r'timeThisMealWasLogged': PropertySchema(
      id: 2,
      name: r'timeThisMealWasLogged',
      type: IsarType.string,
    ),
    r'waterAmount': PropertySchema(
      id: 3,
      name: r'waterAmount',
      type: IsarType.long,
    )
  },
  estimateSize: _individualWaterLogEstimateSize,
  serialize: _individualWaterLogSerialize,
  deserialize: _individualWaterLogDeserialize,
  deserializeProp: _individualWaterLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _individualWaterLogGetId,
  getLinks: _individualWaterLogGetLinks,
  attach: _individualWaterLogAttach,
  version: '3.1.0+1',
);

int _individualWaterLogEstimateSize(
  IndividualWaterLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timeThisMealWasLogged;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _individualWaterLogSerialize(
  IndividualWaterLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeString(offsets[1], object.logId);
  writer.writeString(offsets[2], object.timeThisMealWasLogged);
  writer.writeLong(offsets[3], object.waterAmount);
}

IndividualWaterLog _individualWaterLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IndividualWaterLog();
  object.date = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.logId = reader.readStringOrNull(offsets[1]);
  object.timeThisMealWasLogged = reader.readStringOrNull(offsets[2]);
  object.waterAmount = reader.readLong(offsets[3]);
  return object;
}

P _individualWaterLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _individualWaterLogGetId(IndividualWaterLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _individualWaterLogGetLinks(
    IndividualWaterLog object) {
  return [];
}

void _individualWaterLogAttach(
    IsarCollection<dynamic> col, Id id, IndividualWaterLog object) {
  object.id = id;
}

extension IndividualWaterLogQueryWhereSort
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QWhere> {
  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IndividualWaterLogQueryWhere
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QWhereClause> {
  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterWhereClause>
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterWhereClause>
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
}

extension IndividualWaterLogQueryFilter
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QFilterCondition> {
  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateEqualTo(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateBetween(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateStartsWith(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateEndsWith(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logId',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logId',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logId',
        value: '',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      logIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logId',
        value: '',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeThisMealWasLogged',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeThisMealWasLogged',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeThisMealWasLogged',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeThisMealWasLogged',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeThisMealWasLogged',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeThisMealWasLogged',
        value: '',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      timeThisMealWasLoggedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeThisMealWasLogged',
        value: '',
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      waterAmountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      waterAmountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      waterAmountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterFilterCondition>
      waterAmountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IndividualWaterLogQueryObject
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QFilterCondition> {}

extension IndividualWaterLogQueryLinks
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QFilterCondition> {}

extension IndividualWaterLogQuerySortBy
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QSortBy> {
  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByLogId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByLogIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByTimeThisMealWasLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByTimeThisMealWasLoggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByWaterAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      sortByWaterAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.desc);
    });
  }
}

extension IndividualWaterLogQuerySortThenBy
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QSortThenBy> {
  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByLogId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByLogIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByTimeThisMealWasLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByTimeThisMealWasLoggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeThisMealWasLogged', Sort.desc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByWaterAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.asc);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QAfterSortBy>
      thenByWaterAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.desc);
    });
  }
}

extension IndividualWaterLogQueryWhereDistinct
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QDistinct> {
  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QDistinct>
      distinctByDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QDistinct>
      distinctByLogId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QDistinct>
      distinctByTimeThisMealWasLogged({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeThisMealWasLogged',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IndividualWaterLog, IndividualWaterLog, QDistinct>
      distinctByWaterAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterAmount');
    });
  }
}

extension IndividualWaterLogQueryProperty
    on QueryBuilder<IndividualWaterLog, IndividualWaterLog, QQueryProperty> {
  QueryBuilder<IndividualWaterLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IndividualWaterLog, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<IndividualWaterLog, String?, QQueryOperations> logIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logId');
    });
  }

  QueryBuilder<IndividualWaterLog, String?, QQueryOperations>
      timeThisMealWasLoggedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeThisMealWasLogged');
    });
  }

  QueryBuilder<IndividualWaterLog, int, QQueryOperations>
      waterAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterAmount');
    });
  }
}
