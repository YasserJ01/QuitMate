// GENERATED CODE - DO NOT MODIFY BY HAND
// Run: flutter pub run build_runner build --delete-conflicting-outputs

part of 'notification_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names,
// constant_identifier_names, invalid_use_of_protected_member,
// unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars,
// require_trailing_commas, inference_failure_on_function_invocation,
// unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks,
// join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints,
// avoid_positional_boolean_parameters, always_specify_types

// ═════════════════════════════════════════════════════════════════════════════
// ScheduledNotification
// ═════════════════════════════════════════════════════════════════════════════

extension GetScheduledNotificationCollection on Isar {
  IsarCollection<ScheduledNotification> get scheduledNotifications =>
      this.collection();
}

const ScheduledNotificationSchema = CollectionSchema(
  name: r'ScheduledNotification',
  id: -7228265165637064202,
  properties: {
    r'body': PropertySchema(id: 0, name: r'body', type: IsarType.string),
    r'createdAt': PropertySchema(
        id: 1, name: r'createdAt', type: IsarType.dateTime),
    r'isOverdue': PropertySchema(
        id: 2, name: r'isOverdue', type: IsarType.bool),
    r'isPending': PropertySchema(
        id: 3, name: r'isPending', type: IsarType.bool),
    r'isSent': PropertySchema(id: 4, name: r'isSent', type: IsarType.bool),
    r'openedAt': PropertySchema(
        id: 5, name: r'openedAt', type: IsarType.dateTime),
    r'payload': PropertySchema(id: 6, name: r'payload', type: IsarType.string),
    r'relatedMoneySaved': PropertySchema(
        id: 7, name: r'relatedMoneySaved', type: IsarType.long),
    r'relatedStreakDays': PropertySchema(
        id: 8, name: r'relatedStreakDays', type: IsarType.long),
    r'scheduledTime': PropertySchema(
        id: 9, name: r'scheduledTime', type: IsarType.dateTime),
    r'sentAt': PropertySchema(
        id: 10, name: r'sentAt', type: IsarType.dateTime),
    r'title': PropertySchema(id: 11, name: r'title', type: IsarType.string),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.string,
      enumMap: _ScheduledNotificationtypeEnumValueMap,
    ),
    r'userId': PropertySchema(
        id: 13, name: r'userId', type: IsarType.string),
    r'wasDismissed': PropertySchema(
        id: 14, name: r'wasDismissed', type: IsarType.bool),
    r'wasOpened': PropertySchema(
        id: 15, name: r'wasOpened', type: IsarType.bool),
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
        ),
      ],
    ),
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
    if (value != null) bytesCount += 3 + value.length * 3;
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

Id _scheduledNotificationGetId(ScheduledNotification object) => object.id;
List<IsarLinkBase<dynamic>> _scheduledNotificationGetLinks(
    ScheduledNotification object) =>
    [];
void _scheduledNotificationAttach(
    IsarCollection<dynamic> col, Id id, ScheduledNotification object) {
  object.id = id;
}

// ── Query extensions (Where / Filter / Sort / Distinct / Property) ────────────

extension ScheduledNotificationQueryWhereSort
on QueryBuilder<ScheduledNotification, ScheduledNotification, QWhere> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(
        this, (q) => q.addWhereClause(const IdWhereClause.any()));
  }
}

extension ScheduledNotificationQueryWhere on QueryBuilder<ScheduledNotification,
    ScheduledNotification, QWhereClause> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this,
            (q) => q.addWhereClause(IdWhereClause.between(lower: id, upper: id)));
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(
        this,
            (q) => q.addWhereClause(IndexWhereClause.equalTo(
            indexName: r'userId', value: [userId])));
  }
}

extension ScheduledNotificationQueryFilter on QueryBuilder<ScheduledNotification,
    ScheduledNotification, QFilterCondition> {
  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> userIdEqualTo(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.equalTo(
            property: r'userId',
            value: value,
            caseSensitive: caseSensitive)));
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> isSentEqualTo(bool value) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(
            FilterCondition.equalTo(property: r'isSent', value: value)));
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> scheduledTimeBetween(DateTime lower, DateTime upper,
      {bool includeLower = true, bool includeUpper = true}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.between(
            property: r'scheduledTime',
            lower: lower,
            includeLower: includeLower,
            upper: upper,
            includeUpper: includeUpper)));
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification,
      QAfterFilterCondition> sentAtLessThan(DateTime? value,
      {bool include = false}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.lessThan(
            include: include, property: r'sentAt', value: value)));
  }
}

