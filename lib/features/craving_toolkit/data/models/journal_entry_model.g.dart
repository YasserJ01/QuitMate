// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJournalEntryModelCollection on Isar {
  IsarCollection<JournalEntryModel> get journalEntryModels => this.collection();
}

const JournalEntryModelSchema = CollectionSchema(
  name: r'JournalEntryModel',
  id: 3211955384174486103,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'entryId': PropertySchema(
      id: 2,
      name: r'entryId',
      type: IsarType.string,
    ),
    r'moodTag': PropertySchema(
      id: 3,
      name: r'moodTag',
      type: IsarType.string,
    ),
    r'sourceExerciseId': PropertySchema(
      id: 4,
      name: r'sourceExerciseId',
      type: IsarType.string,
    ),
    r'sourceExerciseName': PropertySchema(
      id: 5,
      name: r'sourceExerciseName',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 7,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _journalEntryModelEstimateSize,
  serialize: _journalEntryModelSerialize,
  deserialize: _journalEntryModelDeserialize,
  deserializeProp: _journalEntryModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'entryId': IndexSchema(
      id: 3733379884318738402,
      name: r'entryId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entryId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _journalEntryModelGetId,
  getLinks: _journalEntryModelGetLinks,
  attach: _journalEntryModelAttach,
  version: '3.1.0+1',
);

int _journalEntryModelEstimateSize(
  JournalEntryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.entryId.length * 3;
  {
    final value = object.moodTag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceExerciseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceExerciseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _journalEntryModelSerialize(
  JournalEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.entryId);
  writer.writeString(offsets[3], object.moodTag);
  writer.writeString(offsets[4], object.sourceExerciseId);
  writer.writeString(offsets[5], object.sourceExerciseName);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.userId);
}

JournalEntryModel _journalEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JournalEntryModel();
  object.content = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.entryId = reader.readString(offsets[2]);
  object.id = id;
  object.moodTag = reader.readStringOrNull(offsets[3]);
  object.sourceExerciseId = reader.readStringOrNull(offsets[4]);
  object.sourceExerciseName = reader.readStringOrNull(offsets[5]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[6]);
  object.userId = reader.readString(offsets[7]);
  return object;
}

P _journalEntryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _journalEntryModelGetId(JournalEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _journalEntryModelGetLinks(
    JournalEntryModel object) {
  return [];
}

void _journalEntryModelAttach(
    IsarCollection<dynamic> col, Id id, JournalEntryModel object) {
  object.id = id;
}

extension JournalEntryModelByIndex on IsarCollection<JournalEntryModel> {
  Future<JournalEntryModel?> getByEntryId(String entryId) {
    return getByIndex(r'entryId', [entryId]);
  }

  JournalEntryModel? getByEntryIdSync(String entryId) {
    return getByIndexSync(r'entryId', [entryId]);
  }

  Future<bool> deleteByEntryId(String entryId) {
    return deleteByIndex(r'entryId', [entryId]);
  }

  bool deleteByEntryIdSync(String entryId) {
    return deleteByIndexSync(r'entryId', [entryId]);
  }

  Future<List<JournalEntryModel?>> getAllByEntryId(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'entryId', values);
  }

  List<JournalEntryModel?> getAllByEntryIdSync(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'entryId', values);
  }

  Future<int> deleteAllByEntryId(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'entryId', values);
  }

  int deleteAllByEntryIdSync(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'entryId', values);
  }

  Future<Id> putByEntryId(JournalEntryModel object) {
    return putByIndex(r'entryId', object);
  }

  Id putByEntryIdSync(JournalEntryModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'entryId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEntryId(List<JournalEntryModel> objects) {
    return putAllByIndex(r'entryId', objects);
  }

  List<Id> putAllByEntryIdSync(List<JournalEntryModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'entryId', objects, saveLinks: saveLinks);
  }
}

extension JournalEntryModelQueryWhereSort
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QWhere> {
  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension JournalEntryModelQueryWhere
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QWhereClause> {
  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      entryIdEqualTo(String entryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entryId',
        value: [entryId],
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      entryIdNotEqualTo(String entryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [],
              upper: [entryId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [entryId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [entryId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [],
              upper: [entryId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JournalEntryModelQueryFilter
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QFilterCondition> {
  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryId',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      entryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entryId',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moodTag',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moodTag',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moodTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moodTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moodTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moodTag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'moodTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'moodTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'moodTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'moodTag',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moodTag',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      moodTagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'moodTag',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceExerciseId',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceExerciseId',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceExerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceExerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceExerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceExerciseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceExerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceExerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceExerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceExerciseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceExerciseId',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceExerciseId',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceExerciseName',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceExerciseName',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceExerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceExerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceExerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceExerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceExerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceExerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceExerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceExerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceExerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      sourceExerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceExerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
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

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension JournalEntryModelQueryObject
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QFilterCondition> {}

extension JournalEntryModelQueryLinks
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QFilterCondition> {}

extension JournalEntryModelQuerySortBy
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QSortBy> {
  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByMoodTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodTag', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByMoodTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodTag', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortBySourceExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortBySourceExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortBySourceExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseName', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortBySourceExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseName', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension JournalEntryModelQuerySortThenBy
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QSortThenBy> {
  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByMoodTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodTag', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByMoodTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodTag', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenBySourceExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenBySourceExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenBySourceExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseName', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenBySourceExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceExerciseName', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension JournalEntryModelQueryWhereDistinct
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct> {
  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctByContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctByEntryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctByMoodTag({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moodTag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctBySourceExerciseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceExerciseId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctBySourceExerciseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceExerciseName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<JournalEntryModel, JournalEntryModel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension JournalEntryModelQueryProperty
    on QueryBuilder<JournalEntryModel, JournalEntryModel, QQueryProperty> {
  QueryBuilder<JournalEntryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JournalEntryModel, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<JournalEntryModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<JournalEntryModel, String, QQueryOperations> entryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryId');
    });
  }

  QueryBuilder<JournalEntryModel, String?, QQueryOperations> moodTagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moodTag');
    });
  }

  QueryBuilder<JournalEntryModel, String?, QQueryOperations>
      sourceExerciseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceExerciseId');
    });
  }

  QueryBuilder<JournalEntryModel, String?, QQueryOperations>
      sourceExerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceExerciseName');
    });
  }

  QueryBuilder<JournalEntryModel, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<JournalEntryModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
