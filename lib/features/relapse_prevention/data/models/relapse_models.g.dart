// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relapse_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRelapseContactCollection on Isar {
  IsarCollection<RelapseContact> get relapseContacts => this.collection();
}

const RelapseContactSchema = CollectionSchema(
  name: r'RelapseContact',
  id: -8978352683074308136,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'displayOrder': PropertySchema(
      id: 1,
      name: r'displayOrder',
      type: IsarType.long,
    ),
    r'formattedPhone': PropertySchema(
      id: 2,
      name: r'formattedPhone',
      type: IsarType.string,
    ),
    r'hasPhone': PropertySchema(
      id: 3,
      name: r'hasPhone',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 6,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'relationship': PropertySchema(
      id: 7,
      name: r'relationship',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _relapseContactEstimateSize,
  serialize: _relapseContactSerialize,
  deserialize: _relapseContactDeserialize,
  deserializeProp: _relapseContactDeserializeProp,
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
  getId: _relapseContactGetId,
  getLinks: _relapseContactGetLinks,
  attach: _relapseContactAttach,
  version: '3.1.0+1',
);

int _relapseContactEstimateSize(
  RelapseContact object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.formattedPhone.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.relationship;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _relapseContactSerialize(
  RelapseContact object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.displayOrder);
  writer.writeString(offsets[2], object.formattedPhone);
  writer.writeBool(offsets[3], object.hasPhone);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.notes);
  writer.writeString(offsets[6], object.phoneNumber);
  writer.writeString(offsets[7], object.relationship);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeString(offsets[9], object.userId);
}

RelapseContact _relapseContactDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RelapseContact();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.displayOrder = reader.readLong(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[4]);
  object.notes = reader.readStringOrNull(offsets[5]);
  object.phoneNumber = reader.readStringOrNull(offsets[6]);
  object.relationship = reader.readStringOrNull(offsets[7]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[8]);
  object.userId = reader.readString(offsets[9]);
  return object;
}

P _relapseContactDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _relapseContactGetId(RelapseContact object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _relapseContactGetLinks(RelapseContact object) {
  return [];
}

void _relapseContactAttach(
    IsarCollection<dynamic> col, Id id, RelapseContact object) {
  object.id = id;
}

extension RelapseContactQueryWhereSort
    on QueryBuilder<RelapseContact, RelapseContact, QWhere> {
  QueryBuilder<RelapseContact, RelapseContact, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RelapseContactQueryWhere
    on QueryBuilder<RelapseContact, RelapseContact, QWhereClause> {
  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause> idBetween(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterWhereClause>
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

extension RelapseContactQueryFilter
    on QueryBuilder<RelapseContact, RelapseContact, QFilterCondition> {
  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      displayOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      displayOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      displayOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      displayOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      formattedPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      hasPhoneEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPhone',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relationship',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relationship',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relationship',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'relationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'relationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'relationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'relationship',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relationship',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      relationshipIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'relationship',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
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

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension RelapseContactQueryObject
    on QueryBuilder<RelapseContact, RelapseContact, QFilterCondition> {}

extension RelapseContactQueryLinks
    on QueryBuilder<RelapseContact, RelapseContact, QFilterCondition> {}

extension RelapseContactQuerySortBy
    on QueryBuilder<RelapseContact, RelapseContact, QSortBy> {
  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByDisplayOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByDisplayOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByFormattedPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPhone', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByFormattedPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPhone', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByHasPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhone', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByHasPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhone', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByRelationship() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationship', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByRelationshipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationship', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RelapseContactQuerySortThenBy
    on QueryBuilder<RelapseContact, RelapseContact, QSortThenBy> {
  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByDisplayOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByDisplayOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByFormattedPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPhone', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByFormattedPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPhone', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByHasPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhone', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByHasPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhone', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByRelationship() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationship', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByRelationshipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationship', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RelapseContactQueryWhereDistinct
    on QueryBuilder<RelapseContact, RelapseContact, QDistinct> {
  QueryBuilder<RelapseContact, RelapseContact, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct>
      distinctByDisplayOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayOrder');
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct>
      distinctByFormattedPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct> distinctByHasPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasPhone');
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct>
      distinctByRelationship({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relationship', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RelapseContact, RelapseContact, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension RelapseContactQueryProperty
    on QueryBuilder<RelapseContact, RelapseContact, QQueryProperty> {
  QueryBuilder<RelapseContact, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RelapseContact, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RelapseContact, int, QQueryOperations> displayOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayOrder');
    });
  }

  QueryBuilder<RelapseContact, String, QQueryOperations>
      formattedPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedPhone');
    });
  }

  QueryBuilder<RelapseContact, bool, QQueryOperations> hasPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasPhone');
    });
  }

  QueryBuilder<RelapseContact, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RelapseContact, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<RelapseContact, String?, QQueryOperations>
      phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<RelapseContact, String?, QQueryOperations>
      relationshipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relationship');
    });
  }

  QueryBuilder<RelapseContact, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RelapseContact, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRelapsePlanCollection on Isar {
  IsarCollection<RelapsePlan> get relapsePlans => this.collection();
}

