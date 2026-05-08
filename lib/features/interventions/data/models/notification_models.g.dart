// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduledNotificationCollection on Isar {
  IsarCollection<ScheduledNotification> get scheduledNotifications =>
      this.collection();
}

const ScheduledNotificationSchema = CollectionSchema(
  name: r'ScheduledNotification',
  id: -7228265165637064202,
  properties: {
    r'body': PropertySchema(
      id: 0,
      name: r'body',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isOverdue': PropertySchema(
      id: 2,
      name: r'isOverdue',
      type: IsarType.bool,
    ),
    r'isPending': PropertySchema(
      id: 3,
      name: r'isPending',
      type: IsarType.bool,
    ),
    r'isSent': PropertySchema(
      id: 4,
      name: r'isSent',
      type: IsarType.bool,
    ),
    r'openedAt': PropertySchema(
      id: 5,
      name: r'openedAt',
      type: IsarType.dateTime,
    ),
    r'payload': PropertySchema(
      id: 6,
      name: r'payload',
      type: IsarType.string,
    ),
    r'relatedMoneySaved': PropertySchema(
      id: 7,
      name: r'relatedMoneySaved',
      type: IsarType.long,
    ),
    r'relatedStreakDays': PropertySchema(
      id: 8,
      name: r'relatedStreakDays',
      type: IsarType.long,
    ),
    r'scheduledTime': PropertySchema(
      id: 9,
      name: r'scheduledTime',
      type: IsarType.dateTime,
    ),
    r'sentAt': PropertySchema(
      id: 10,
      name: r'sentAt',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 11,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.string,
      enumMap: _ScheduledNotificationtypeEnumValueMap,
    ),
    r'userId': PropertySchema(
      id: 13,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasDismissed': PropertySchema(
      id: 14,
      name: r'wasDismissed',
      type: IsarType.bool,
    ),
    r'wasOpened': PropertySchema(
      id: 15,
      name: r'wasOpened',
      type: IsarType.bool,
    )
  },
  estimateSize: _scheduledNotificationEstimateSize,
  serialize: _scheduledNotificationSerialize,
  deserialize: _scheduledNotificationDeserialize,
  deserializeProp: _scheduledNotificationDeserializeProp,
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
  getId: _scheduledNotificationGetId,
  getLinks: _scheduledNotificationGetLinks,
  attach: _scheduledNotificationAttach,
  version: '3.1.0+1',
);

int _scheduledNotificationEstimateSize(
  ScheduledNotification object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.body.length * 3;
  {
    final value = object.payload;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _scheduledNotificationSerialize(
  ScheduledNotification object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.isOverdue);
  writer.writeBool(offsets[3], object.isPending);
  writer.writeBool(offsets[4], object.isSent);
  writer.writeDateTime(offsets[5], object.openedAt);
  writer.writeString(offsets[6], object.payload);
  writer.writeLong(offsets[7], object.relatedMoneySaved);
  writer.writeLong(offsets[8], object.relatedStreakDays);
  writer.writeDateTime(offsets[9], object.scheduledTime);
  writer.writeDateTime(offsets[10], object.sentAt);
  writer.writeString(offsets[11], object.title);
  writer.writeString(offsets[12], object.type.name);
  writer.writeString(offsets[13], object.userId);
  writer.writeBool(offsets[14], object.wasDismissed);
  writer.writeBool(offsets[15], object.wasOpened);
}

ScheduledNotification _scheduledNotificationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScheduledNotification();
  object.body = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.isSent = reader.readBool(offsets[4]);
  object.openedAt = reader.readDateTimeOrNull(offsets[5]);
  object.payload = reader.readStringOrNull(offsets[6]);
  object.relatedMoneySaved = reader.readLongOrNull(offsets[7]);
  object.relatedStreakDays = reader.readLongOrNull(offsets[8]);
  object.scheduledTime = reader.readDateTime(offsets[9]);
  object.sentAt = reader.readDateTimeOrNull(offsets[10]);
  object.title = reader.readString(offsets[11]);
  object.type = _ScheduledNotificationtypeValueEnumMap[
          reader.readStringOrNull(offsets[12])] ??
      NotificationType.dailyCheckIn;
  object.userId = reader.readString(offsets[13]);
  object.wasDismissed = reader.readBool(offsets[14]);
  object.wasOpened = reader.readBool(offsets[15]);
  return object;
}

