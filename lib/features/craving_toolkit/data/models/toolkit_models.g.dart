// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toolkit_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBreathingSessionCollection on Isar {
  IsarCollection<BreathingSession> get breathingSessions => this.collection();
}

const BreathingSessionSchema = CollectionSchema(
  name: r'BreathingSession',
  id: -3763888514970639129,
  properties: {
    r'cravingId': PropertySchema(
      id: 0,
      name: r'cravingId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'cyclesCompleted': PropertySchema(
      id: 2,
      name: r'cyclesCompleted',
      type: IsarType.long,
    ),
    r'durationSeconds': PropertySchema(
      id: 3,
      name: r'durationSeconds',
      type: IsarType.long,
    ),
    r'effectivenessRating': PropertySchema(
      id: 4,
      name: r'effectivenessRating',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 5,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'pattern': PropertySchema(
      id: 7,
      name: r'pattern',
      type: IsarType.string,
      enumMap: _BreathingSessionpatternEnumValueMap,
    ),
    r'startTime': PropertySchema(
      id: 8,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'totalMinutes': PropertySchema(
      id: 9,
      name: r'totalMinutes',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 10,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _breathingSessionEstimateSize,
  serialize: _breathingSessionSerialize,
  deserialize: _breathingSessionDeserialize,
  deserializeProp: _breathingSessionDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _breathingSessionGetId,
  getLinks: _breathingSessionGetLinks,
  attach: _breathingSessionAttach,
  version: '3.1.0+1',
);

int _breathingSessionEstimateSize(
  BreathingSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pattern.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _breathingSessionSerialize(
  BreathingSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cravingId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.cyclesCompleted);
  writer.writeLong(offsets[3], object.durationSeconds);
  writer.writeLong(offsets[4], object.effectivenessRating);
  writer.writeDateTime(offsets[5], object.endTime);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeString(offsets[7], object.pattern.name);
  writer.writeDateTime(offsets[8], object.startTime);
  writer.writeLong(offsets[9], object.totalMinutes);
  writer.writeString(offsets[10], object.userId);
}

BreathingSession _breathingSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BreathingSession();
  object.cravingId = reader.readLongOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.cyclesCompleted = reader.readLong(offsets[2]);
  object.durationSeconds = reader.readLong(offsets[3]);
  object.effectivenessRating = reader.readLongOrNull(offsets[4]);
  object.endTime = reader.readDateTimeOrNull(offsets[5]);
  object.id = id;
  object.pattern = _BreathingSessionpatternValueEnumMap[
          reader.readStringOrNull(offsets[7])] ??
      BreathingPattern.box;
  object.startTime = reader.readDateTime(offsets[8]);
  object.userId = reader.readString(offsets[10]);
  return object;
}

P _breathingSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (_BreathingSessionpatternValueEnumMap[
              reader.readStringOrNull(offset)] ??
          BreathingPattern.box) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BreathingSessionpatternEnumValueMap = {
  r'box': r'box',
  r'relaxing': r'relaxing',
  r'energizing': r'energizing',
  r'calm': r'calm',
  r'custom': r'custom',
};
const _BreathingSessionpatternValueEnumMap = {
  r'box': BreathingPattern.box,
  r'relaxing': BreathingPattern.relaxing,
  r'energizing': BreathingPattern.energizing,
  r'calm': BreathingPattern.calm,
  r'custom': BreathingPattern.custom,
};

Id _breathingSessionGetId(BreathingSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _breathingSessionGetLinks(BreathingSession object) {
  return [];
}

void _breathingSessionAttach(
    IsarCollection<dynamic> col, Id id, BreathingSession object) {
  object.id = id;
}

extension BreathingSessionQueryWhereSort
    on QueryBuilder<BreathingSession, BreathingSession, QWhere> {
  QueryBuilder<BreathingSession, BreathingSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BreathingSessionQueryWhere
    on QueryBuilder<BreathingSession, BreathingSession, QWhereClause> {
  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterWhereClause>
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
}

extension BreathingSessionQueryFilter
    on QueryBuilder<BreathingSession, BreathingSession, QFilterCondition> {
  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cravingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cravingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cravingIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cravingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cravingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cravingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cravingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cyclesCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cyclesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cyclesCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cyclesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cyclesCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cyclesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      cyclesCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cyclesCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      durationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      durationSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      durationSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      durationSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      effectivenessRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectivenessRating',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      effectivenessRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectivenessRating',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      effectivenessRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      effectivenessRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      effectivenessRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      effectivenessRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectivenessRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternEqualTo(
    BreathingPattern value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternGreaterThan(
    BreathingPattern value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternLessThan(
    BreathingPattern value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternBetween(
    BreathingPattern lower,
    BreathingPattern upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pattern',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pattern',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pattern',
        value: '',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      patternIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pattern',
        value: '',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      totalMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalMinutes',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      totalMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalMinutes',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      totalMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      totalMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      totalMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      totalMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
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

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension BreathingSessionQueryObject
    on QueryBuilder<BreathingSession, BreathingSession, QFilterCondition> {}

extension BreathingSessionQueryLinks
    on QueryBuilder<BreathingSession, BreathingSession, QFilterCondition> {}

extension BreathingSessionQuerySortBy
    on QueryBuilder<BreathingSession, BreathingSession, QSortBy> {
  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByCyclesCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cyclesCompleted', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByCyclesCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cyclesCompleted', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByEffectivenessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByPattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pattern', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByPatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pattern', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByTotalMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMinutes', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByTotalMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMinutes', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BreathingSessionQuerySortThenBy
    on QueryBuilder<BreathingSession, BreathingSession, QSortThenBy> {
  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByCyclesCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cyclesCompleted', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByCyclesCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cyclesCompleted', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByEffectivenessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByPattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pattern', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByPatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pattern', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByTotalMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMinutes', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByTotalMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMinutes', Sort.desc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BreathingSessionQueryWhereDistinct
    on QueryBuilder<BreathingSession, BreathingSession, QDistinct> {
  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingId');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByCyclesCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cyclesCompleted');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationSeconds');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectivenessRating');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct> distinctByPattern(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pattern', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct>
      distinctByTotalMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMinutes');
    });
  }

  QueryBuilder<BreathingSession, BreathingSession, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension BreathingSessionQueryProperty
    on QueryBuilder<BreathingSession, BreathingSession, QQueryProperty> {
  QueryBuilder<BreathingSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BreathingSession, int?, QQueryOperations> cravingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingId');
    });
  }

  QueryBuilder<BreathingSession, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BreathingSession, int, QQueryOperations>
      cyclesCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cyclesCompleted');
    });
  }

  QueryBuilder<BreathingSession, int, QQueryOperations>
      durationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationSeconds');
    });
  }

  QueryBuilder<BreathingSession, int?, QQueryOperations>
      effectivenessRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectivenessRating');
    });
  }

  QueryBuilder<BreathingSession, DateTime?, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<BreathingSession, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<BreathingSession, BreathingPattern, QQueryOperations>
      patternProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pattern');
    });
  }

  QueryBuilder<BreathingSession, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<BreathingSession, int?, QQueryOperations>
      totalMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMinutes');
    });
  }

  QueryBuilder<BreathingSession, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCbtSessionCollection on Isar {
  IsarCollection<CbtSession> get cbtSessions => this.collection();
}

