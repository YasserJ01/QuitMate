// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_review_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeeklyReviewModelCollection on Isar {
  IsarCollection<WeeklyReviewModel> get weeklyReviewModels => this.collection();
}

const WeeklyReviewModelSchema = CollectionSchema(
  name: r'WeeklyReviewModel',
  id: 513745547046949510,
  properties: {
    r'checkInsCount': PropertySchema(
      id: 0,
      name: r'checkInsCount',
      type: IsarType.long,
    ),
    r'cravingsResisted': PropertySchema(
      id: 1,
      name: r'cravingsResisted',
      type: IsarType.long,
    ),
    r'generatedAt': PropertySchema(
      id: 2,
      name: r'generatedAt',
      type: IsarType.dateTime,
    ),
    r'lapseEvents': PropertySchema(
      id: 3,
      name: r'lapseEvents',
      type: IsarType.long,
    ),
    r'mostUsedExercise': PropertySchema(
      id: 4,
      name: r'mostUsedExercise',
      type: IsarType.string,
    ),
    r'motivationalSummary': PropertySchema(
      id: 5,
      name: r'motivationalSummary',
      type: IsarType.string,
    ),
    r'toolkitSessionsCount': PropertySchema(
      id: 6,
      name: r'toolkitSessionsCount',
      type: IsarType.long,
    ),
    r'topTrigger': PropertySchema(
      id: 7,
      name: r'topTrigger',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    ),
    r'weekStart': PropertySchema(
      id: 9,
      name: r'weekStart',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _weeklyReviewModelEstimateSize,
  serialize: _weeklyReviewModelSerialize,
  deserialize: _weeklyReviewModelDeserialize,
  deserializeProp: _weeklyReviewModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'weekStart': IndexSchema(
      id: 6730028936290595099,
      name: r'weekStart',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'weekStart',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _weeklyReviewModelGetId,
  getLinks: _weeklyReviewModelGetLinks,
  attach: _weeklyReviewModelAttach,
  version: '3.1.0+1',
);

int _weeklyReviewModelEstimateSize(
  WeeklyReviewModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.mostUsedExercise;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.motivationalSummary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.topTrigger;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _weeklyReviewModelSerialize(
  WeeklyReviewModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.checkInsCount);
  writer.writeLong(offsets[1], object.cravingsResisted);
  writer.writeDateTime(offsets[2], object.generatedAt);
  writer.writeLong(offsets[3], object.lapseEvents);
  writer.writeString(offsets[4], object.mostUsedExercise);
  writer.writeString(offsets[5], object.motivationalSummary);
  writer.writeLong(offsets[6], object.toolkitSessionsCount);
  writer.writeString(offsets[7], object.topTrigger);
  writer.writeString(offsets[8], object.userId);
  writer.writeDateTime(offsets[9], object.weekStart);
}

WeeklyReviewModel _weeklyReviewModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeeklyReviewModel();
  object.checkInsCount = reader.readLong(offsets[0]);
  object.cravingsResisted = reader.readLong(offsets[1]);
  object.generatedAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.lapseEvents = reader.readLong(offsets[3]);
  object.mostUsedExercise = reader.readStringOrNull(offsets[4]);
  object.motivationalSummary = reader.readStringOrNull(offsets[5]);
  object.toolkitSessionsCount = reader.readLong(offsets[6]);
  object.topTrigger = reader.readStringOrNull(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  object.weekStart = reader.readDateTime(offsets[9]);
  return object;
}

P _weeklyReviewModelDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weeklyReviewModelGetId(WeeklyReviewModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weeklyReviewModelGetLinks(
    WeeklyReviewModel object) {
  return [];
}

void _weeklyReviewModelAttach(
    IsarCollection<dynamic> col, Id id, WeeklyReviewModel object) {
  object.id = id;
}

extension WeeklyReviewModelQueryWhereSort
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QWhere> {
  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhere>
      anyWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'weekStart'),
      );
    });
  }
}