P _scheduledNotificationDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (_ScheduledNotificationtypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          NotificationType.dailyCheckIn) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ScheduledNotificationtypeEnumValueMap = {
  r'dailyCheckIn': r'dailyCheckIn',
  r'encouragement': r'encouragement',
  r'milestone': r'milestone',
  r'cravingTip': r'cravingTip',
  r'microChallenge': r'microChallenge',
  r'progressUpdate': r'progressUpdate',
  r'streakReminder': r'streakReminder',
  r'healthFact': r'healthFact',
  r'motivationalQuote': r'motivationalQuote',
};
const _ScheduledNotificationtypeValueEnumMap = {
  r'dailyCheckIn': NotificationType.dailyCheckIn,
  r'encouragement': NotificationType.encouragement,
  r'milestone': NotificationType.milestone,
  r'cravingTip': NotificationType.cravingTip,
  r'microChallenge': NotificationType.microChallenge,
  r'progressUpdate': NotificationType.progressUpdate,
  r'streakReminder': NotificationType.streakReminder,
  r'healthFact': NotificationType.healthFact,
  r'motivationalQuote': NotificationType.motivationalQuote,
};

Id _scheduledNotificationGetId(ScheduledNotification object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduledNotificationGetLinks(
    ScheduledNotification object) {
  return [];
}

void _scheduledNotificationAttach(
    IsarCollection<dynamic> col, Id id, ScheduledNotification object) {
  object.id = id;
}

extension ScheduledNotificationQueryWhereSort
    on QueryBuilder<ScheduledNotification, ScheduledNotification, QWhere> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduledNotificationQueryWhere on QueryBuilder<ScheduledNotification,
    ScheduledNotification, QWhereClause> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
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

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
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

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
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

extension ScheduledNotificationQueryFilter on QueryBuilder<
    ScheduledNotification, ScheduledNotification, QFilterCondition> {
  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'body',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      bodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      bodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'body',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> isOverdueEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOverdue',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> isPendingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPending',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> isSentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSent',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> openedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openedAt',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> openedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openedAt',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> openedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> openedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> openedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> openedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'payload',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'payload',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payload',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payload',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedMoneySavedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relatedMoneySaved',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedMoneySavedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relatedMoneySaved',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedMoneySavedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relatedMoneySaved',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedMoneySavedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relatedMoneySaved',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedMoneySavedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relatedMoneySaved',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedMoneySavedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relatedMoneySaved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedStreakDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relatedStreakDays',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedStreakDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relatedStreakDays',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedStreakDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relatedStreakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedStreakDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relatedStreakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedStreakDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relatedStreakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> relatedStreakDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relatedStreakDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> scheduledTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> scheduledTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> scheduledTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> scheduledTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sentAt',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sentAt',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sentAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleBetween(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeEqualTo(
    NotificationType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeGreaterThan(
    NotificationType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeLessThan(
    NotificationType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeBetween(
    NotificationType lower,
    NotificationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> wasDismissedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasDismissed',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> wasOpenedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasOpened',
        value: value,
      ));
    });
  }
}

extension ScheduledNotificationQueryObject on QueryBuilder<
    ScheduledNotification, ScheduledNotification, QFilterCondition> {}

extension ScheduledNotificationQueryLinks on QueryBuilder<ScheduledNotification,
    ScheduledNotification, QFilterCondition> {}

extension ScheduledNotificationQuerySortBy
    on QueryBuilder<ScheduledNotification, ScheduledNotification, QSortBy> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByIsOverdueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByIsPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByIsSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByIsSentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByRelatedMoneySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedMoneySaved', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByRelatedMoneySavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedMoneySaved', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByRelatedStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedStreakDays', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByRelatedStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedStreakDays', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByScheduledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByWasDismissed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasDismissed', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByWasDismissedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasDismissed', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByWasOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      sortByWasOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.desc);
    });
  }
}