const CbtSessionSchema = CollectionSchema(
  name: r'CbtSession',
  id: 5858880493551567748,
  properties: {
    r'alternativeChosen': PropertySchema(
      id: 0,
      name: r'alternativeChosen',
      type: IsarType.string,
    ),
    r'consequences': PropertySchema(
      id: 1,
      name: r'consequences',
      type: IsarType.string,
    ),
    r'cravingId': PropertySchema(
      id: 2,
      name: r'cravingId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endTime': PropertySchema(
      id: 4,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'helpfulnessRating': PropertySchema(
      id: 5,
      name: r'helpfulnessRating',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'technique': PropertySchema(
      id: 8,
      name: r'technique',
      type: IsarType.string,
      enumMap: _CbtSessiontechniqueEnumValueMap,
    ),
    r'thoughtsAfter': PropertySchema(
      id: 9,
      name: r'thoughtsAfter',
      type: IsarType.string,
    ),
    r'thoughtsBefore': PropertySchema(
      id: 10,
      name: r'thoughtsBefore',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasHelpful': PropertySchema(
      id: 12,
      name: r'wasHelpful',
      type: IsarType.bool,
    )
  },
  estimateSize: _cbtSessionEstimateSize,
  serialize: _cbtSessionSerialize,
  deserialize: _cbtSessionDeserialize,
  deserializeProp: _cbtSessionDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cbtSessionGetId,
  getLinks: _cbtSessionGetLinks,
  attach: _cbtSessionAttach,
  version: '3.1.0+1',
);

int _cbtSessionEstimateSize(
  CbtSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.alternativeChosen;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.consequences;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.technique.name.length * 3;
  {
    final value = object.thoughtsAfter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.thoughtsBefore;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _cbtSessionSerialize(
  CbtSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alternativeChosen);
  writer.writeString(offsets[1], object.consequences);
  writer.writeLong(offsets[2], object.cravingId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.endTime);
  writer.writeLong(offsets[5], object.helpfulnessRating);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeDateTime(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.technique.name);
  writer.writeString(offsets[9], object.thoughtsAfter);
  writer.writeString(offsets[10], object.thoughtsBefore);
  writer.writeString(offsets[11], object.userId);
  writer.writeBool(offsets[12], object.wasHelpful);
}

CbtSession _cbtSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CbtSession();
  object.alternativeChosen = reader.readStringOrNull(offsets[0]);
  object.consequences = reader.readStringOrNull(offsets[1]);
  object.cravingId = reader.readLongOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.endTime = reader.readDateTimeOrNull(offsets[4]);
  object.helpfulnessRating = reader.readLongOrNull(offsets[5]);
  object.id = id;
  object.startTime = reader.readDateTime(offsets[7]);
  object.technique =
      _CbtSessiontechniqueValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          CbtTechnique.urgeSurfing;
  object.thoughtsAfter = reader.readStringOrNull(offsets[9]);
  object.thoughtsBefore = reader.readStringOrNull(offsets[10]);
  object.userId = reader.readString(offsets[11]);
  object.wasHelpful = reader.readBoolOrNull(offsets[12]);
  return object;
}

P _cbtSessionDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (_CbtSessiontechniqueValueEnumMap[
              reader.readStringOrNull(offset)] ??
          CbtTechnique.urgeSurfing) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CbtSessiontechniqueEnumValueMap = {
  r'urgeSurfing': r'urgeSurfing',
  r'thoughtChallenge': r'thoughtChallenge',
  r'consequenceAnalysis': r'consequenceAnalysis',
  r'delayTactic': r'delayTactic',
  r'alternativeBehavior': r'alternativeBehavior',
};
const _CbtSessiontechniqueValueEnumMap = {
  r'urgeSurfing': CbtTechnique.urgeSurfing,
  r'thoughtChallenge': CbtTechnique.thoughtChallenge,
  r'consequenceAnalysis': CbtTechnique.consequenceAnalysis,
  r'delayTactic': CbtTechnique.delayTactic,
  r'alternativeBehavior': CbtTechnique.alternativeBehavior,
};

Id _cbtSessionGetId(CbtSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cbtSessionGetLinks(CbtSession object) {
  return [];
}

void _cbtSessionAttach(IsarCollection<dynamic> col, Id id, CbtSession object) {
  object.id = id;
}

extension CbtSessionQueryWhereSort
    on QueryBuilder<CbtSession, CbtSession, QWhere> {
  QueryBuilder<CbtSession, CbtSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CbtSessionQueryWhere
    on QueryBuilder<CbtSession, CbtSession, QWhereClause> {
  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterWhereClause> userIdNotEqualTo(
      String userId) {
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

extension CbtSessionQueryFilter
    on QueryBuilder<CbtSession, CbtSession, QFilterCondition> {
  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternativeChosen',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternativeChosen',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeChosen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeChosen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeChosen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeChosen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeChosen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeChosen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeChosen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeChosen',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeChosen',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      alternativeChosenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeChosen',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'consequences',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'consequences',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consequences',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consequences',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consequences',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consequences',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'consequences',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'consequences',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'consequences',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'consequences',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consequences',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      consequencesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'consequences',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      cravingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      cravingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> cravingIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      cravingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> cravingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> cravingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cravingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> endTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      helpfulnessRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'helpfulnessRating',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      helpfulnessRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'helpfulnessRating',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      helpfulnessRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'helpfulnessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      helpfulnessRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'helpfulnessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      helpfulnessRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'helpfulnessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      helpfulnessRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'helpfulnessRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> startTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> techniqueEqualTo(
    CbtTechnique value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      techniqueGreaterThan(
    CbtTechnique value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> techniqueLessThan(
    CbtTechnique value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> techniqueBetween(
    CbtTechnique lower,
    CbtTechnique upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technique',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      techniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> techniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> techniqueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> techniqueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      techniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      techniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thoughtsAfter',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thoughtsAfter',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thoughtsAfter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thoughtsAfter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thoughtsAfter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thoughtsAfter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thoughtsAfter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thoughtsAfter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thoughtsAfter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thoughtsAfter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thoughtsAfter',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsAfterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thoughtsAfter',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thoughtsBefore',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thoughtsBefore',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thoughtsBefore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thoughtsBefore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thoughtsBefore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thoughtsBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thoughtsBefore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thoughtsBefore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thoughtsBefore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thoughtsBefore',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thoughtsBefore',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      thoughtsBeforeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thoughtsBefore',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      wasHelpfulIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wasHelpful',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition>
      wasHelpfulIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wasHelpful',
      ));
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterFilterCondition> wasHelpfulEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasHelpful',
        value: value,
      ));
    });
  }
}

extension CbtSessionQueryObject
    on QueryBuilder<CbtSession, CbtSession, QFilterCondition> {}

extension CbtSessionQueryLinks
    on QueryBuilder<CbtSession, CbtSession, QFilterCondition> {}

extension CbtSessionQuerySortBy
    on QueryBuilder<CbtSession, CbtSession, QSortBy> {
  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByAlternativeChosen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeChosen', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy>
      sortByAlternativeChosenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeChosen', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByConsequences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consequences', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByConsequencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consequences', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByHelpfulnessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpfulnessRating', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy>
      sortByHelpfulnessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpfulnessRating', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByThoughtsAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsAfter', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByThoughtsAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsAfter', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByThoughtsBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsBefore', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy>
      sortByThoughtsBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsBefore', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByWasHelpful() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasHelpful', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> sortByWasHelpfulDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasHelpful', Sort.desc);
    });
  }
}

extension CbtSessionQuerySortThenBy
    on QueryBuilder<CbtSession, CbtSession, QSortThenBy> {
  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByAlternativeChosen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeChosen', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy>
      thenByAlternativeChosenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeChosen', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByConsequences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consequences', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByConsequencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consequences', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByHelpfulnessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpfulnessRating', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy>
      thenByHelpfulnessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpfulnessRating', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByThoughtsAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsAfter', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByThoughtsAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsAfter', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByThoughtsBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsBefore', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy>
      thenByThoughtsBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thoughtsBefore', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByWasHelpful() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasHelpful', Sort.asc);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QAfterSortBy> thenByWasHelpfulDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasHelpful', Sort.desc);
    });
  }
}

