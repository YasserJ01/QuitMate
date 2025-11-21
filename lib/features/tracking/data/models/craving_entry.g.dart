// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craving_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCravingEntryCollection on Isar {
  IsarCollection<CravingEntry> get cravingEntrys => this.collection();
}

const CravingEntrySchema = CollectionSchema(
  name: r'CravingEntry',
  id: -7621013484206212908,
  properties: {
    r'copingStrategiesUsed': PropertySchema(
      id: 0,
      name: r'copingStrategiesUsed',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'durationMinutes': PropertySchema(
      id: 2,
      name: r'durationMinutes',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 3,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'finalIntensity': PropertySchema(
      id: 4,
      name: r'finalIntensity',
      type: IsarType.string,
      enumMap: _CravingEntryfinalIntensityEnumValueMap,
    ),
    r'initialIntensity': PropertySchema(
      id: 5,
      name: r'initialIntensity',
      type: IsarType.string,
      enumMap: _CravingEntryinitialIntensityEnumValueMap,
    ),
    r'intensityReduction': PropertySchema(
      id: 6,
      name: r'intensityReduction',
      type: IsarType.long,
    ),
    r'isOngoing': PropertySchema(
      id: 7,
      name: r'isOngoing',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(
      id: 8,
      name: r'location',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
    r'outcome': PropertySchema(
      id: 10,
      name: r'outcome',
      type: IsarType.string,
      enumMap: _CravingEntryoutcomeEnumValueMap,
    ),
    r'startTime': PropertySchema(
      id: 11,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'triggers': PropertySchema(
      id: 12,
      name: r'triggers',
      type: IsarType.stringList,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 14,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasSuccessfullyResisted': PropertySchema(
      id: 15,
      name: r'wasSuccessfullyResisted',
      type: IsarType.bool,
    )
  },
  estimateSize: _cravingEntryEstimateSize,
  serialize: _cravingEntrySerialize,
  deserialize: _cravingEntryDeserialize,
  deserializeProp: _cravingEntryDeserializeProp,
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
  getId: _cravingEntryGetId,
  getLinks: _cravingEntryGetLinks,
  attach: _cravingEntryAttach,
  version: '3.1.0+1',
);

int _cravingEntryEstimateSize(
  CravingEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.copingStrategiesUsed.length * 3;
  {
    for (var i = 0; i < object.copingStrategiesUsed.length; i++) {
      final value = object.copingStrategiesUsed[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.finalIntensity;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.initialIntensity.name.length * 3;
  {
    final value = object.location;
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
    final value = object.outcome;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.triggers.length * 3;
  {
    for (var i = 0; i < object.triggers.length; i++) {
      final value = object.triggers[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _cravingEntrySerialize(
  CravingEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.copingStrategiesUsed);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.durationMinutes);
  writer.writeDateTime(offsets[3], object.endTime);
  writer.writeString(offsets[4], object.finalIntensity?.name);
  writer.writeString(offsets[5], object.initialIntensity.name);
  writer.writeLong(offsets[6], object.intensityReduction);
  writer.writeBool(offsets[7], object.isOngoing);
  writer.writeString(offsets[8], object.location);
  writer.writeString(offsets[9], object.notes);
  writer.writeString(offsets[10], object.outcome?.name);
  writer.writeDateTime(offsets[11], object.startTime);
  writer.writeStringList(offsets[12], object.triggers);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.userId);
  writer.writeBool(offsets[15], object.wasSuccessfullyResisted);
}

CravingEntry _cravingEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CravingEntry();
  object.copingStrategiesUsed = reader.readStringList(offsets[0]) ?? [];
  object.createdAt = reader.readDateTime(offsets[1]);
  object.endTime = reader.readDateTimeOrNull(offsets[3]);
  object.finalIntensity = _CravingEntryfinalIntensityValueEnumMap[
      reader.readStringOrNull(offsets[4])];
  object.id = id;
  object.initialIntensity = _CravingEntryinitialIntensityValueEnumMap[
          reader.readStringOrNull(offsets[5])] ??
      CravingIntensity.mild;
  object.location = reader.readStringOrNull(offsets[8]);
  object.notes = reader.readStringOrNull(offsets[9]);
  object.outcome =
      _CravingEntryoutcomeValueEnumMap[reader.readStringOrNull(offsets[10])];
  object.startTime = reader.readDateTime(offsets[11]);
  object.triggers = reader.readStringList(offsets[12]) ?? [];
  object.updatedAt = reader.readDateTimeOrNull(offsets[13]);
  object.userId = reader.readString(offsets[14]);
  return object;
}

P _cravingEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (_CravingEntryfinalIntensityValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 5:
      return (_CravingEntryinitialIntensityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          CravingIntensity.mild) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_CravingEntryoutcomeValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readStringList(offset) ?? []) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CravingEntryfinalIntensityEnumValueMap = {
  r'mild': r'mild',
  r'moderate': r'moderate',
  r'strong': r'strong',
  r'veryStrong': r'veryStrong',
};
const _CravingEntryfinalIntensityValueEnumMap = {
  r'mild': CravingIntensity.mild,
  r'moderate': CravingIntensity.moderate,
  r'strong': CravingIntensity.strong,
  r'veryStrong': CravingIntensity.veryStrong,
};
const _CravingEntryinitialIntensityEnumValueMap = {
  r'mild': r'mild',
  r'moderate': r'moderate',
  r'strong': r'strong',
  r'veryStrong': r'veryStrong',
};
const _CravingEntryinitialIntensityValueEnumMap = {
  r'mild': CravingIntensity.mild,
  r'moderate': CravingIntensity.moderate,
  r'strong': CravingIntensity.strong,
  r'veryStrong': CravingIntensity.veryStrong,
};
const _CravingEntryoutcomeEnumValueMap = {
  r'resisted': r'resisted',
  r'gaveIn': r'gaveIn',
  r'delayed': r'delayed',
  r'distracted': r'distracted',
};
const _CravingEntryoutcomeValueEnumMap = {
  r'resisted': CravingOutcome.resisted,
  r'gaveIn': CravingOutcome.gaveIn,
  r'delayed': CravingOutcome.delayed,
  r'distracted': CravingOutcome.distracted,
};

Id _cravingEntryGetId(CravingEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cravingEntryGetLinks(CravingEntry object) {
  return [];
}

void _cravingEntryAttach(
    IsarCollection<dynamic> col, Id id, CravingEntry object) {
  object.id = id;
}

extension CravingEntryQueryWhereSort
    on QueryBuilder<CravingEntry, CravingEntry, QWhere> {
  QueryBuilder<CravingEntry, CravingEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CravingEntryQueryWhere
    on QueryBuilder<CravingEntry, CravingEntry, QWhereClause> {
  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> idBetween(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterWhereClause> userIdNotEqualTo(
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

extension CravingEntryQueryFilter
    on QueryBuilder<CravingEntry, CravingEntry, QFilterCondition> {
  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'copingStrategiesUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'copingStrategiesUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'copingStrategiesUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'copingStrategiesUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'copingStrategiesUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'copingStrategiesUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'copingStrategiesUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'copingStrategiesUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'copingStrategiesUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'copingStrategiesUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'copingStrategiesUsed',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'copingStrategiesUsed',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'copingStrategiesUsed',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'copingStrategiesUsed',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'copingStrategiesUsed',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      copingStrategiesUsedLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'copingStrategiesUsed',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      durationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      durationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      durationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalIntensity',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalIntensity',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityEqualTo(
    CravingIntensity? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityGreaterThan(
    CravingIntensity? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityLessThan(
    CravingIntensity? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityBetween(
    CravingIntensity? lower,
    CravingIntensity? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalIntensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'finalIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'finalIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'finalIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'finalIntensity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalIntensity',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      finalIntensityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'finalIntensity',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityEqualTo(
    CravingIntensity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityGreaterThan(
    CravingIntensity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initialIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityLessThan(
    CravingIntensity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initialIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityBetween(
    CravingIntensity lower,
    CravingIntensity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initialIntensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'initialIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'initialIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'initialIntensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'initialIntensity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialIntensity',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      initialIntensityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'initialIntensity',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      intensityReductionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intensityReduction',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      intensityReductionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intensityReduction',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      intensityReductionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensityReduction',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      intensityReductionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensityReduction',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      intensityReductionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensityReduction',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      intensityReductionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensityReduction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      isOngoingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOngoing',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationEqualTo(
    String? value, {
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationLessThan(
    String? value, {
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationStartsWith(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationEndsWith(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'outcome',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'outcome',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeEqualTo(
    CravingOutcome? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outcome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeGreaterThan(
    CravingOutcome? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outcome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeLessThan(
    CravingOutcome? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outcome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeBetween(
    CravingOutcome? lower,
    CravingOutcome? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outcome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'outcome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'outcome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outcome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outcome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outcome',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      outcomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outcome',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'triggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'triggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'triggers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'triggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'triggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'triggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'triggers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triggers',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'triggers',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'triggers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'triggers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'triggers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'triggers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'triggers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      triggersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'triggers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition> userIdMatches(
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

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterFilterCondition>
      wasSuccessfullyResistedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasSuccessfullyResisted',
        value: value,
      ));
    });
  }
}

extension CravingEntryQueryObject
    on QueryBuilder<CravingEntry, CravingEntry, QFilterCondition> {}

extension CravingEntryQueryLinks
    on QueryBuilder<CravingEntry, CravingEntry, QFilterCondition> {}

extension CravingEntryQuerySortBy
    on QueryBuilder<CravingEntry, CravingEntry, QSortBy> {
  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByFinalIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalIntensity', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByFinalIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalIntensity', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByInitialIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialIntensity', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByInitialIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialIntensity', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByIntensityReduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityReduction', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByIntensityReductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityReduction', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByIsOngoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByIsOngoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByOutcome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByOutcomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByWasSuccessfullyResisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessfullyResisted', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      sortByWasSuccessfullyResistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessfullyResisted', Sort.desc);
    });
  }
}

extension CravingEntryQuerySortThenBy
    on QueryBuilder<CravingEntry, CravingEntry, QSortThenBy> {
  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByFinalIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalIntensity', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByFinalIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalIntensity', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByInitialIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialIntensity', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByInitialIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialIntensity', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByIntensityReduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityReduction', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByIntensityReductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityReduction', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByIsOngoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByIsOngoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByOutcome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByOutcomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByWasSuccessfullyResisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessfullyResisted', Sort.asc);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QAfterSortBy>
      thenByWasSuccessfullyResistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessfullyResisted', Sort.desc);
    });
  }
}

extension CravingEntryQueryWhereDistinct
    on QueryBuilder<CravingEntry, CravingEntry, QDistinct> {
  QueryBuilder<CravingEntry, CravingEntry, QDistinct>
      distinctByCopingStrategiesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'copingStrategiesUsed');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct>
      distinctByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMinutes');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByFinalIntensity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalIntensity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct>
      distinctByInitialIntensity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initialIntensity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct>
      distinctByIntensityReduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensityReduction');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByIsOngoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOngoing');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByOutcome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outcome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByTriggers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'triggers');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CravingEntry, CravingEntry, QDistinct>
      distinctByWasSuccessfullyResisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasSuccessfullyResisted');
    });
  }
}

extension CravingEntryQueryProperty
    on QueryBuilder<CravingEntry, CravingEntry, QQueryProperty> {
  QueryBuilder<CravingEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CravingEntry, List<String>, QQueryOperations>
      copingStrategiesUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'copingStrategiesUsed');
    });
  }

  QueryBuilder<CravingEntry, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CravingEntry, int?, QQueryOperations> durationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMinutes');
    });
  }

  QueryBuilder<CravingEntry, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<CravingEntry, CravingIntensity?, QQueryOperations>
      finalIntensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalIntensity');
    });
  }

  QueryBuilder<CravingEntry, CravingIntensity, QQueryOperations>
      initialIntensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initialIntensity');
    });
  }

  QueryBuilder<CravingEntry, int?, QQueryOperations>
      intensityReductionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensityReduction');
    });
  }

  QueryBuilder<CravingEntry, bool, QQueryOperations> isOngoingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOngoing');
    });
  }

  QueryBuilder<CravingEntry, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<CravingEntry, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CravingEntry, CravingOutcome?, QQueryOperations>
      outcomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outcome');
    });
  }

  QueryBuilder<CravingEntry, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<CravingEntry, List<String>, QQueryOperations>
      triggersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'triggers');
    });
  }

  QueryBuilder<CravingEntry, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CravingEntry, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<CravingEntry, bool, QQueryOperations>
      wasSuccessfullyResistedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasSuccessfullyResisted');
    });
  }
}
