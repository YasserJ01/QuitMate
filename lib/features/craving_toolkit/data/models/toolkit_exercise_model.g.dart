// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toolkit_exercise_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetToolkitExerciseModelCollection on Isar {
  IsarCollection<ToolkitExerciseModel> get toolkitExerciseModels =>
      this.collection();
}

const ToolkitExerciseModelSchema = CollectionSchema(
  name: r'ToolkitExerciseModel',
  id: -2407648919107861990,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'durationEstimateSeconds': PropertySchema(
      id: 1,
      name: r'durationEstimateSeconds',
      type: IsarType.long,
    ),
    r'exerciseId': PropertySchema(
      id: 2,
      name: r'exerciseId',
      type: IsarType.string,
    ),
    r'fullInstructions': PropertySchema(
      id: 3,
      name: r'fullInstructions',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 4,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'isSharedBothModes': PropertySchema(
      id: 5,
      name: r'isSharedBothModes',
      type: IsarType.bool,
    ),
    r'lastUsedAt': PropertySchema(
      id: 6,
      name: r'lastUsedAt',
      type: IsarType.dateTime,
    ),
    r'modeFilter': PropertySchema(
      id: 7,
      name: r'modeFilter',
      type: IsarType.string,
    ),
    r'modeSpecificNote': PropertySchema(
      id: 8,
      name: r'modeSpecificNote',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'seededAt': PropertySchema(
      id: 10,
      name: r'seededAt',
      type: IsarType.dateTime,
    ),
    r'shortDescription': PropertySchema(
      id: 11,
      name: r'shortDescription',
      type: IsarType.string,
    )
  },
  estimateSize: _toolkitExerciseModelEstimateSize,
  serialize: _toolkitExerciseModelSerialize,
  deserialize: _toolkitExerciseModelDeserialize,
  deserializeProp: _toolkitExerciseModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'exerciseId': IndexSchema(
      id: -5431545612219001672,
      name: r'exerciseId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'exerciseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'isFavorite': IndexSchema(
      id: 5742774614603939776,
      name: r'isFavorite',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isFavorite',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'lastUsedAt': IndexSchema(
      id: 458483797936957613,
      name: r'lastUsedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUsedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _toolkitExerciseModelGetId,
  getLinks: _toolkitExerciseModelGetLinks,
  attach: _toolkitExerciseModelAttach,
  version: '3.1.0+1',
);

int _toolkitExerciseModelEstimateSize(
  ToolkitExerciseModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.exerciseId.length * 3;
  bytesCount += 3 + object.fullInstructions.length * 3;
  {
    final value = object.modeFilter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.modeSpecificNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.shortDescription.length * 3;
  return bytesCount;
}

void _toolkitExerciseModelSerialize(
  ToolkitExerciseModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeLong(offsets[1], object.durationEstimateSeconds);
  writer.writeString(offsets[2], object.exerciseId);
  writer.writeString(offsets[3], object.fullInstructions);
  writer.writeBool(offsets[4], object.isFavorite);
  writer.writeBool(offsets[5], object.isSharedBothModes);
  writer.writeDateTime(offsets[6], object.lastUsedAt);
  writer.writeString(offsets[7], object.modeFilter);
  writer.writeString(offsets[8], object.modeSpecificNote);
  writer.writeString(offsets[9], object.name);
  writer.writeDateTime(offsets[10], object.seededAt);
  writer.writeString(offsets[11], object.shortDescription);
}

ToolkitExerciseModel _toolkitExerciseModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToolkitExerciseModel();
  object.category = reader.readString(offsets[0]);
  object.durationEstimateSeconds = reader.readLong(offsets[1]);
  object.exerciseId = reader.readString(offsets[2]);
  object.fullInstructions = reader.readString(offsets[3]);
  object.id = id;
  object.isFavorite = reader.readBool(offsets[4]);
  object.isSharedBothModes = reader.readBool(offsets[5]);
  object.lastUsedAt = reader.readDateTimeOrNull(offsets[6]);
  object.modeFilter = reader.readStringOrNull(offsets[7]);
  object.modeSpecificNote = reader.readStringOrNull(offsets[8]);
  object.name = reader.readString(offsets[9]);
  object.seededAt = reader.readDateTime(offsets[10]);
  object.shortDescription = reader.readString(offsets[11]);
  return object;
}

P _toolkitExerciseModelDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _toolkitExerciseModelGetId(ToolkitExerciseModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _toolkitExerciseModelGetLinks(
    ToolkitExerciseModel object) {
  return [];
}

void _toolkitExerciseModelAttach(
    IsarCollection<dynamic> col, Id id, ToolkitExerciseModel object) {
  object.id = id;
}

extension ToolkitExerciseModelByIndex on IsarCollection<ToolkitExerciseModel> {
  Future<ToolkitExerciseModel?> getByExerciseId(String exerciseId) {
    return getByIndex(r'exerciseId', [exerciseId]);
  }

  ToolkitExerciseModel? getByExerciseIdSync(String exerciseId) {
    return getByIndexSync(r'exerciseId', [exerciseId]);
  }

  Future<bool> deleteByExerciseId(String exerciseId) {
    return deleteByIndex(r'exerciseId', [exerciseId]);
  }

  bool deleteByExerciseIdSync(String exerciseId) {
    return deleteByIndexSync(r'exerciseId', [exerciseId]);
  }

  Future<List<ToolkitExerciseModel?>> getAllByExerciseId(
      List<String> exerciseIdValues) {
    final values = exerciseIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'exerciseId', values);
  }

  List<ToolkitExerciseModel?> getAllByExerciseIdSync(
      List<String> exerciseIdValues) {
    final values = exerciseIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'exerciseId', values);
  }

  Future<int> deleteAllByExerciseId(List<String> exerciseIdValues) {
    final values = exerciseIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'exerciseId', values);
  }

  int deleteAllByExerciseIdSync(List<String> exerciseIdValues) {
    final values = exerciseIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'exerciseId', values);
  }

  Future<Id> putByExerciseId(ToolkitExerciseModel object) {
    return putByIndex(r'exerciseId', object);
  }

  Id putByExerciseIdSync(ToolkitExerciseModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'exerciseId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExerciseId(List<ToolkitExerciseModel> objects) {
    return putAllByIndex(r'exerciseId', objects);
  }

  List<Id> putAllByExerciseIdSync(List<ToolkitExerciseModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'exerciseId', objects, saveLinks: saveLinks);
  }
}