extension CbtSessionQueryWhereDistinct
    on QueryBuilder<CbtSession, CbtSession, QDistinct> {
  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByAlternativeChosen(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternativeChosen',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByConsequences(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consequences', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingId');
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct>
      distinctByHelpfulnessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'helpfulnessRating');
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByTechnique(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technique', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByThoughtsAfter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thoughtsAfter',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByThoughtsBefore(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thoughtsBefore',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CbtSession, CbtSession, QDistinct> distinctByWasHelpful() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasHelpful');
    });
  }
}

extension CbtSessionQueryProperty
    on QueryBuilder<CbtSession, CbtSession, QQueryProperty> {
  QueryBuilder<CbtSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CbtSession, String?, QQueryOperations>
      alternativeChosenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternativeChosen');
    });
  }

  QueryBuilder<CbtSession, String?, QQueryOperations> consequencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consequences');
    });
  }

  QueryBuilder<CbtSession, int?, QQueryOperations> cravingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingId');
    });
  }

  QueryBuilder<CbtSession, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CbtSession, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<CbtSession, int?, QQueryOperations> helpfulnessRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'helpfulnessRating');
    });
  }

  QueryBuilder<CbtSession, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<CbtSession, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<CbtSession, CbtTechnique, QQueryOperations> techniqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technique');
    });
  }

  QueryBuilder<CbtSession, String?, QQueryOperations> thoughtsAfterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thoughtsAfter');
    });
  }

  QueryBuilder<CbtSession, String?, QQueryOperations> thoughtsBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thoughtsBefore');
    });
  }

  QueryBuilder<CbtSession, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<CbtSession, bool?, QQueryOperations> wasHelpfulProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasHelpful');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGroundingSessionCollection on Isar {
  IsarCollection<GroundingSession> get groundingSessions => this.collection();
}