extension ScheduledNotificationQuerySortBy
on QueryBuilder<ScheduledNotification, ScheduledNotification, QSortBy> {
  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
  sortByScheduledTime() {
    return QueryBuilder.apply(
        this, (q) => q.addSortBy(r'scheduledTime', Sort.asc));
  }

  QueryBuilder<ScheduledNotification, ScheduledNotification, QAfterSortBy>
  sortByScheduledTimeDesc() {
    return QueryBuilder.apply(
        this, (q) => q.addSortBy(r'scheduledTime', Sort.desc));
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// NotificationPreferences
// ═════════════════════════════════════════════════════════════════════════════

extension GetNotificationPreferencesCollection on Isar {
  IsarCollection<NotificationPreferences> get notificationPreferences =>
      this.collection();
}

const NotificationPreferencesSchema = CollectionSchema(
  name: r'NotificationPreferences',
  id: 4550166405663651190,
  properties: {
    r'cravingTipsEnabled': PropertySchema(
        id: 0, name: r'cravingTipsEnabled', type: IsarType.bool),
    r'createdAt': PropertySchema(
        id: 1, name: r'createdAt', type: IsarType.dateTime),
    r'dailyCheckInEnabled': PropertySchema(
        id: 2, name: r'dailyCheckInEnabled', type: IsarType.bool),
    r'encouragementEnabled': PropertySchema(
        id: 3, name: r'encouragementEnabled', type: IsarType.bool),
    r'frequency': PropertySchema(
      id: 4,
      name: r'frequency',
      type: IsarType.string,
      enumMap: _NotificationPreferencesfrequencyEnumValueMap,
    ),
    r'healthFactsEnabled': PropertySchema(
        id: 5, name: r'healthFactsEnabled', type: IsarType.bool),
    r'microChallengesEnabled': PropertySchema(
        id: 6, name: r'microChallengesEnabled', type: IsarType.bool),
    r'milestoneEnabled': PropertySchema(
        id: 7, name: r'milestoneEnabled', type: IsarType.bool),
    r'motivationalQuotesEnabled': PropertySchema(
        id: 8, name: r'motivationalQuotesEnabled', type: IsarType.bool),
    r'notificationsEnabled': PropertySchema(
        id: 9, name: r'notificationsEnabled', type: IsarType.bool),
    r'preferredHours': PropertySchema(
        id: 10, name: r'preferredHours', type: IsarType.longList),
    r'progressUpdatesEnabled': PropertySchema(
        id: 11, name: r'progressUpdatesEnabled', type: IsarType.bool),
    r'quietHoursEnabled': PropertySchema(
        id: 12, name: r'quietHoursEnabled', type: IsarType.bool),
    r'quietHoursEnd': PropertySchema(
        id: 13, name: r'quietHoursEnd', type: IsarType.long),
    r'quietHoursStart': PropertySchema(
        id: 14, name: r'quietHoursStart', type: IsarType.long),
    r'streakRemindersEnabled': PropertySchema(
        id: 15, name: r'streakRemindersEnabled', type: IsarType.bool),
    r'updatedAt': PropertySchema(
        id: 16, name: r'updatedAt', type: IsarType.dateTime),
    r'userId': PropertySchema(
        id: 17, name: r'userId', type: IsarType.string),
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
            name: r'userId', type: IndexType.hash, caseSensitive: true),
      ],
    ),
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
  object.frequency =
      _NotificationPreferencesfrequencyValueEnumMap[
      reader.readStringOrNull(offsets[4])] ??
          NotificationFrequency.medium;
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
    case 0: return (reader.readBool(offset)) as P;
    case 1: return (reader.readDateTime(offset)) as P;
    case 2: return (reader.readBool(offset)) as P;
    case 3: return (reader.readBool(offset)) as P;
    case 4:
      return (_NotificationPreferencesfrequencyValueEnumMap[
      reader.readStringOrNull(offset)] ??
          NotificationFrequency.medium) as P;
    case 5: return (reader.readBool(offset)) as P;
    case 6: return (reader.readBool(offset)) as P;
    case 7: return (reader.readBool(offset)) as P;
    case 8: return (reader.readBool(offset)) as P;
    case 9: return (reader.readBool(offset)) as P;
    case 10: return (reader.readLongList(offset) ?? []) as P;
    case 11: return (reader.readBool(offset)) as P;
    case 12: return (reader.readBool(offset)) as P;
    case 13: return (reader.readLong(offset)) as P;
    case 14: return (reader.readLong(offset)) as P;
    case 15: return (reader.readBool(offset)) as P;
    case 16: return (reader.readDateTimeOrNull(offset)) as P;
    case 17: return (reader.readString(offset)) as P;
    default: throw IsarError('Unknown property with id $propertyId');
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

Id _notificationPreferencesGetId(NotificationPreferences object) => object.id;
List<IsarLinkBase<dynamic>> _notificationPreferencesGetLinks(
    NotificationPreferences object) =>
    [];
void _notificationPreferencesAttach(
    IsarCollection<dynamic> col, Id id, NotificationPreferences object) {
  object.id = id;
}

extension NotificationPreferencesByIndex
on IsarCollection<NotificationPreferences> {
  Future<NotificationPreferences?> getByUserId(String userId) =>
      getByIndex(r'userId', [userId]);
  NotificationPreferences? getByUserIdSync(String userId) =>
      getByIndexSync(r'userId', [userId]);
  Future<bool> deleteByUserId(String userId) =>
      deleteByIndex(r'userId', [userId]);
  Future<Id> putByUserId(NotificationPreferences object) =>
      putByIndex(r'userId', object);
}

extension NotificationPreferencesQueryWhere on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QWhereClause> {
  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(
        this,
            (q) => q.addWhereClause(IndexWhereClause.equalTo(
            indexName: r'userId', value: [userId])));
  }
}