const RelapsePlanSchema = CollectionSchema(
  name: r'RelapsePlan',
  id: -5877030735699703689,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customSteps': PropertySchema(
      id: 1,
      name: r'customSteps',
      type: IsarType.stringList,
    ),
    r'lastReviewedAt': PropertySchema(
      id: 2,
      name: r'lastReviewedAt',
      type: IsarType.dateTime,
    ),
    r'nextReviewDate': PropertySchema(
      id: 3,
      name: r'nextReviewDate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    ),
    r'panicSteps': PropertySchema(
      id: 5,
      name: r'panicSteps',
      type: IsarType.objectList,
      target: r'PanicStep',
    ),
    r'personalRecoveryNote': PropertySchema(
      id: 6,
      name: r'personalRecoveryNote',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _relapsePlanEstimateSize,
  serialize: _relapsePlanSerialize,
  deserialize: _relapsePlanDeserialize,
  deserializeProp: _relapsePlanDeserializeProp,
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
  embeddedSchemas: {r'PanicStep': PanicStepSchema},
  getId: _relapsePlanGetId,
  getLinks: _relapsePlanGetLinks,
  attach: _relapsePlanAttach,
  version: '3.1.0+1',
);

int _relapsePlanEstimateSize(
  RelapsePlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customSteps.length * 3;
  {
    for (var i = 0; i < object.customSteps.length; i++) {
      final value = object.customSteps[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.panicSteps.length * 3;
  {
    final offsets = allOffsets[PanicStep]!;
    for (var i = 0; i < object.panicSteps.length; i++) {
      final value = object.panicSteps[i];
      bytesCount += PanicStepSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.personalRecoveryNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _relapsePlanSerialize(
  RelapsePlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.customSteps);
  writer.writeDateTime(offsets[2], object.lastReviewedAt);
  writer.writeDateTime(offsets[3], object.nextReviewDate);
  writer.writeString(offsets[4], object.notes);
  writer.writeObjectList<PanicStep>(
    offsets[5],
    allOffsets,
    PanicStepSchema.serialize,
    object.panicSteps,
  );
  writer.writeString(offsets[6], object.personalRecoveryNote);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeString(offsets[8], object.userId);
}

RelapsePlan _relapsePlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RelapsePlan();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.customSteps = reader.readStringList(offsets[1]) ?? [];
  object.id = id;
  object.lastReviewedAt = reader.readDateTimeOrNull(offsets[2]);
  object.nextReviewDate = reader.readDateTimeOrNull(offsets[3]);
  object.notes = reader.readStringOrNull(offsets[4]);
  object.panicSteps = reader.readObjectList<PanicStep>(
        offsets[5],
        PanicStepSchema.deserialize,
        allOffsets,
        PanicStep(),
      ) ??
      [];
  object.personalRecoveryNote = reader.readStringOrNull(offsets[6]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  return object;
}

P _relapsePlanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<PanicStep>(
            offset,
            PanicStepSchema.deserialize,
            allOffsets,
            PanicStep(),
          ) ??
          []) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _relapsePlanGetId(RelapsePlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _relapsePlanGetLinks(RelapsePlan object) {
  return [];
}

void _relapsePlanAttach(
    IsarCollection<dynamic> col, Id id, RelapsePlan object) {
  object.id = id;
}

extension RelapsePlanByIndex on IsarCollection<RelapsePlan> {
  Future<RelapsePlan?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  RelapsePlan? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<RelapsePlan?>> getAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<RelapsePlan?> getAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(RelapsePlan object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(RelapsePlan object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<RelapsePlan> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<RelapsePlan> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension RelapsePlanQueryWhereSort
    on QueryBuilder<RelapsePlan, RelapsePlan, QWhere> {
  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RelapsePlanQueryWhere
    on QueryBuilder<RelapsePlan, RelapsePlan, QWhereClause> {
  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> idBetween(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterWhereClause> userIdNotEqualTo(
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

extension RelapsePlanQueryFilter
    on QueryBuilder<RelapsePlan, RelapsePlan, QFilterCondition> {
  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customSteps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customSteps',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSteps',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customSteps',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customSteps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customSteps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customSteps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customSteps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customSteps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      customStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      lastReviewedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReviewedAt',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      lastReviewedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReviewedAt',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      lastReviewedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      lastReviewedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      lastReviewedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      lastReviewedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReviewedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      nextReviewDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextReviewDate',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      nextReviewDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextReviewDate',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      nextReviewDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextReviewDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      nextReviewDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextReviewDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      nextReviewDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextReviewDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      nextReviewDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextReviewDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesContains(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'panicSteps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'panicSteps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'panicSteps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'panicSteps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'panicSteps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'panicSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'personalRecoveryNote',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'personalRecoveryNote',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalRecoveryNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'personalRecoveryNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'personalRecoveryNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'personalRecoveryNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'personalRecoveryNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'personalRecoveryNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'personalRecoveryNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'personalRecoveryNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalRecoveryNote',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      personalRecoveryNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'personalRecoveryNote',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> userIdContains(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition> userIdMatches(
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

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension RelapsePlanQueryObject
    on QueryBuilder<RelapsePlan, RelapsePlan, QFilterCondition> {
  QueryBuilder<RelapsePlan, RelapsePlan, QAfterFilterCondition>
      panicStepsElement(FilterQuery<PanicStep> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'panicSteps');
    });
  }
}

extension RelapsePlanQueryLinks
    on QueryBuilder<RelapsePlan, RelapsePlan, QFilterCondition> {}

extension RelapsePlanQuerySortBy
    on QueryBuilder<RelapsePlan, RelapsePlan, QSortBy> {
  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      sortByLastReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByNextReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewDate', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      sortByNextReviewDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewDate', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      sortByPersonalRecoveryNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalRecoveryNote', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      sortByPersonalRecoveryNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalRecoveryNote', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RelapsePlanQuerySortThenBy
    on QueryBuilder<RelapsePlan, RelapsePlan, QSortThenBy> {
  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      thenByLastReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByNextReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewDate', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      thenByNextReviewDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewDate', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      thenByPersonalRecoveryNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalRecoveryNote', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy>
      thenByPersonalRecoveryNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalRecoveryNote', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RelapsePlanQueryWhereDistinct
    on QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> {
  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByCustomSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customSteps');
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReviewedAt');
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByNextReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextReviewDate');
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct>
      distinctByPersonalRecoveryNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personalRecoveryNote',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RelapsePlan, RelapsePlan, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension RelapsePlanQueryProperty
    on QueryBuilder<RelapsePlan, RelapsePlan, QQueryProperty> {
  QueryBuilder<RelapsePlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RelapsePlan, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RelapsePlan, List<String>, QQueryOperations>
      customStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customSteps');
    });
  }

  QueryBuilder<RelapsePlan, DateTime?, QQueryOperations>
      lastReviewedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReviewedAt');
    });
  }

  QueryBuilder<RelapsePlan, DateTime?, QQueryOperations>
      nextReviewDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextReviewDate');
    });
  }

  QueryBuilder<RelapsePlan, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<RelapsePlan, List<PanicStep>, QQueryOperations>
      panicStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'panicSteps');
    });
  }

  QueryBuilder<RelapsePlan, String?, QQueryOperations>
      personalRecoveryNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personalRecoveryNote');
    });
  }

  QueryBuilder<RelapsePlan, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RelapsePlan, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PanicStepSchema = Schema(
  name: r'PanicStep',
  id: -3865919517984012450,
  properties: {
    r'actionData': PropertySchema(
      id: 0,
      name: r'actionData',
      type: IsarType.string,
    ),
    r'actionType': PropertySchema(
      id: 1,
      name: r'actionType',
      type: IsarType.string,
      enumMap: _PanicStepactionTypeEnumValueMap,
    ),
    r'contactId': PropertySchema(
      id: 2,
      name: r'contactId',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'displayOrder': PropertySchema(
      id: 4,
      name: r'displayOrder',
      type: IsarType.long,
    ),
    r'icon': PropertySchema(
      id: 5,
      name: r'icon',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 6,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _panicStepEstimateSize,
  serialize: _panicStepSerialize,
  deserialize: _panicStepDeserialize,
  deserializeProp: _panicStepDeserializeProp,
);

int _panicStepEstimateSize(
  PanicStep object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.actionData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.actionType.name.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.icon.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _panicStepSerialize(
  PanicStep object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actionData);
  writer.writeString(offsets[1], object.actionType.name);
  writer.writeLong(offsets[2], object.contactId);
  writer.writeString(offsets[3], object.description);
  writer.writeLong(offsets[4], object.displayOrder);
  writer.writeString(offsets[5], object.icon);
  writer.writeString(offsets[6], object.title);
}

PanicStep _panicStepDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PanicStep();
  object.actionData = reader.readStringOrNull(offsets[0]);
  object.actionType =
      _PanicStepactionTypeValueEnumMap[reader.readStringOrNull(offsets[1])] ??
          PanicActionType.breathing;
  object.contactId = reader.readLongOrNull(offsets[2]);
  object.description = reader.readString(offsets[3]);
  object.displayOrder = reader.readLong(offsets[4]);
  object.icon = reader.readString(offsets[5]);
  object.title = reader.readString(offsets[6]);
  return object;
}

P _panicStepDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_PanicStepactionTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          PanicActionType.breathing) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PanicStepactionTypeEnumValueMap = {
  r'breathing': r'breathing',
  r'contact': r'contact',
  r'grounding': r'grounding',
  r'cbt': r'cbt',
  r'custom': r'custom',
};
const _PanicStepactionTypeValueEnumMap = {
  r'breathing': PanicActionType.breathing,
  r'contact': PanicActionType.contact,
  r'grounding': PanicActionType.grounding,
  r'cbt': PanicActionType.cbt,
  r'custom': PanicActionType.custom,
};

extension PanicStepQueryFilter
    on QueryBuilder<PanicStep, PanicStep, QFilterCondition> {
  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actionData',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actionData',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actionData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actionData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actionData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actionData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionData',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actionData',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionTypeEqualTo(
    PanicActionType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionTypeGreaterThan(
    PanicActionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionTypeLessThan(
    PanicActionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionTypeBetween(
    PanicActionType lower,
    PanicActionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> actionTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionType',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      actionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actionType',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> contactIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactId',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      contactIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactId',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> contactIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactId',
        value: value,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      contactIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactId',
        value: value,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> contactIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactId',
        value: value,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> contactIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> displayOrderEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      displayOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition>
      displayOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> displayOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<PanicStep, PanicStep, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension PanicStepQueryObject
    on QueryBuilder<PanicStep, PanicStep, QFilterCondition> {}