const GroundingSessionSchema = CollectionSchema(
  name: r'GroundingSession',
  id: 8163282774522110884,
  properties: {
    r'cravingId': PropertySchema(
      id: 0,
      name: r'cravingId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'effectivenessRating': PropertySchema(
      id: 2,
      name: r'effectivenessRating',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 3,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'exercise': PropertySchema(
      id: 4,
      name: r'exercise',
      type: IsarType.string,
      enumMap: _GroundingSessionexerciseEnumValueMap,
    ),
    r'hearItems': PropertySchema(
      id: 5,
      name: r'hearItems',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 7,
      name: r'notes',
      type: IsarType.string,
    ),
    r'seeItems': PropertySchema(
      id: 8,
      name: r'seeItems',
      type: IsarType.string,
    ),
    r'smellItems': PropertySchema(
      id: 9,
      name: r'smellItems',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 10,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'tasteItems': PropertySchema(
      id: 11,
      name: r'tasteItems',
      type: IsarType.string,
    ),
    r'touchItems': PropertySchema(
      id: 12,
      name: r'touchItems',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 13,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _groundingSessionEstimateSize,
  serialize: _groundingSessionSerialize,
  deserialize: _groundingSessionDeserialize,
  deserializeProp: _groundingSessionDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _groundingSessionGetId,
  getLinks: _groundingSessionGetLinks,
  attach: _groundingSessionAttach,
  version: '3.1.0+1',
);

int _groundingSessionEstimateSize(
  GroundingSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exercise.name.length * 3;
  {
    final value = object.hearItems;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.seeItems;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.smellItems;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tasteItems;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.touchItems;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _groundingSessionSerialize(
  GroundingSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cravingId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.effectivenessRating);
  writer.writeDateTime(offsets[3], object.endTime);
  writer.writeString(offsets[4], object.exercise.name);
  writer.writeString(offsets[5], object.hearItems);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeString(offsets[7], object.notes);
  writer.writeString(offsets[8], object.seeItems);
  writer.writeString(offsets[9], object.smellItems);
  writer.writeDateTime(offsets[10], object.startTime);
  writer.writeString(offsets[11], object.tasteItems);
  writer.writeString(offsets[12], object.touchItems);
  writer.writeString(offsets[13], object.userId);
}

GroundingSession _groundingSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroundingSession();
  object.cravingId = reader.readLongOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.effectivenessRating = reader.readLongOrNull(offsets[2]);
  object.endTime = reader.readDateTimeOrNull(offsets[3]);
  object.exercise = _GroundingSessionexerciseValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      GroundingExercise.fiveSenses;
  object.hearItems = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[7]);
  object.seeItems = reader.readStringOrNull(offsets[8]);
  object.smellItems = reader.readStringOrNull(offsets[9]);
  object.startTime = reader.readDateTime(offsets[10]);
  object.tasteItems = reader.readStringOrNull(offsets[11]);
  object.touchItems = reader.readStringOrNull(offsets[12]);
  object.userId = reader.readString(offsets[13]);
  return object;
}

P _groundingSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (_GroundingSessionexerciseValueEnumMap[
              reader.readStringOrNull(offset)] ??
          GroundingExercise.fiveSenses) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GroundingSessionexerciseEnumValueMap = {
  r'fiveSenses': r'fiveSenses',
  r'bodyAwareness': r'bodyAwareness',
  r'objectFocus': r'objectFocus',
  r'counting': r'counting',
  r'coldWater': r'coldWater',
};
const _GroundingSessionexerciseValueEnumMap = {
  r'fiveSenses': GroundingExercise.fiveSenses,
  r'bodyAwareness': GroundingExercise.bodyAwareness,
  r'objectFocus': GroundingExercise.objectFocus,
  r'counting': GroundingExercise.counting,
  r'coldWater': GroundingExercise.coldWater,
};

Id _groundingSessionGetId(GroundingSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groundingSessionGetLinks(GroundingSession object) {
  return [];
}

void _groundingSessionAttach(
    IsarCollection<dynamic> col, Id id, GroundingSession object) {
  object.id = id;
}

extension GroundingSessionQueryWhereSort
    on QueryBuilder<GroundingSession, GroundingSession, QWhere> {
  QueryBuilder<GroundingSession, GroundingSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroundingSessionQueryWhere
    on QueryBuilder<GroundingSession, GroundingSession, QWhereClause> {
  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterWhereClause>
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
}

extension GroundingSessionQueryFilter
    on QueryBuilder<GroundingSession, GroundingSession, QFilterCondition> {
  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      cravingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      cravingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      cravingIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      cravingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      cravingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      cravingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cravingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      effectivenessRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectivenessRating',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      effectivenessRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectivenessRating',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      effectivenessRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      effectivenessRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      effectivenessRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      effectivenessRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectivenessRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseEqualTo(
    GroundingExercise value, {
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseGreaterThan(
    GroundingExercise value, {
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseLessThan(
    GroundingExercise value, {
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseBetween(
    GroundingExercise lower,
    GroundingExercise upper, {
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseStartsWith(
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseEndsWith(
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      exerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hearItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hearItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hearItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hearItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hearItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hearItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hearItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hearItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hearItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      hearItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hearItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seeItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seeItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seeItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seeItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seeItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seeItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seeItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seeItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seeItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seeItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seeItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      seeItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seeItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smellItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smellItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smellItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smellItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smellItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smellItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'smellItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'smellItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'smellItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'smellItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smellItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      smellItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'smellItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tasteItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tasteItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tasteItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tasteItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tasteItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tasteItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tasteItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tasteItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tasteItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tasteItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tasteItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      tasteItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tasteItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'touchItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'touchItems',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'touchItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'touchItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'touchItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'touchItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'touchItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'touchItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'touchItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'touchItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'touchItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      touchItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'touchItems',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
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

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension GroundingSessionQueryObject
    on QueryBuilder<GroundingSession, GroundingSession, QFilterCondition> {}

extension GroundingSessionQueryLinks
    on QueryBuilder<GroundingSession, GroundingSession, QFilterCondition> {}

extension GroundingSessionQuerySortBy
    on QueryBuilder<GroundingSession, GroundingSession, QSortBy> {
  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByEffectivenessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByHearItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByHearItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortBySeeItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seeItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortBySeeItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seeItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortBySmellItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortBySmellItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByTasteItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasteItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByTasteItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasteItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByTouchItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'touchItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByTouchItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'touchItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension GroundingSessionQuerySortThenBy
    on QueryBuilder<GroundingSession, GroundingSession, QSortThenBy> {
  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByEffectivenessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByHearItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByHearItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenBySeeItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seeItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenBySeeItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seeItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenBySmellItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenBySmellItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smellItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByTasteItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasteItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByTasteItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasteItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByTouchItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'touchItems', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByTouchItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'touchItems', Sort.desc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension GroundingSessionQueryWhereDistinct
    on QueryBuilder<GroundingSession, GroundingSession, QDistinct> {
  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingId');
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectivenessRating');
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByExercise({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercise', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByHearItems({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hearItems', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctBySeeItems({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seeItems', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctBySmellItems({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smellItems', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByTasteItems({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tasteItems', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct>
      distinctByTouchItems({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'touchItems', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroundingSession, GroundingSession, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension GroundingSessionQueryProperty
    on QueryBuilder<GroundingSession, GroundingSession, QQueryProperty> {
  QueryBuilder<GroundingSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GroundingSession, int?, QQueryOperations> cravingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingId');
    });
  }

  QueryBuilder<GroundingSession, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GroundingSession, int?, QQueryOperations>
      effectivenessRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectivenessRating');
    });
  }

  QueryBuilder<GroundingSession, DateTime?, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<GroundingSession, GroundingExercise, QQueryOperations>
      exerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercise');
    });
  }

  QueryBuilder<GroundingSession, String?, QQueryOperations>
      hearItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hearItems');
    });
  }

  QueryBuilder<GroundingSession, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<GroundingSession, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<GroundingSession, String?, QQueryOperations> seeItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seeItems');
    });
  }

  QueryBuilder<GroundingSession, String?, QQueryOperations>
      smellItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smellItems');
    });
  }

  QueryBuilder<GroundingSession, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<GroundingSession, String?, QQueryOperations>
      tasteItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tasteItems');
    });
  }

  QueryBuilder<GroundingSession, String?, QQueryOperations>
      touchItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'touchItems');
    });
  }

  QueryBuilder<GroundingSession, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDistractionSessionCollection on Isar {
  IsarCollection<DistractionSession> get distractionSessions =>
      this.collection();
}

const DistractionSessionSchema = CollectionSchema(
  name: r'DistractionSession',
  id: -6890482577441769439,
  properties: {
    r'activity': PropertySchema(
      id: 0,
      name: r'activity',
      type: IsarType.string,
      enumMap: _DistractionSessionactivityEnumValueMap,
    ),
    r'cravingId': PropertySchema(
      id: 1,
      name: r'cravingId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'durationMinutes': PropertySchema(
      id: 3,
      name: r'durationMinutes',
      type: IsarType.long,
    ),
    r'effectivenessRating': PropertySchema(
      id: 4,
      name: r'effectivenessRating',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 5,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasEffective': PropertySchema(
      id: 9,
      name: r'wasEffective',
      type: IsarType.bool,
    )
  },
  estimateSize: _distractionSessionEstimateSize,
  serialize: _distractionSessionSerialize,
  deserialize: _distractionSessionDeserialize,
  deserializeProp: _distractionSessionDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _distractionSessionGetId,
  getLinks: _distractionSessionGetLinks,
  attach: _distractionSessionAttach,
  version: '3.1.0+1',
);

int _distractionSessionEstimateSize(
  DistractionSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activity.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _distractionSessionSerialize(
  DistractionSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activity.name);
  writer.writeLong(offsets[1], object.cravingId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.durationMinutes);
  writer.writeLong(offsets[4], object.effectivenessRating);
  writer.writeDateTime(offsets[5], object.endTime);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeDateTime(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.userId);
  writer.writeBool(offsets[9], object.wasEffective);
}

DistractionSession _distractionSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DistractionSession();
  object.activity = _DistractionSessionactivityValueEnumMap[
          reader.readStringOrNull(offsets[0])] ??
      DistractionActivity.breathing;
  object.cravingId = reader.readLongOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.effectivenessRating = reader.readLongOrNull(offsets[4]);
  object.endTime = reader.readDateTimeOrNull(offsets[5]);
  object.id = id;
  object.startTime = reader.readDateTime(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  object.wasEffective = reader.readBoolOrNull(offsets[9]);
  return object;
}

P _distractionSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DistractionSessionactivityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          DistractionActivity.breathing) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DistractionSessionactivityEnumValueMap = {
  r'breathing': r'breathing',
  r'puzzle': r'puzzle',
  r'memoryGame': r'memoryGame',
  r'wordGame': r'wordGame',
  r'drawing': r'drawing',
  r'music': r'music',
  r'walk': r'walk',
  r'call': r'call',
  r'read': r'read',
  r'hobby': r'hobby',
};
const _DistractionSessionactivityValueEnumMap = {
  r'breathing': DistractionActivity.breathing,
  r'puzzle': DistractionActivity.puzzle,
  r'memoryGame': DistractionActivity.memoryGame,
  r'wordGame': DistractionActivity.wordGame,
  r'drawing': DistractionActivity.drawing,
  r'music': DistractionActivity.music,
  r'walk': DistractionActivity.walk,
  r'call': DistractionActivity.call,
  r'read': DistractionActivity.read,
  r'hobby': DistractionActivity.hobby,
};

Id _distractionSessionGetId(DistractionSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _distractionSessionGetLinks(
    DistractionSession object) {
  return [];
}

void _distractionSessionAttach(
    IsarCollection<dynamic> col, Id id, DistractionSession object) {
  object.id = id;
}

extension DistractionSessionQueryWhereSort
    on QueryBuilder<DistractionSession, DistractionSession, QWhere> {
  QueryBuilder<DistractionSession, DistractionSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DistractionSessionQueryWhere
    on QueryBuilder<DistractionSession, DistractionSession, QWhereClause> {
  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterWhereClause>
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
}

extension DistractionSessionQueryFilter
    on QueryBuilder<DistractionSession, DistractionSession, QFilterCondition> {
  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityEqualTo(
    DistractionActivity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityGreaterThan(
    DistractionActivity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityLessThan(
    DistractionActivity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityBetween(
    DistractionActivity lower,
    DistractionActivity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activity',
        value: '',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      activityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activity',
        value: '',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      cravingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      cravingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cravingId',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      cravingIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      cravingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      cravingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cravingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      cravingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cravingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      durationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      durationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      durationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      durationMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      durationMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      durationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      effectivenessRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectivenessRating',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      effectivenessRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectivenessRating',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      effectivenessRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      effectivenessRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      effectivenessRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectivenessRating',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      effectivenessRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectivenessRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
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

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      wasEffectiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wasEffective',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      wasEffectiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wasEffective',
      ));
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterFilterCondition>
      wasEffectiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasEffective',
        value: value,
      ));
    });
  }
}

extension DistractionSessionQueryObject
    on QueryBuilder<DistractionSession, DistractionSession, QFilterCondition> {}

extension DistractionSessionQueryLinks
    on QueryBuilder<DistractionSession, DistractionSession, QFilterCondition> {}

extension DistractionSessionQuerySortBy
    on QueryBuilder<DistractionSession, DistractionSession, QSortBy> {
  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByEffectivenessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByWasEffective() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasEffective', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      sortByWasEffectiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasEffective', Sort.desc);
    });
  }
}