extension ScheduledNotificationQuerySortThenBy
    on QueryBuilder<ScheduledNotification, ScheduledNotification, QSortThenBy> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIsOverdueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIsPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIsSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByIsSentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByRelatedMoneySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedMoneySaved', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByRelatedMoneySavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedMoneySaved', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByRelatedStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedStreakDays', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByRelatedStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relatedStreakDays', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByScheduledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByWasDismissed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasDismissed', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByWasDismissedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasDismissed', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByWasOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
      thenByWasOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.desc);
    });
  }
}

extension ScheduledNotificationQueryWhereDistinct
    on QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByBody({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOverdue');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPending');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByIsSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSent');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openedAt');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByPayload({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payload', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByRelatedMoneySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relatedMoneySaved');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByRelatedStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relatedStreakDays');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledTime');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sentAt');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByWasDismissed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasDismissed');
    });
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QDistinct>
      distinctByWasOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasOpened');
    });
  }
}

extension ScheduledNotificationQueryProperty on QueryBuilder<
    ScheduledNotification, ScheduledNotification, QQueryProperty> {
  QueryBuilder<ScheduledNotification, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScheduledNotification, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<ScheduledNotification, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ScheduledNotification, bool, QQueryOperations>
      isOverdueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOverdue');
    });
  }

  QueryBuilder<ScheduledNotification, bool, QQueryOperations>
      isPendingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPending');
    });
  }

  QueryBuilder<ScheduledNotification, bool, QQueryOperations> isSentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSent');
    });
  }

  QueryBuilder<ScheduledNotification, DateTime?, QQueryOperations>
      openedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openedAt');
    });
  }

  QueryBuilder<ScheduledNotification, String?, QQueryOperations>
      payloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payload');
    });
  }

  QueryBuilder<ScheduledNotification, int?, QQueryOperations>
      relatedMoneySavedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relatedMoneySaved');
    });
  }

  QueryBuilder<ScheduledNotification, int?, QQueryOperations>
      relatedStreakDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relatedStreakDays');
    });
  }

  QueryBuilder<ScheduledNotification, DateTime, QQueryOperations>
      scheduledTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledTime');
    });
  }

  QueryBuilder<ScheduledNotification, DateTime?, QQueryOperations>
      sentAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sentAt');
    });
  }

  QueryBuilder<ScheduledNotification, String, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ScheduledNotification, NotificationType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ScheduledNotification, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<ScheduledNotification, bool, QQueryOperations>
      wasDismissedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasDismissed');
    });
  }

  QueryBuilder<ScheduledNotification, bool, QQueryOperations>
      wasOpenedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasOpened');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationPreferencesCollection on Isar {
  IsarCollection<NotificationPreferences> get notificationPreferences =>
      this.collection();
}