extension WeeklyReviewModelQueryWhere
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QWhereClause> {
  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      weekStartEqualTo(DateTime weekStart) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'weekStart',
        value: [weekStart],
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      weekStartNotEqualTo(DateTime weekStart) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [],
              upper: [weekStart],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [weekStart],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [weekStart],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [],
              upper: [weekStart],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      weekStartGreaterThan(
    DateTime weekStart, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'weekStart',
        lower: [weekStart],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      weekStartLessThan(
    DateTime weekStart, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'weekStart',
        lower: [],
        upper: [weekStart],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterWhereClause>
      weekStartBetween(
    DateTime lowerWeekStart,
    DateTime upperWeekStart, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'weekStart',
        lower: [lowerWeekStart],
        includeLower: includeLower,
        upper: [upperWeekStart],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeeklyReviewModelQueryFilter
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QFilterCondition> {
  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      checkInsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      checkInsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      checkInsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      checkInsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      cravingsResistedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingsResisted',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      cravingsResistedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cravingsResisted',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      cravingsResistedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cravingsResisted',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      cravingsResistedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cravingsResisted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      generatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      generatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      generatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      generatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      lapseEventsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lapseEvents',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      lapseEventsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lapseEvents',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      lapseEventsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lapseEvents',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      lapseEventsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lapseEvents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mostUsedExercise',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mostUsedExercise',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostUsedExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mostUsedExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mostUsedExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mostUsedExercise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mostUsedExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mostUsedExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mostUsedExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mostUsedExercise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostUsedExercise',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      mostUsedExerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mostUsedExercise',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivationalSummary',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivationalSummary',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivationalSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motivationalSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motivationalSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motivationalSummary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'motivationalSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'motivationalSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivationalSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivationalSummary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivationalSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      motivationalSummaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivationalSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      toolkitSessionsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toolkitSessionsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      toolkitSessionsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toolkitSessionsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      toolkitSessionsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toolkitSessionsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      toolkitSessionsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toolkitSessionsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'topTrigger',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'topTrigger',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topTrigger',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topTrigger',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topTrigger',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topTrigger',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'topTrigger',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'topTrigger',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'topTrigger',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'topTrigger',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topTrigger',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      topTriggerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'topTrigger',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdLessThan(
    String value, {
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdStartsWith(
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdEndsWith(
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

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      weekStartEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      weekStartGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      weekStartLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterFilterCondition>
      weekStartBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeeklyReviewModelQueryObject
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QFilterCondition> {}

extension WeeklyReviewModelQueryLinks
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QFilterCondition> {}

extension WeeklyReviewModelQuerySortBy
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QSortBy> {
  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByCheckInsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInsCount', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByCheckInsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInsCount', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByCravingsResisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsResisted', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByCravingsResistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsResisted', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByLapseEvents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapseEvents', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByLapseEventsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapseEvents', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByMostUsedExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedExercise', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByMostUsedExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedExercise', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByMotivationalSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalSummary', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByMotivationalSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalSummary', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByToolkitSessionsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toolkitSessionsCount', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByToolkitSessionsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toolkitSessionsCount', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByTopTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topTrigger', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByTopTriggerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topTrigger', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      sortByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension WeeklyReviewModelQuerySortThenBy
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QSortThenBy> {
  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByCheckInsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInsCount', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByCheckInsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInsCount', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByCravingsResisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsResisted', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByCravingsResistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsResisted', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByLapseEvents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapseEvents', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByLapseEventsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapseEvents', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByMostUsedExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedExercise', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByMostUsedExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedExercise', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByMotivationalSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalSummary', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByMotivationalSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalSummary', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByToolkitSessionsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toolkitSessionsCount', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByToolkitSessionsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toolkitSessionsCount', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByTopTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topTrigger', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByTopTriggerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topTrigger', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QAfterSortBy>
      thenByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension WeeklyReviewModelQueryWhereDistinct
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct> {
  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByCheckInsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInsCount');
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByCravingsResisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingsResisted');
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAt');
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByLapseEvents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lapseEvents');
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByMostUsedExercise({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mostUsedExercise',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByMotivationalSummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivationalSummary',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByToolkitSessionsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toolkitSessionsCount');
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByTopTrigger({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topTrigger', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QDistinct>
      distinctByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekStart');
    });
  }
}

extension WeeklyReviewModelQueryProperty
    on QueryBuilder<WeeklyReviewModel, WeeklyReviewModel, QQueryProperty> {
  QueryBuilder<WeeklyReviewModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeeklyReviewModel, int, QQueryOperations>
      checkInsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInsCount');
    });
  }

  QueryBuilder<WeeklyReviewModel, int, QQueryOperations>
      cravingsResistedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingsResisted');
    });
  }

  QueryBuilder<WeeklyReviewModel, DateTime, QQueryOperations>
      generatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAt');
    });
  }

  QueryBuilder<WeeklyReviewModel, int, QQueryOperations> lapseEventsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lapseEvents');
    });
  }

  QueryBuilder<WeeklyReviewModel, String?, QQueryOperations>
      mostUsedExerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mostUsedExercise');
    });
  }

  QueryBuilder<WeeklyReviewModel, String?, QQueryOperations>
      motivationalSummaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivationalSummary');
    });
  }

  QueryBuilder<WeeklyReviewModel, int, QQueryOperations>
      toolkitSessionsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toolkitSessionsCount');
    });
  }

  QueryBuilder<WeeklyReviewModel, String?, QQueryOperations>
      topTriggerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topTrigger');
    });
  }

  QueryBuilder<WeeklyReviewModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<WeeklyReviewModel, DateTime, QQueryOperations>
      weekStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekStart');
    });
  }
}