extension ToolkitExerciseModelQueryWhereSort
    on QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QWhere> {
  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhere>
      anyIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isFavorite'),
      );
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhere>
      anyLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUsedAt'),
      );
    });
  }
}

extension ToolkitExerciseModelQueryWhere
    on QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QWhereClause> {
  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      exerciseIdEqualTo(String exerciseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'exerciseId',
        value: [exerciseId],
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      isFavoriteEqualTo(bool isFavorite) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isFavorite',
        value: [isFavorite],
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      isFavoriteNotEqualTo(bool isFavorite) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [],
              upper: [isFavorite],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [isFavorite],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [isFavorite],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [],
              upper: [isFavorite],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUsedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUsedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtEqualTo(DateTime? lastUsedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUsedAt',
        value: [lastUsedAt],
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtNotEqualTo(DateTime? lastUsedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUsedAt',
              lower: [],
              upper: [lastUsedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUsedAt',
              lower: [lastUsedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUsedAt',
              lower: [lastUsedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUsedAt',
              lower: [],
              upper: [lastUsedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtGreaterThan(
    DateTime? lastUsedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUsedAt',
        lower: [lastUsedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtLessThan(
    DateTime? lastUsedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUsedAt',
        lower: [],
        upper: [lastUsedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterWhereClause>
      lastUsedAtBetween(
    DateTime? lowerLastUsedAt,
    DateTime? upperLastUsedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUsedAt',
        lower: [lowerLastUsedAt],
        includeLower: includeLower,
        upper: [upperLastUsedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ToolkitExerciseModelQueryFilter on QueryBuilder<ToolkitExerciseModel,
    ToolkitExerciseModel, QFilterCondition> {
  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> durationEstimateSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationEstimateSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> durationEstimateSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationEstimateSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> durationEstimateSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationEstimateSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> durationEstimateSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationEstimateSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdEqualTo(
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdGreaterThan(
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdLessThan(
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdBetween(
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdStartsWith(
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdEndsWith(
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      exerciseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      exerciseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> exerciseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullInstructions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      fullInstructionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      fullInstructionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullInstructions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> fullInstructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> isSharedBothModesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSharedBothModes',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> lastUsedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUsedAt',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> lastUsedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUsedAt',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> lastUsedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> lastUsedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> lastUsedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> lastUsedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'modeFilter',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'modeFilter',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modeFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modeFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modeFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modeFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modeFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      modeFilterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modeFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      modeFilterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modeFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeFilterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modeFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'modeSpecificNote',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'modeSpecificNote',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeSpecificNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modeSpecificNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modeSpecificNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modeSpecificNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modeSpecificNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modeSpecificNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      modeSpecificNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modeSpecificNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      modeSpecificNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modeSpecificNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeSpecificNote',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> modeSpecificNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modeSpecificNote',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
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

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> seededAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seededAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> seededAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seededAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> seededAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seededAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> seededAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seededAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      shortDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
          QAfterFilterCondition>
      shortDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel,
      QAfterFilterCondition> shortDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortDescription',
        value: '',
      ));
    });
  }
}

extension ToolkitExerciseModelQueryObject on QueryBuilder<ToolkitExerciseModel,
    ToolkitExerciseModel, QFilterCondition> {}

extension ToolkitExerciseModelQueryLinks on QueryBuilder<ToolkitExerciseModel,
    ToolkitExerciseModel, QFilterCondition> {}

extension ToolkitExerciseModelQuerySortBy
    on QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QSortBy> {
  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByDurationEstimateSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationEstimateSeconds', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByDurationEstimateSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationEstimateSeconds', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByFullInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullInstructions', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByFullInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullInstructions', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByIsSharedBothModes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedBothModes', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByIsSharedBothModesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedBothModes', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByModeFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeFilter', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByModeFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeFilter', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByModeSpecificNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeSpecificNote', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByModeSpecificNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeSpecificNote', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortBySeededAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seededAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortBySeededAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seededAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByShortDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      sortByShortDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.desc);
    });
  }
}

extension ToolkitExerciseModelQuerySortThenBy
    on QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QSortThenBy> {
  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByDurationEstimateSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationEstimateSeconds', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByDurationEstimateSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationEstimateSeconds', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByFullInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullInstructions', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByFullInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullInstructions', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByIsSharedBothModes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedBothModes', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByIsSharedBothModesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedBothModes', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByModeFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeFilter', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByModeFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeFilter', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByModeSpecificNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeSpecificNote', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByModeSpecificNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeSpecificNote', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenBySeededAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seededAt', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenBySeededAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seededAt', Sort.desc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByShortDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.asc);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QAfterSortBy>
      thenByShortDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.desc);
    });
  }
}

extension ToolkitExerciseModelQueryWhereDistinct
    on QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct> {
  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByDurationEstimateSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationEstimateSeconds');
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByExerciseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByFullInstructions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullInstructions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByIsSharedBothModes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSharedBothModes');
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsedAt');
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByModeFilter({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modeFilter', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByModeSpecificNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modeSpecificNote',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctBySeededAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seededAt');
    });
  }

  QueryBuilder<ToolkitExerciseModel, ToolkitExerciseModel, QDistinct>
      distinctByShortDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortDescription',
          caseSensitive: caseSensitive);
    });
  }
}

extension ToolkitExerciseModelQueryProperty on QueryBuilder<
    ToolkitExerciseModel, ToolkitExerciseModel, QQueryProperty> {
  QueryBuilder<ToolkitExerciseModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ToolkitExerciseModel, int, QQueryOperations>
      durationEstimateSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationEstimateSeconds');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String, QQueryOperations>
      exerciseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseId');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String, QQueryOperations>
      fullInstructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullInstructions');
    });
  }

  QueryBuilder<ToolkitExerciseModel, bool, QQueryOperations>
      isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<ToolkitExerciseModel, bool, QQueryOperations>
      isSharedBothModesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSharedBothModes');
    });
  }

  QueryBuilder<ToolkitExerciseModel, DateTime?, QQueryOperations>
      lastUsedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsedAt');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String?, QQueryOperations>
      modeFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modeFilter');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String?, QQueryOperations>
      modeSpecificNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modeSpecificNote');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ToolkitExerciseModel, DateTime, QQueryOperations>
      seededAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seededAt');
    });
  }

  QueryBuilder<ToolkitExerciseModel, String, QQueryOperations>
      shortDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortDescription');
    });
  }
}