const NotificationPreferencesSchema = CollectionSchema(
  name: r'NotificationPreferences',
  id: 4550166405663651190,
  properties: {
    r'cravingTipsEnabled': PropertySchema(
      id: 0,
      name: r'cravingTipsEnabled',
      type: IsarType.bool,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dailyCheckInEnabled': PropertySchema(
      id: 2,
      name: r'dailyCheckInEnabled',
      type: IsarType.bool,
    ),
    r'encouragementEnabled': PropertySchema(
      id: 3,
      name: r'encouragementEnabled',
      type: IsarType.bool,
    ),
    r'frequency': PropertySchema(
      id: 4,
      name: r'frequency',
      type: IsarType.string,
      enumMap: _NotificationPreferencesfrequencyEnumValueMap,
    ),
    r'healthFactsEnabled': PropertySchema(
      id: 5,
      name: r'healthFactsEnabled',
      type: IsarType.bool,
    ),
    r'microChallengesEnabled': PropertySchema(
      id: 6,
      name: r'microChallengesEnabled',
      type: IsarType.bool,
    ),
    r'milestoneEnabled': PropertySchema(
      id: 7,
      name: r'milestoneEnabled',
      type: IsarType.bool,
    ),
    r'motivationalQuotesEnabled': PropertySchema(
      id: 8,
      name: r'motivationalQuotesEnabled',
      type: IsarType.bool,
    ),
    r'notificationsEnabled': PropertySchema(
      id: 9,
      name: r'notificationsEnabled',
      type: IsarType.bool,
    ),
    r'preferredHours': PropertySchema(
      id: 10,
      name: r'preferredHours',
      type: IsarType.longList,
    ),
    r'progressUpdatesEnabled': PropertySchema(
      id: 11,
      name: r'progressUpdatesEnabled',
      type: IsarType.bool,
    ),
    r'quietHoursEnabled': PropertySchema(
      id: 12,
      name: r'quietHoursEnabled',
      type: IsarType.bool,
    ),
    r'quietHoursEnd': PropertySchema(
      id: 13,
      name: r'quietHoursEnd',
      type: IsarType.long,
    ),
    r'quietHoursStart': PropertySchema(
      id: 14,
      name: r'quietHoursStart',
      type: IsarType.long,
    ),
    r'streakRemindersEnabled': PropertySchema(
      id: 15,
      name: r'streakRemindersEnabled',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 17,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _notificationPreferencesEstimateSize,
  serialize: _notificationPreferencesSerialize,
  deserialize: _notificationPreferencesDeserialize,
  deserializeProp: _notificationPreferencesDeserializeProp,
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
  embeddedSchemas: {},
  getId: _notificationPreferencesGetId,
  getLinks: _notificationPreferencesGetLinks,
  attach: _notificationPreferencesAttach,
  version: '3.1.0+1',
);

int _notificationPreferencesEstimateSize(
  NotificationPreferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.frequency.name.length * 3;
  bytesCount += 3 + object.preferredHours.length * 8;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _notificationPreferencesSerialize(
  NotificationPreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.cravingTipsEnabled);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.dailyCheckInEnabled);
  writer.writeBool(offsets[3], object.encouragementEnabled);
  writer.writeString(offsets[4], object.frequency.name);
  writer.writeBool(offsets[5], object.healthFactsEnabled);
  writer.writeBool(offsets[6], object.microChallengesEnabled);
  writer.writeBool(offsets[7], object.milestoneEnabled);
  writer.writeBool(offsets[8], object.motivationalQuotesEnabled);
  writer.writeBool(offsets[9], object.notificationsEnabled);
  writer.writeLongList(offsets[10], object.preferredHours);
  writer.writeBool(offsets[11], object.progressUpdatesEnabled);
  writer.writeBool(offsets[12], object.quietHoursEnabled);
  writer.writeLong(offsets[13], object.quietHoursEnd);
  writer.writeLong(offsets[14], object.quietHoursStart);
  writer.writeBool(offsets[15], object.streakRemindersEnabled);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeString(offsets[17], object.userId);
}

NotificationPreferences _notificationPreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationPreferences();
  object.cravingTipsEnabled = reader.readBool(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dailyCheckInEnabled = reader.readBool(offsets[2]);
  object.encouragementEnabled = reader.readBool(offsets[3]);
  object.frequency = _NotificationPreferencesfrequencyValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      NotificationFrequency.low;
  object.healthFactsEnabled = reader.readBool(offsets[5]);
  object.id = id;
  object.microChallengesEnabled = reader.readBool(offsets[6]);
  object.milestoneEnabled = reader.readBool(offsets[7]);
  object.motivationalQuotesEnabled = reader.readBool(offsets[8]);
  object.notificationsEnabled = reader.readBool(offsets[9]);
  object.preferredHours = reader.readLongList(offsets[10]) ?? [];
  object.progressUpdatesEnabled = reader.readBool(offsets[11]);
  object.quietHoursEnabled = reader.readBool(offsets[12]);
  object.quietHoursEnd = reader.readLong(offsets[13]);
  object.quietHoursStart = reader.readLong(offsets[14]);
  object.streakRemindersEnabled = reader.readBool(offsets[15]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[16]);
  object.userId = reader.readString(offsets[17]);
  return object;
}

P _notificationPreferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_NotificationPreferencesfrequencyValueEnumMap[
              reader.readStringOrNull(offset)] ??
          NotificationFrequency.low) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readLongList(offset) ?? []) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NotificationPreferencesfrequencyEnumValueMap = {
  r'low': r'low',
  r'medium': r'medium',
  r'high': r'high',
};
const _NotificationPreferencesfrequencyValueEnumMap = {
  r'low': NotificationFrequency.low,
  r'medium': NotificationFrequency.medium,
  r'high': NotificationFrequency.high,
};

