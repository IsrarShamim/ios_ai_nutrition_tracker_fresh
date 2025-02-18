// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserInformationEntityCollection on Isar {
  IsarCollection<UserInformationEntity> get userInformationEntitys =>
      this.collection();
}

const UserInformationEntitySchema = CollectionSchema(
  name: r'UserInformationEntity',
  id: 8499707768512487557,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'currentActivityLevel': PropertySchema(
      id: 1,
      name: r'currentActivityLevel',
      type: IsarType.string,
    ),
    r'diet': PropertySchema(
      id: 2,
      name: r'diet',
      type: IsarType.string,
    ),
    r'exercise': PropertySchema(
      id: 3,
      name: r'exercise',
      type: IsarType.string,
    ),
    r'exerciseAmount': PropertySchema(
      id: 4,
      name: r'exerciseAmount',
      type: IsarType.long,
    ),
    r'gender': PropertySchema(
      id: 5,
      name: r'gender',
      type: IsarType.string,
    ),
    r'goal': PropertySchema(
      id: 6,
      name: r'goal',
      type: IsarType.stringList,
    ),
    r'height': PropertySchema(
      id: 7,
      name: r'height',
      type: IsarType.double,
    ),
    r'heightUnit': PropertySchema(
      id: 8,
      name: r'heightUnit',
      type: IsarType.string,
    ),
    r'location': PropertySchema(
      id: 9,
      name: r'location',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'weight': PropertySchema(
      id: 11,
      name: r'weight',
      type: IsarType.double,
    ),
    r'weightGoal': PropertySchema(
      id: 12,
      name: r'weightGoal',
      type: IsarType.string,
    ),
    r'weightGoalPerWeek': PropertySchema(
      id: 13,
      name: r'weightGoalPerWeek',
      type: IsarType.string,
    ),
    r'weightRecords': PropertySchema(
      id: 14,
      name: r'weightRecords',
      type: IsarType.stringList,
    ),
    r'weightRecordsForNext3Months': PropertySchema(
      id: 15,
      name: r'weightRecordsForNext3Months',
      type: IsarType.stringList,
    ),
    r'weightRecordsString': PropertySchema(
      id: 16,
      name: r'weightRecordsString',
      type: IsarType.string,
    ),
    r'weightRecordsTime': PropertySchema(
      id: 17,
      name: r'weightRecordsTime',
      type: IsarType.stringList,
    ),
    r'weightRecordsTimeForNext3Months': PropertySchema(
      id: 18,
      name: r'weightRecordsTimeForNext3Months',
      type: IsarType.stringList,
    ),
    r'weightRecordsTimeString': PropertySchema(
      id: 19,
      name: r'weightRecordsTimeString',
      type: IsarType.string,
    ),
    r'weightUnit': PropertySchema(
      id: 20,
      name: r'weightUnit',
      type: IsarType.string,
    )
  },
  estimateSize: _userInformationEntityEstimateSize,
  serialize: _userInformationEntitySerialize,
  deserialize: _userInformationEntityDeserialize,
  deserializeProp: _userInformationEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userInformationEntityGetId,
  getLinks: _userInformationEntityGetLinks,
  attach: _userInformationEntityAttach,
  version: '3.1.0+1',
);

