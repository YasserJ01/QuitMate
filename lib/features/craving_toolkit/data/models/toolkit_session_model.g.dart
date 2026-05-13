// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toolkit_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetToolkitSessionModelCollection on Isar {
  IsarCollection<ToolkitSessionModel> get toolkitSessionModels =>
      this.collection();
}

const ToolkitSessionModelSchema = CollectionSchema(
  name: r'ToolkitSessionModel',
  id: -1453013249712383135,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'exerciseCategory': PropertySchema(
      id: 1,
      name: r'exerciseCategory',
      type: IsarType.string,
    ),
    r'exerciseId': PropertySchema(
      id: 2,
      name: r'exerciseId',
      type: IsarType.string,
    ),
    r'exerciseName': PropertySchema(
      id: 3,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'feedbackRating': PropertySchema(
      id: 4,
      name: r'feedbackRating',
      type: IsarType.long,
    ),
    r'linkedJournalEntryId': PropertySchema(
      id: 5,
      name: r'linkedJournalEntryId',
      type: IsarType.string,
    ),
    r'mode': PropertySchema(
      id: 6,
      name: r'mode',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 7,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasCompleted': PropertySchema(
      id: 9,
      name: r'wasCompleted',
      type: IsarType.bool,
    )
  },
  estimateSize: _toolkitSessionModelEstimateSize,
  serialize: _toolkitSessionModelSerialize,
  deserialize: _toolkitSessionModelDeserialize,
  deserializeProp: _toolkitSessionModelDeserializeProp,
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
    r'exerciseId': IndexSchema(
      id: -5431545612219001672,
      name: r'exerciseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'exerciseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'startedAt': IndexSchema(
      id: 8114395319341636597,
      name: r'startedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _toolkitSessionModelGetId,
  getLinks: _toolkitSessionModelGetLinks,
  attach: _toolkitSessionModelAttach,
  version: '3.1.0+1',
);

int _toolkitSessionModelEstimateSize(
  ToolkitSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exerciseCategory.length * 3;
  bytesCount += 3 + object.exerciseId.length * 3;
  bytesCount += 3 + object.exerciseName.length * 3;
  {
    final value = object.linkedJournalEntryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mode.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _toolkitSessionModelSerialize(
  ToolkitSessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeString(offsets[1], object.exerciseCategory);
  writer.writeString(offsets[2], object.exerciseId);
  writer.writeString(offsets[3], object.exerciseName);
  writer.writeLong(offsets[4], object.feedbackRating);
  writer.writeString(offsets[5], object.linkedJournalEntryId);
  writer.writeString(offsets[6], object.mode);
  writer.writeDateTime(offsets[7], object.startedAt);
  writer.writeString(offsets[8], object.userId);
  writer.writeBool(offsets[9], object.wasCompleted);
}

ToolkitSessionModel _toolkitSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToolkitSessionModel();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.exerciseCategory = reader.readString(offsets[1]);
  object.exerciseId = reader.readString(offsets[2]);
  object.exerciseName = reader.readString(offsets[3]);
  object.feedbackRating = reader.readLongOrNull(offsets[4]);
  object.id = id;
  object.linkedJournalEntryId = reader.readStringOrNull(offsets[5]);
  object.mode = reader.readString(offsets[6]);
  object.startedAt = reader.readDateTime(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  return object;
}

P _toolkitSessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _toolkitSessionModelGetId(ToolkitSessionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _toolkitSessionModelGetLinks(
    ToolkitSessionModel object) {
  return [];
}

void _toolkitSessionModelAttach(
    IsarCollection<dynamic> col, Id id, ToolkitSessionModel object) {
  object.id = id;
}

extension ToolkitSessionModelQueryWhereSort
    on QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QWhere> {
  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhere>
      anyStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startedAt'),
      );
    });
  }
}

extension ToolkitSessionModelQueryWhere
    on QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QWhereClause> {
  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      exerciseIdEqualTo(String exerciseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'exerciseId',
        value: [exerciseId],
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      exerciseIdNotEqualTo(String exerciseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exerciseId',
              lower: [],
              upper: [exerciseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exerciseId',
              lower: [exerciseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exerciseId',
              lower: [exerciseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exerciseId',
              lower: [],
              upper: [exerciseId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      startedAtEqualTo(DateTime startedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startedAt',
        value: [startedAt],
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      startedAtNotEqualTo(DateTime startedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startedAt',
              lower: [],
              upper: [startedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startedAt',
              lower: [startedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startedAt',
              lower: [startedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startedAt',
              lower: [],
              upper: [startedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      startedAtGreaterThan(
    DateTime startedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startedAt',
        lower: [startedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      startedAtLessThan(
    DateTime startedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startedAt',
        lower: [],
        upper: [startedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterWhereClause>
      startedAtBetween(
    DateTime lowerStartedAt,
    DateTime upperStartedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startedAt',
        lower: [lowerStartedAt],
        includeLower: includeLower,
        upper: [upperStartedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ToolkitSessionModelQueryFilter on QueryBuilder<ToolkitSessionModel,
    ToolkitSessionModel, QFilterCondition> {
  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      feedbackRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feedbackRating',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      feedbackRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feedbackRating',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      feedbackRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedbackRating',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      feedbackRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedbackRating',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      feedbackRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedbackRating',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      feedbackRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedbackRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkedJournalEntryId',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkedJournalEntryId',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedJournalEntryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkedJournalEntryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkedJournalEntryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkedJournalEntryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkedJournalEntryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkedJournalEntryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkedJournalEntryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkedJournalEntryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedJournalEntryId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      linkedJournalEntryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkedJournalEntryId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mode',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      modeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mode',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      startedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterFilterCondition>
      wasCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasCompleted',
        value: value,
      ));
    });
  }
}

extension ToolkitSessionModelQueryObject on QueryBuilder<ToolkitSessionModel,
    ToolkitSessionModel, QFilterCondition> {}

extension ToolkitSessionModelQueryLinks on QueryBuilder<ToolkitSessionModel,
    ToolkitSessionModel, QFilterCondition> {}

extension ToolkitSessionModelQuerySortBy
    on QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QSortBy> {
  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByExerciseCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCategory', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByExerciseCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCategory', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByFeedbackRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackRating', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByFeedbackRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackRating', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByLinkedJournalEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedJournalEntryId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByLinkedJournalEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedJournalEntryId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByWasCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCompleted', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      sortByWasCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCompleted', Sort.desc);
    });
  }
}

extension ToolkitSessionModelQuerySortThenBy
    on QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QSortThenBy> {
  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByExerciseCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCategory', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByExerciseCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseCategory', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByFeedbackRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackRating', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByFeedbackRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackRating', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByLinkedJournalEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedJournalEntryId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByLinkedJournalEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedJournalEntryId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByWasCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCompleted', Sort.asc);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QAfterSortBy>
      thenByWasCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCompleted', Sort.desc);
    });
  }
}

extension ToolkitSessionModelQueryWhereDistinct
    on QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct> {
  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByExerciseCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByExerciseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByExerciseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByFeedbackRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedbackRating');
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByLinkedJournalEntryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkedJournalEntryId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QDistinct>
      distinctByWasCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasCompleted');
    });
  }
}

extension ToolkitSessionModelQueryProperty
    on QueryBuilder<ToolkitSessionModel, ToolkitSessionModel, QQueryProperty> {
  QueryBuilder<ToolkitSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ToolkitSessionModel, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<ToolkitSessionModel, String, QQueryOperations>
      exerciseCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseCategory');
    });
  }

  QueryBuilder<ToolkitSessionModel, String, QQueryOperations>
      exerciseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseId');
    });
  }

  QueryBuilder<ToolkitSessionModel, String, QQueryOperations>
      exerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseName');
    });
  }

  QueryBuilder<ToolkitSessionModel, int?, QQueryOperations>
      feedbackRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedbackRating');
    });
  }

  QueryBuilder<ToolkitSessionModel, String?, QQueryOperations>
      linkedJournalEntryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkedJournalEntryId');
    });
  }

  QueryBuilder<ToolkitSessionModel, String, QQueryOperations> modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mode');
    });
  }

  QueryBuilder<ToolkitSessionModel, DateTime, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<ToolkitSessionModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<ToolkitSessionModel, bool, QQueryOperations>
      wasCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasCompleted');
    });
  }
}