Id _notificationPreferencesGetId(NotificationPreferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationPreferencesGetLinks(
    NotificationPreferences object) {
  return [];
}

void _notificationPreferencesAttach(
    IsarCollection<dynamic> col, Id id, NotificationPreferences object) {
  object.id = id;
}

extension NotificationPreferencesByIndex
    on IsarCollection<NotificationPreferences> {
  Future<NotificationPreferences?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  NotificationPreferences? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<NotificationPreferences?>> getAllByUserId(
      List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<NotificationPreferences?> getAllByUserIdSync(List<String> userIdValues) {
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

  Future<Id> putByUserId(NotificationPreferences object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(NotificationPreferences object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<NotificationPreferences> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<NotificationPreferences> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension NotificationPreferencesQueryWhereSort
    on QueryBuilder<NotificationPreferences, NotificationPreferences, QWhere> {
  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationPreferencesQueryWhere on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QWhereClause> {
  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> userIdNotEqualTo(String userId) {
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

extension NotificationPreferencesQueryFilter on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QFilterCondition> {
  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> cravingTipsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingTipsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> dailyCheckInEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyCheckInEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> encouragementEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encouragementEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyEqualTo(
    NotificationFrequency value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyGreaterThan(
    NotificationFrequency value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyLessThan(
    NotificationFrequency value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyBetween(
    NotificationFrequency lower,
    NotificationFrequency upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
          QAfterFilterCondition>
      frequencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
          QAfterFilterCondition>
      frequencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frequency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> frequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frequency',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> healthFactsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthFactsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> microChallengesEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'microChallengesEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> milestoneEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestoneEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> motivationalQuotesEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivationalQuotesEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> notificationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredHours',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredHours',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredHours',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredHours',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredHours',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredHours',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredHours',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredHours',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> preferredHoursLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredHours',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> progressUpdatesEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressUpdatesEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quietHoursEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursEndEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quietHoursEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursEndGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quietHoursEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursEndLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quietHoursEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursEndBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quietHoursEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursStartEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quietHoursStart',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursStartGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quietHoursStart',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursStartLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quietHoursStart',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> quietHoursStartBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quietHoursStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> streakRemindersEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streakRemindersEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<NotificationPreferences, NotificationPreferences,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension NotificationPreferencesQueryObject on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QFilterCondition> {}

extension NotificationPreferencesQueryLinks on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QFilterCondition> {}

extension NotificationPreferencesQuerySortBy
    on QueryBuilder<NotificationPreferences, NotificationPreferences, QSortBy> {
  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByCravingTipsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingTipsEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByCravingTipsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingTipsEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByDailyCheckInEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCheckInEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByDailyCheckInEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCheckInEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByEncouragementEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encouragementEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByEncouragementEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encouragementEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByHealthFactsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthFactsEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByHealthFactsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthFactsEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByMicroChallengesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microChallengesEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByMicroChallengesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microChallengesEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByMilestoneEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByMilestoneEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByMotivationalQuotesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalQuotesEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByMotivationalQuotesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalQuotesEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByProgressUpdatesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressUpdatesEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByProgressUpdatesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressUpdatesEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByQuietHoursEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByQuietHoursEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByQuietHoursEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByQuietHoursEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByQuietHoursStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByQuietHoursStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByStreakRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakRemindersEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByStreakRemindersEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakRemindersEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension NotificationPreferencesQuerySortThenBy on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QSortThenBy> {
  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByCravingTipsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingTipsEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByCravingTipsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingTipsEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByDailyCheckInEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCheckInEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByDailyCheckInEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCheckInEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByEncouragementEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encouragementEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByEncouragementEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encouragementEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByHealthFactsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthFactsEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByHealthFactsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthFactsEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByMicroChallengesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microChallengesEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByMicroChallengesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microChallengesEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByMilestoneEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByMilestoneEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByMotivationalQuotesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalQuotesEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByMotivationalQuotesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivationalQuotesEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByProgressUpdatesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressUpdatesEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByProgressUpdatesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressUpdatesEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByQuietHoursEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByQuietHoursEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByQuietHoursEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByQuietHoursEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByQuietHoursStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByQuietHoursStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByStreakRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakRemindersEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByStreakRemindersEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakRemindersEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension NotificationPreferencesQueryWhereDistinct on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QDistinct> {
  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByCravingTipsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingTipsEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByDailyCheckInEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyCheckInEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByEncouragementEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encouragementEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByFrequency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByHealthFactsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthFactsEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByMicroChallengesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'microChallengesEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByMilestoneEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'milestoneEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByMotivationalQuotesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivationalQuotesEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByPreferredHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredHours');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByProgressUpdatesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressUpdatesEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByQuietHoursEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quietHoursEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByQuietHoursEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quietHoursEnd');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByQuietHoursStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quietHoursStart');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByStreakRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakRemindersEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationPreferences, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension NotificationPreferencesQueryProperty on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QQueryProperty> {
  QueryBuilder<NotificationPreferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      cravingTipsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingTipsEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      dailyCheckInEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyCheckInEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      encouragementEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encouragementEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, NotificationFrequency, QQueryOperations>
      frequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequency');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      healthFactsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthFactsEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      microChallengesEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'microChallengesEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      milestoneEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'milestoneEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      motivationalQuotesEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivationalQuotesEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      notificationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, List<int>, QQueryOperations>
      preferredHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredHours');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      progressUpdatesEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressUpdatesEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      quietHoursEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quietHoursEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, int, QQueryOperations>
      quietHoursEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quietHoursEnd');
    });
  }

  QueryBuilder<NotificationPreferences, int, QQueryOperations>
      quietHoursStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quietHoursStart');
    });
  }

  QueryBuilder<NotificationPreferences, bool, QQueryOperations>
      streakRemindersEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakRemindersEnabled');
    });
  }

  QueryBuilder<NotificationPreferences, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NotificationPreferences, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationHistoryCollection on Isar {
  IsarCollection<NotificationHistory> get notificationHistorys =>
      this.collection();
}

const NotificationHistorySchema = CollectionSchema(
  name: r'NotificationHistory',
  id: -2221391965650012153,
  properties: {
    r'body': PropertySchema(
      id: 0,
      name: r'body',
      type: IsarType.string,
    ),
    r'openedAt': PropertySchema(
      id: 1,
      name: r'openedAt',
      type: IsarType.dateTime,
    ),
    r'sentAt': PropertySchema(
      id: 2,
      name: r'sentAt',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 3,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _NotificationHistorytypeEnumValueMap,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasOpened': PropertySchema(
      id: 6,
      name: r'wasOpened',
      type: IsarType.bool,
    )
  },
  estimateSize: _notificationHistoryEstimateSize,
  serialize: _notificationHistorySerialize,
  deserialize: _notificationHistoryDeserialize,
  deserializeProp: _notificationHistoryDeserializeProp,
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
  getId: _notificationHistoryGetId,
  getLinks: _notificationHistoryGetLinks,
  attach: _notificationHistoryAttach,
  version: '3.1.0+1',
);

int _notificationHistoryEstimateSize(
  NotificationHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.body.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _notificationHistorySerialize(
  NotificationHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeDateTime(offsets[1], object.openedAt);
  writer.writeDateTime(offsets[2], object.sentAt);
  writer.writeString(offsets[3], object.title);
  writer.writeString(offsets[4], object.type.name);
  writer.writeString(offsets[5], object.userId);
  writer.writeBool(offsets[6], object.wasOpened);
}

NotificationHistory _notificationHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationHistory();
  object.body = reader.readString(offsets[0]);
  object.id = id;
  object.openedAt = reader.readDateTimeOrNull(offsets[1]);
  object.sentAt = reader.readDateTime(offsets[2]);
  object.title = reader.readString(offsets[3]);
  object.type = _NotificationHistorytypeValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      NotificationType.dailyCheckIn;
  object.userId = reader.readString(offsets[5]);
  object.wasOpened = reader.readBool(offsets[6]);
  return object;
}

P _notificationHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_NotificationHistorytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          NotificationType.dailyCheckIn) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NotificationHistorytypeEnumValueMap = {
  r'dailyCheckIn': r'dailyCheckIn',
  r'encouragement': r'encouragement',
  r'milestone': r'milestone',
  r'cravingTip': r'cravingTip',
  r'microChallenge': r'microChallenge',
  r'progressUpdate': r'progressUpdate',
  r'streakReminder': r'streakReminder',
  r'healthFact': r'healthFact',
  r'motivationalQuote': r'motivationalQuote',
};
const _NotificationHistorytypeValueEnumMap = {
  r'dailyCheckIn': NotificationType.dailyCheckIn,
  r'encouragement': NotificationType.encouragement,
  r'milestone': NotificationType.milestone,
  r'cravingTip': NotificationType.cravingTip,
  r'microChallenge': NotificationType.microChallenge,
  r'progressUpdate': NotificationType.progressUpdate,
  r'streakReminder': NotificationType.streakReminder,
  r'healthFact': NotificationType.healthFact,
  r'motivationalQuote': NotificationType.motivationalQuote,
};

Id _notificationHistoryGetId(NotificationHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationHistoryGetLinks(
    NotificationHistory object) {
  return [];
}

void _notificationHistoryAttach(
    IsarCollection<dynamic> col, Id id, NotificationHistory object) {
  object.id = id;
}

extension NotificationHistoryQueryWhereSort
    on QueryBuilder<NotificationHistory, NotificationHistory, QWhere> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationHistoryQueryWhere
    on QueryBuilder<NotificationHistory, NotificationHistory, QWhereClause> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
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

extension NotificationHistoryQueryFilter on QueryBuilder<NotificationHistory,
    NotificationHistory, QFilterCondition> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'body',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'body',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      openedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openedAt',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      openedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openedAt',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      openedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      openedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      openedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      openedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      sentAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      sentAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      sentAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      sentAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sentAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleEqualTo(
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleLessThan(
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleBetween(
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeEqualTo(
    NotificationType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeGreaterThan(
    NotificationType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeLessThan(
    NotificationType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeBetween(
    NotificationType lower,
    NotificationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
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

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
      wasOpenedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasOpened',
        value: value,
      ));
    });
  }
}

extension NotificationHistoryQueryObject on QueryBuilder<NotificationHistory,
    NotificationHistory, QFilterCondition> {}

extension NotificationHistoryQueryLinks on QueryBuilder<NotificationHistory,
    NotificationHistory, QFilterCondition> {}

extension NotificationHistoryQuerySortBy
    on QueryBuilder<NotificationHistory, NotificationHistory, QSortBy> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByWasOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      sortByWasOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.desc);
    });
  }
}

extension NotificationHistoryQuerySortThenBy
    on QueryBuilder<NotificationHistory, NotificationHistory, QSortThenBy> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByWasOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.asc);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
      thenByWasOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasOpened', Sort.desc);
    });
  }
}

extension NotificationHistoryQueryWhereDistinct
    on QueryBuilder<NotificationHistory, NotificationHistory, QDistinct> {
  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctByBody({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openedAt');
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sentAt');
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QDistinct>
      distinctByWasOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasOpened');
    });
  }
}

extension NotificationHistoryQueryProperty
    on QueryBuilder<NotificationHistory, NotificationHistory, QQueryProperty> {
  QueryBuilder<NotificationHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationHistory, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<NotificationHistory, DateTime?, QQueryOperations>
      openedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openedAt');
    });
  }

  QueryBuilder<NotificationHistory, DateTime, QQueryOperations>
      sentAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sentAt');
    });
  }

  QueryBuilder<NotificationHistory, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<NotificationHistory, NotificationType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<NotificationHistory, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<NotificationHistory, bool, QQueryOperations>
      wasOpenedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasOpened');
    });
  }
}