int _userInformationEntityEstimateSize(
  UserInformationEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.currentActivityLevel.length * 3;
  bytesCount += 3 + object.diet.length * 3;
  bytesCount += 3 + object.exercise.length * 3;
  bytesCount += 3 + object.gender.length * 3;
  bytesCount += 3 + object.goal.length * 3;
  {
    for (var i = 0; i < object.goal.length; i++) {
      final value = object.goal[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.heightUnit.length * 3;
  bytesCount += 3 + object.location.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.weightGoal.length * 3;
  bytesCount += 3 + object.weightGoalPerWeek.length * 3;
  bytesCount += 3 + object.weightRecords.length * 3;
  {
    for (var i = 0; i < object.weightRecords.length; i++) {
      final value = object.weightRecords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.weightRecordsForNext3Months.length * 3;
  {
    for (var i = 0; i < object.weightRecordsForNext3Months.length; i++) {
      final value = object.weightRecordsForNext3Months[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.weightRecordsString.length * 3;
  bytesCount += 3 + object.weightRecordsTime.length * 3;
  {
    for (var i = 0; i < object.weightRecordsTime.length; i++) {
      final value = object.weightRecordsTime[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.weightRecordsTimeForNext3Months.length * 3;
  {
    for (var i = 0; i < object.weightRecordsTimeForNext3Months.length; i++) {
      final value = object.weightRecordsTimeForNext3Months[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.weightRecordsTimeString.length * 3;
  bytesCount += 3 + object.weightUnit.length * 3;
  return bytesCount;
}

void _userInformationEntitySerialize(
  UserInformationEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeString(offsets[1], object.currentActivityLevel);
  writer.writeString(offsets[2], object.diet);
  writer.writeString(offsets[3], object.exercise);
  writer.writeLong(offsets[4], object.exerciseAmount);
  writer.writeString(offsets[5], object.gender);
  writer.writeStringList(offsets[6], object.goal);
  writer.writeDouble(offsets[7], object.height);
  writer.writeString(offsets[8], object.heightUnit);
  writer.writeString(offsets[9], object.location);
  writer.writeString(offsets[10], object.name);
  writer.writeDouble(offsets[11], object.weight);
  writer.writeString(offsets[12], object.weightGoal);
  writer.writeString(offsets[13], object.weightGoalPerWeek);
  writer.writeStringList(offsets[14], object.weightRecords);
  writer.writeStringList(offsets[15], object.weightRecordsForNext3Months);
  writer.writeString(offsets[16], object.weightRecordsString);
  writer.writeStringList(offsets[17], object.weightRecordsTime);
  writer.writeStringList(offsets[18], object.weightRecordsTimeForNext3Months);
  writer.writeString(offsets[19], object.weightRecordsTimeString);
  writer.writeString(offsets[20], object.weightUnit);
}

UserInformationEntity _userInformationEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserInformationEntity(
    age: reader.readLong(offsets[0]),
    currentActivityLevel: reader.readString(offsets[1]),
    diet: reader.readString(offsets[2]),
    exercise: reader.readString(offsets[3]),
    exerciseAmount: reader.readLong(offsets[4]),
    gender: reader.readString(offsets[5]),
    goal: reader.readStringList(offsets[6]) ?? [],
    height: reader.readDouble(offsets[7]),
    heightUnit: reader.readString(offsets[8]),
    id: id,
    location: reader.readString(offsets[9]),
    name: reader.readString(offsets[10]),
    weight: reader.readDouble(offsets[11]),
    weightGoal: reader.readString(offsets[12]),
    weightGoalPerWeek: reader.readString(offsets[13]),
    weightRecordsForNext3Months: reader.readStringList(offsets[15]) ?? [],
    weightRecordsTimeForNext3Months: reader.readStringList(offsets[18]) ?? [],
    weightUnit: reader.readString(offsets[20]),
  );
  object.weightRecordsString = reader.readString(offsets[16]);
  object.weightRecordsTimeString = reader.readString(offsets[19]);
  return object;
}

P _userInformationEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringList(offset) ?? []) as P;
    case 15:
      return (reader.readStringList(offset) ?? []) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringList(offset) ?? []) as P;
    case 18:
      return (reader.readStringList(offset) ?? []) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userInformationEntityGetId(UserInformationEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userInformationEntityGetLinks(
    UserInformationEntity object) {
  return [];
}

void _userInformationEntityAttach(
    IsarCollection<dynamic> col, Id id, UserInformationEntity object) {
  object.id = id;
}

extension UserInformationEntityQueryWhereSort
    on QueryBuilder<UserInformationEntity, UserInformationEntity, QWhere> {
  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserInformationEntityQueryWhere on QueryBuilder<UserInformationEntity,
    UserInformationEntity, QWhereClause> {
  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterWhereClause>
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

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterWhereClause>
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

extension UserInformationEntityQueryFilter on QueryBuilder<
    UserInformationEntity, UserInformationEntity, QFilterCondition> {
  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> ageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> ageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> ageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> ageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentActivityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentActivityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentActivityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentActivityLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentActivityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentActivityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      currentActivityLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentActivityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      currentActivityLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentActivityLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentActivityLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> currentActivityLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentActivityLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diet',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'diet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'diet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      dietContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'diet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      dietMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'diet',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diet',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> dietIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'diet',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exercise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      exerciseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      exerciseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseAmountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseAmountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseAmountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> exerciseAmountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      goalElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      goalElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'goal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goal',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'goal',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goal',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goal',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goal',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goal',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goal',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> goalLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goal',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'heightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'heightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'heightUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'heightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'heightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      heightUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'heightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      heightUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'heightUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heightUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> heightUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'heightUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
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

  QueryBuilder<UserInformationEntity, UserInformationEntity,
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

  QueryBuilder<UserInformationEntity, UserInformationEntity,
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

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightGoalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightGoalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightGoal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightGoal',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightGoal',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightGoalPerWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightGoalPerWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightGoalPerWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightGoalPerWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightGoalPerWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightGoalPerWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightGoalPerWeekContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightGoalPerWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightGoalPerWeekMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightGoalPerWeek',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightGoalPerWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightGoalPerWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightGoalPerWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightRecords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightRecords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightRecords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightRecords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightRecords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightRecords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightRecords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecords',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightRecords',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightRecordsForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightRecordsForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightRecordsForNext3Months',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightRecordsForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightRecordsForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsForNext3MonthsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightRecordsForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsForNext3MonthsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightRecordsForNext3Months',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsForNext3Months',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightRecordsForNext3Months',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsForNext3MonthsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsForNext3Months',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsForNext3Months',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsForNext3Months',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsForNext3Months',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsForNext3Months',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsForNext3MonthsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsForNext3Months',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightRecordsString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightRecordsString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightRecordsString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightRecordsString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightRecordsString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightRecordsString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightRecordsString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightRecordsString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightRecordsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightRecordsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightRecordsTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightRecordsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightRecordsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightRecordsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightRecordsTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightRecordsTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTime',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTime',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTime',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTime',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTime',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTime',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsTimeForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightRecordsTimeForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightRecordsTimeForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightRecordsTimeForNext3Months',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightRecordsTimeForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightRecordsTimeForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeForNext3MonthsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightRecordsTimeForNext3Months',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeForNext3MonthsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightRecordsTimeForNext3Months',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsTimeForNext3Months',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeForNext3MonthsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightRecordsTimeForNext3Months',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeForNext3MonthsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTimeForNext3Months',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTimeForNext3Months',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTimeForNext3Months',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTimeForNext3Months',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTimeForNext3Months',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeForNext3MonthsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weightRecordsTimeForNext3Months',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsTimeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightRecordsTimeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightRecordsTimeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightRecordsTimeString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightRecordsTimeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightRecordsTimeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeStringContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightRecordsTimeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightRecordsTimeStringMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightRecordsTimeString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightRecordsTimeString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightRecordsTimeStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightRecordsTimeString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
          QAfterFilterCondition>
      weightUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity,
      QAfterFilterCondition> weightUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightUnit',
        value: '',
      ));
    });
  }
}

extension UserInformationEntityQueryObject on QueryBuilder<
    UserInformationEntity, UserInformationEntity, QFilterCondition> {}

extension UserInformationEntityQueryLinks on QueryBuilder<UserInformationEntity,
    UserInformationEntity, QFilterCondition> {}

extension UserInformationEntityQuerySortBy
    on QueryBuilder<UserInformationEntity, UserInformationEntity, QSortBy> {
  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByCurrentActivityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentActivityLevel', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByCurrentActivityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentActivityLevel', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByDiet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diet', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByDietDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diet', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByExerciseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseAmount', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByExerciseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseAmount', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByHeightUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightUnit', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByHeightUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightUnit', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoal', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoal', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightGoalPerWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoalPerWeek', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightGoalPerWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoalPerWeek', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightRecordsString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsString', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightRecordsStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsString', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightRecordsTimeString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsTimeString', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightRecordsTimeStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsTimeString', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnit', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      sortByWeightUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnit', Sort.desc);
    });
  }
}

extension UserInformationEntityQuerySortThenBy
    on QueryBuilder<UserInformationEntity, UserInformationEntity, QSortThenBy> {
  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByCurrentActivityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentActivityLevel', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByCurrentActivityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentActivityLevel', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByDiet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diet', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByDietDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diet', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByExerciseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseAmount', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByExerciseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseAmount', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByHeightUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightUnit', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByHeightUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightUnit', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoal', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoal', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightGoalPerWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoalPerWeek', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightGoalPerWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGoalPerWeek', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightRecordsString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsString', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightRecordsStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsString', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightRecordsTimeString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsTimeString', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightRecordsTimeStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightRecordsTimeString', Sort.desc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnit', Sort.asc);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QAfterSortBy>
      thenByWeightUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnit', Sort.desc);
    });
  }
}

extension UserInformationEntityQueryWhereDistinct
    on QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct> {
  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByCurrentActivityLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentActivityLevel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByDiet({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diet', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByExercise({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercise', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByExerciseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseAmount');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByGender({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goal');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByHeightUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'heightUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByLocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightGoal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightGoal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightGoalPerWeek({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightGoalPerWeek',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightRecords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightRecords');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightRecordsForNext3Months() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightRecordsForNext3Months');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightRecordsString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightRecordsString',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightRecordsTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightRecordsTime');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightRecordsTimeForNext3Months() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightRecordsTimeForNext3Months');
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightRecordsTimeString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightRecordsTimeString',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInformationEntity, UserInformationEntity, QDistinct>
      distinctByWeightUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightUnit', caseSensitive: caseSensitive);
    });
  }
}