extension NotificationPreferencesQueryFilter on QueryBuilder<
    NotificationPreferences, NotificationPreferences, QFilterCondition> {
  QueryBuilder<NotificationPreferences, NotificationPreferences,
      QAfterFilterCondition> userIdEqualTo(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.equalTo(
            property: r'userId',
            value: value,
            caseSensitive: caseSensitive)));
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// NotificationHistory
// ═════════════════════════════════════════════════════════════════════════════

extension GetNotificationHistoryCollection on Isar {
  IsarCollection<NotificationHistory> get notificationHistorys =>
      this.collection();
}

const NotificationHistorySchema = CollectionSchema(
  name: r'NotificationHistory',
  id: -2221391965650012153,
  properties: {
    r'body': PropertySchema(id: 0, name: r'body', type: IsarType.string),
    r'openedAt': PropertySchema(
        id: 1, name: r'openedAt', type: IsarType.dateTime),
    r'sentAt': PropertySchema(
        id: 2, name: r'sentAt', type: IsarType.dateTime),
    r'title': PropertySchema(id: 3, name: r'title', type: IsarType.string),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _NotificationHistorytypeEnumValueMap,
    ),
    r'userId': PropertySchema(
        id: 5, name: r'userId', type: IsarType.string),
    r'wasOpened': PropertySchema(
        id: 6, name: r'wasOpened', type: IsarType.bool),
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
            name: r'userId', type: IndexType.hash, caseSensitive: true),
      ],
    ),
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
    case 0: return (reader.readString(offset)) as P;
    case 1: return (reader.readDateTimeOrNull(offset)) as P;
    case 2: return (reader.readDateTime(offset)) as P;
    case 3: return (reader.readString(offset)) as P;
    case 4:
      return (_NotificationHistorytypeValueEnumMap[
      reader.readStringOrNull(offset)] ??
          NotificationType.dailyCheckIn) as P;
    case 5: return (reader.readString(offset)) as P;
    case 6: return (reader.readBool(offset)) as P;
    default: throw IsarError('Unknown property with id $propertyId');
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

Id _notificationHistoryGetId(NotificationHistory object) => object.id;
List<IsarLinkBase<dynamic>> _notificationHistoryGetLinks(
    NotificationHistory object) =>
    [];
void _notificationHistoryAttach(
    IsarCollection<dynamic> col, Id id, NotificationHistory object) {
  object.id = id;
}

extension NotificationHistoryQueryWhere on QueryBuilder<NotificationHistory,
    NotificationHistory, QWhereClause> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(
        this,
            (q) => q.addWhereClause(IndexWhereClause.equalTo(
            indexName: r'userId', value: [userId])));
  }
}

extension NotificationHistoryQueryFilter on QueryBuilder<NotificationHistory,
    NotificationHistory, QFilterCondition> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.equalTo(
            property: r'userId',
            value: value,
            caseSensitive: caseSensitive)));
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.equalTo(
            property: r'title',
            value: value,
            caseSensitive: caseSensitive)));
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterFilterCondition>
  sentAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(
        this,
            (q) => q.addFilterCondition(FilterCondition.greaterThan(
            include: include, property: r'sentAt', value: value)));
  }
}

extension NotificationHistoryQuerySortBy
on QueryBuilder<NotificationHistory, NotificationHistory, QSortBy> {
  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
  sortBySentAt() {
    return QueryBuilder.apply(
        this, (q) => q.addSortBy(r'sentAt', Sort.asc));
  }

  QueryBuilder<NotificationHistory, NotificationHistory, QAfterSortBy>
  sortBySentAtDesc() {
    return QueryBuilder.apply(
        this, (q) => q.addSortBy(r'sentAt', Sort.desc));
  }
}