extension DistractionSessionQuerySortThenBy
    on QueryBuilder<DistractionSession, DistractionSession, QSortThenBy> {
  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByCravingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingId', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByEffectivenessRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectivenessRating', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByWasEffective() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasEffective', Sort.asc);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QAfterSortBy>
      thenByWasEffectiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasEffective', Sort.desc);
    });
  }
}

extension DistractionSessionQueryWhereDistinct
    on QueryBuilder<DistractionSession, DistractionSession, QDistinct> {
  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByActivity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByCravingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingId');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMinutes');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByEffectivenessRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectivenessRating');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DistractionSession, DistractionSession, QDistinct>
      distinctByWasEffective() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasEffective');
    });
  }
}

extension DistractionSessionQueryProperty
    on QueryBuilder<DistractionSession, DistractionSession, QQueryProperty> {
  QueryBuilder<DistractionSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DistractionSession, DistractionActivity, QQueryOperations>
      activityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activity');
    });
  }

  QueryBuilder<DistractionSession, int?, QQueryOperations> cravingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingId');
    });
  }

  QueryBuilder<DistractionSession, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DistractionSession, int?, QQueryOperations>
      durationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMinutes');
    });
  }

  QueryBuilder<DistractionSession, int?, QQueryOperations>
      effectivenessRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectivenessRating');
    });
  }

  QueryBuilder<DistractionSession, DateTime?, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<DistractionSession, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<DistractionSession, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<DistractionSession, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<DistractionSession, bool?, QQueryOperations>
      wasEffectiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasEffective');
    });
  }
}
