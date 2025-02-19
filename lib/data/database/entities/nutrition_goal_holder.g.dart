// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_goal_holder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNutritionGoalHolderCollection on Isar {
  IsarCollection<NutritionGoalHolder> get nutritionGoalHolders =>
      this.collection();
}

const NutritionGoalHolderSchema = CollectionSchema(
  name: r'NutritionGoalHolder',
  id: -4327707794638507628,
  properties: {
    r'isarId': PropertySchema(
      id: 0,
      name: r'isarId',
      type: IsarType.string,
    ),
    r'targetCalcium': PropertySchema(
      id: 1,
      name: r'targetCalcium',
      type: IsarType.long,
    ),
    r'targetCalories': PropertySchema(
      id: 2,
      name: r'targetCalories',
      type: IsarType.long,
    ),
    r'targetCarbohydrates': PropertySchema(
      id: 3,
      name: r'targetCarbohydrates',
      type: IsarType.long,
    ),
    r'targetFat': PropertySchema(
      id: 4,
      name: r'targetFat',
      type: IsarType.long,
    ),
    r'targetFiber': PropertySchema(
      id: 5,
      name: r'targetFiber',
      type: IsarType.long,
    ),
    r'targetMagnesium': PropertySchema(
      id: 6,
      name: r'targetMagnesium',
      type: IsarType.long,
    ),
    r'targetPotassium': PropertySchema(
      id: 7,
      name: r'targetPotassium',
      type: IsarType.long,
    ),
    r'targetProtein': PropertySchema(
      id: 8,
      name: r'targetProtein',
      type: IsarType.long,
    ),
    r'targetSodium': PropertySchema(
      id: 9,
      name: r'targetSodium',
      type: IsarType.long,
    ),
    r'targetSugar': PropertySchema(
      id: 10,
      name: r'targetSugar',
      type: IsarType.long,
    ),
    r'targetWater': PropertySchema(
      id: 11,
      name: r'targetWater',
      type: IsarType.long,
    )
  },
  estimateSize: _nutritionGoalHolderEstimateSize,
  serialize: _nutritionGoalHolderSerialize,
  deserialize: _nutritionGoalHolderDeserialize,
  deserializeProp: _nutritionGoalHolderDeserializeProp,
  idName: r'id',
  indexes: {
    r'isarId': IndexSchema(
      id: 9148257262157697843,
      name: r'isarId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isarId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nutritionGoalHolderGetId,
  getLinks: _nutritionGoalHolderGetLinks,
  attach: _nutritionGoalHolderAttach,
  version: '3.1.0+1',
);

int _nutritionGoalHolderEstimateSize(
  NutritionGoalHolder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.isarId.length * 3;
  return bytesCount;
}

void _nutritionGoalHolderSerialize(
  NutritionGoalHolder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.isarId);
  writer.writeLong(offsets[1], object.targetCalcium);
  writer.writeLong(offsets[2], object.targetCalories);
  writer.writeLong(offsets[3], object.targetCarbohydrates);
  writer.writeLong(offsets[4], object.targetFat);
  writer.writeLong(offsets[5], object.targetFiber);
  writer.writeLong(offsets[6], object.targetMagnesium);
  writer.writeLong(offsets[7], object.targetPotassium);
  writer.writeLong(offsets[8], object.targetProtein);
  writer.writeLong(offsets[9], object.targetSodium);
  writer.writeLong(offsets[10], object.targetSugar);
  writer.writeLong(offsets[11], object.targetWater);
}

NutritionGoalHolder _nutritionGoalHolderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutritionGoalHolder();
  object.id = id;
  object.isarId = reader.readString(offsets[0]);
  object.targetCalcium = reader.readLong(offsets[1]);
  object.targetCalories = reader.readLong(offsets[2]);
  object.targetCarbohydrates = reader.readLong(offsets[3]);
  object.targetFat = reader.readLong(offsets[4]);
  object.targetFiber = reader.readLong(offsets[5]);
  object.targetMagnesium = reader.readLong(offsets[6]);
  object.targetPotassium = reader.readLong(offsets[7]);
  object.targetProtein = reader.readLong(offsets[8]);
  object.targetSodium = reader.readLong(offsets[9]);
  object.targetSugar = reader.readLong(offsets[10]);
  object.targetWater = reader.readLong(offsets[11]);
  return object;
}