extension UserInformationEntityQueryProperty on QueryBuilder<
    UserInformationEntity, UserInformationEntity, QQueryProperty> {
  QueryBuilder<UserInformationEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserInformationEntity, int, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      currentActivityLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentActivityLevel');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations> dietProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diet');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      exerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercise');
    });
  }

  QueryBuilder<UserInformationEntity, int, QQueryOperations>
      exerciseAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseAmount');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<UserInformationEntity, List<String>, QQueryOperations>
      goalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goal');
    });
  }

  QueryBuilder<UserInformationEntity, double, QQueryOperations>
      heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      heightUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heightUnit');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<UserInformationEntity, double, QQueryOperations>
      weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      weightGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightGoal');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      weightGoalPerWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightGoalPerWeek');
    });
  }

  QueryBuilder<UserInformationEntity, List<String>, QQueryOperations>
      weightRecordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightRecords');
    });
  }

  QueryBuilder<UserInformationEntity, List<String>, QQueryOperations>
      weightRecordsForNext3MonthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightRecordsForNext3Months');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      weightRecordsStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightRecordsString');
    });
  }

  QueryBuilder<UserInformationEntity, List<String>, QQueryOperations>
      weightRecordsTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightRecordsTime');
    });
  }

  QueryBuilder<UserInformationEntity, List<String>, QQueryOperations>
      weightRecordsTimeForNext3MonthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightRecordsTimeForNext3Months');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      weightRecordsTimeStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightRecordsTimeString');
    });
  }

  QueryBuilder<UserInformationEntity, String, QQueryOperations>
      weightUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightUnit');
    });
  }
}