P _nutritionGoalHolderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
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
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nutritionGoalHolderGetId(NutritionGoalHolder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nutritionGoalHolderGetLinks(
    NutritionGoalHolder object) {
  return [];
}

void _nutritionGoalHolderAttach(
    IsarCollection<dynamic> col, Id id, NutritionGoalHolder object) {
  object.id = id;
}

extension NutritionGoalHolderByIndex on IsarCollection<NutritionGoalHolder> {
  Future<NutritionGoalHolder?> getByIsarId(String isarId) {
    return getByIndex(r'isarId', [isarId]);
  }

  NutritionGoalHolder? getByIsarIdSync(String isarId) {
    return getByIndexSync(r'isarId', [isarId]);
  }

  Future<bool> deleteByIsarId(String isarId) {
    return deleteByIndex(r'isarId', [isarId]);
  }

  bool deleteByIsarIdSync(String isarId) {
    return deleteByIndexSync(r'isarId', [isarId]);
  }

  Future<List<NutritionGoalHolder?>> getAllByIsarId(List<String> isarIdValues) {
    final values = isarIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'isarId', values);
  }

  List<NutritionGoalHolder?> getAllByIsarIdSync(List<String> isarIdValues) {
    final values = isarIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'isarId', values);
  }

  Future<int> deleteAllByIsarId(List<String> isarIdValues) {
    final values = isarIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'isarId', values);
  }

  int deleteAllByIsarIdSync(List<String> isarIdValues) {
    final values = isarIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'isarId', values);
  }

  Future<Id> putByIsarId(NutritionGoalHolder object) {
    return putByIndex(r'isarId', object);
  }

  Id putByIsarIdSync(NutritionGoalHolder object, {bool saveLinks = true}) {
    return putByIndexSync(r'isarId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIsarId(List<NutritionGoalHolder> objects) {
    return putAllByIndex(r'isarId', objects);
  }

  List<Id> putAllByIsarIdSync(List<NutritionGoalHolder> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'isarId', objects, saveLinks: saveLinks);
  }
}

extension NutritionGoalHolderQueryWhereSort
    on QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QWhere> {
  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NutritionGoalHolderQueryWhere
    on QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QWhereClause> {
  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
      isarIdEqualTo(String isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isarId',
        value: [isarId],
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterWhereClause>
      isarIdNotEqualTo(String isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isarId',
              lower: [],
              upper: [isarId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isarId',
              lower: [isarId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isarId',
              lower: [isarId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isarId',
              lower: [],
              upper: [isarId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NutritionGoalHolderQueryFilter on QueryBuilder<NutritionGoalHolder,
    NutritionGoalHolder, QFilterCondition> {
  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isarId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: '',
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isarId',
        value: '',
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetCalciumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalcium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetCaloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetCarbohydratesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCarbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetFatEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetFiberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFiber',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetMagnesiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetMagnesium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetPotassiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPotassium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetProteinEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetSodiumEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSodium',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetSugarEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSugar',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
      targetWaterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetWater',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterFilterCondition>
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
}

extension NutritionGoalHolderQueryObject on QueryBuilder<NutritionGoalHolder,
    NutritionGoalHolder, QFilterCondition> {}

extension NutritionGoalHolderQueryLinks on QueryBuilder<NutritionGoalHolder,
    NutritionGoalHolder, QFilterCondition> {}

extension NutritionGoalHolderQuerySortBy
    on QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QSortBy> {
  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      sortByTargetWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.desc);
    });
  }
}

extension NutritionGoalHolderQuerySortThenBy
    on QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QSortThenBy> {
  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetCalciumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalcium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbohydrates', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFiber', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetMagnesiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMagnesium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetPotassiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPotassium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetSodiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSodium', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetSugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSugar', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QAfterSortBy>
      thenByTargetWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWater', Sort.desc);
    });
  }
}

extension NutritionGoalHolderQueryWhereDistinct
    on QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct> {
  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetCalcium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalcium');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalories');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCarbohydrates');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFat');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFiber');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetMagnesium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetMagnesium');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetPotassium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPotassium');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetProtein');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetSodium() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSodium');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetSugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSugar');
    });
  }

  QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QDistinct>
      distinctByTargetWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetWater');
    });
  }
}

extension NutritionGoalHolderQueryProperty
    on QueryBuilder<NutritionGoalHolder, NutritionGoalHolder, QQueryProperty> {
  QueryBuilder<NutritionGoalHolder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NutritionGoalHolder, String, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetCalciumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalcium');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalories');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetCarbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCarbohydrates');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations> targetFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFat');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetFiberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFiber');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetMagnesiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetMagnesium');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetPotassiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPotassium');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetProtein');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetSodiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSodium');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetSugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSugar');
    });
  }

  QueryBuilder<NutritionGoalHolder, int, QQueryOperations>
      targetWaterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetWater');
    });
  }
}
