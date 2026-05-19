import 'package:drift/drift.dart' show Value, InsertMode, OrderingTerm;
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../models/notification_models.dart' as models;

class NotificationRepository {
  final drift_db.AppDatabase db;

  NotificationRepository(this.db);

  // ─── Preferences ────────────────────────────────────────────────────────────

  Future<models.NotificationPreferences> getPreferences(String userId) async {
    final row = await (db.select(db.notificationPreferences)
        ..where((t) => t.userId.equals(userId))).getSingleOrNull();

    if (row != null) return _prefsFromRow(row);

    final prefs = models.NotificationPreferences(userId: userId);
    await _writePreferences(prefs);
    return prefs;
  }

  Future<void> savePreferences(models.NotificationPreferences prefs) async {
    prefs.updatedAt = DateTime.now();
    await _writePreferences(prefs);
  }

  Future<void> _writePreferences(models.NotificationPreferences prefs) async {
    final companion = _prefsToCompanion(prefs);
    await db.into(db.notificationPreferences)
        .insert(companion, mode: InsertMode.insertOrReplace);
  }

  // ─── Scheduled notifications ─────────────────────────────────────────────

  Future<models.ScheduledNotification> save(models.ScheduledNotification n) async {
    final companion = _scheduledToCompanion(n);
    final id = await db.into(db.scheduledNotifications).insert(companion);
    return n.copyWith(id: id);
  }

  Future<List<models.ScheduledNotification>> getPending(String userId) async {
    final q = db.select(db.scheduledNotifications);
    q.where((t) => t.userId.equals(userId));
    q.where((t) => t.isSent.equals(false));
    q.orderBy([(t) => OrderingTerm.asc(t.scheduledTime)]);
    final rows = await q.get();
    return rows.map(_scheduledFromRow).toList();
  }

  Future<List<models.ScheduledNotification>> getToday(String userId) async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final q = db.select(db.scheduledNotifications);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.asc(t.scheduledTime)]);
    var rows = await q.get();
    rows = rows.where((r) => !r.scheduledTime.isBefore(start) && r.scheduledTime.isBefore(end)).toList();
    return rows.map(_scheduledFromRow).toList();
  }

  Future<void> markSent(int id) async {
    final row = await (db.select(db.scheduledNotifications)
        ..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return;

    final now = DateTime.now();
    await (db.update(db.scheduledNotifications)
        ..where((t) => t.id.equals(id))).write(drift_db.ScheduledNotificationsCompanion(
      isSent: Value(true),
      sentAt: Value(now),
    ));

    await _archive(row, now);
  }

  Future<void> markOpened(int id) async {
    final row = await (db.select(db.scheduledNotifications)
        ..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return;

    final now = DateTime.now();
    await (db.update(db.scheduledNotifications)
        ..where((t) => t.id.equals(id))).write(drift_db.ScheduledNotificationsCompanion(
      wasOpened: Value(true),
      openedAt: Value(now),
    ));

    final histQ = db.select(db.notificationHistory);
    histQ.where((t) => t.userId.equals(row.userId));
    var histRows = await histQ.get();
    final cutoff = now.subtract(const Duration(hours: 24));
    histRows = histRows.where((r) => r.sentAt.isAfter(cutoff)).toList();

    if (histRows.isNotEmpty) {
      final hist = histRows.first;
      await (db.update(db.notificationHistory)
          ..where((t) => t.id.equals(hist.id))).write(drift_db.NotificationHistoryCompanion(
        wasOpened: Value(true),
        openedAt: Value(now),
      ));
    }
  }

  Future<void> delete(int id) async {
    await (db.delete(db.scheduledNotifications)
        ..where((t) => t.id.equals(id))).go();
  }

  Future<void> pruneOld(String userId, {int olderThan = 7}) async {
    final cutoff = DateTime.now().subtract(Duration(days: olderThan));
    final q = db.delete(db.scheduledNotifications);
    q.where((t) => t.userId.equals(userId));
    q.where((t) => t.isSent.equals(true));
    // Note: sentAt comparison done in-memory via select-then-delete
    final selectQ = db.select(db.scheduledNotifications);
    selectQ.where((t) => t.userId.equals(userId));
    selectQ.where((t) => t.isSent.equals(true));
    final oldRows = await selectQ.get();
    for (final row in oldRows) {
      if (row.sentAt != null && row.sentAt!.isBefore(cutoff)) {
        await (db.delete(db.scheduledNotifications)
            ..where((t) => t.id.equals(row.id))).go();
      }
    }
  }

  // ─── History ────────────────────────────────────────────────────────────────

  Future<void> _archive(drift_db.DbScheduledNotification row, DateTime sentAt) async {
    await db.into(db.notificationHistory).insert(drift_db.NotificationHistoryCompanion(
          userId: Value(row.userId),
          type: Value(row.type),
          title: Value(row.title),
          body: Value(row.body),
          sentAt: Value(sentAt),
          wasOpened: Value(row.wasOpened),
          openedAt: Value(row.openedAt),
        ));
  }

  Future<List<models.NotificationHistory>> getHistory(
    String userId, {
    int? limit,
    DateTime? since,
  }) async {
    final q = db.select(db.notificationHistory);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.sentAt)]);
    if (limit != null) {
      q.limit(limit);
    }
    final rows = await q.get();
    return rows.map(_historyFromRow).toList();
  }

  Future<Map<models.NotificationType, int>> historyStats(String userId) async {
    final history = await getHistory(userId);
    final stats = <models.NotificationType, int>{};
    for (final h in history) {
      stats[h.type] = (stats[h.type] ?? 0) + 1;
    }
    return stats;
  }

  Future<double> openRate(String userId) async {
    final history = await getHistory(userId);
    if (history.isEmpty) return 0.0;
    final opened = history.where((h) => h.wasOpened).length;
    return opened / history.length * 100;
  }

  // ── Mappers ──────────────────────────────────────────────────────────────

  models.ScheduledNotification _scheduledFromRow(drift_db.DbScheduledNotification row) {
    return models.ScheduledNotification(
      id: row.id,
      userId: row.userId,
      type: models.NotificationType.values.byName(row.type),
      title: row.title,
      body: row.body,
      scheduledTime: row.scheduledTime,
      isSent: row.isSent,
      sentAt: row.sentAt,
      wasOpened: row.wasOpened,
      openedAt: row.openedAt,
      wasDismissed: row.wasDismissed,
      payload: row.payload,
      relatedStreakDays: row.relatedStreakDays,
      relatedMoneySaved: row.relatedMoneySaved,
      createdAt: row.createdAt,
    );
  }

  drift_db.ScheduledNotificationsCompanion _scheduledToCompanion(models.ScheduledNotification n) {
    return drift_db.ScheduledNotificationsCompanion(
      userId: Value(n.userId),
      type: Value(n.type.name),
      title: Value(n.title),
      body: Value(n.body),
      scheduledTime: Value(n.scheduledTime),
      isSent: Value(n.isSent),
      sentAt: Value(n.sentAt),
      wasOpened: Value(n.wasOpened),
      openedAt: Value(n.openedAt),
      wasDismissed: Value(n.wasDismissed),
      payload: Value(n.payload),
      relatedStreakDays: Value(n.relatedStreakDays),
      relatedMoneySaved: Value(n.relatedMoneySaved),
      createdAt: Value(n.createdAt),
    );
  }

  models.NotificationPreferences _prefsFromRow(drift_db.DbNotificationPreference row) {
    return models.NotificationPreferences(
      id: row.id,
      userId: row.userId,
      notificationsEnabled: row.notificationsEnabled,
      frequency: models.NotificationFrequency.values.byName(row.frequency),
      quietHoursEnabled: row.quietHoursEnabled,
      quietHoursStart: row.quietHoursStart,
      quietHoursEnd: row.quietHoursEnd,
      dailyCheckInEnabled: row.dailyCheckInEnabled,
      encouragementEnabled: row.encouragementEnabled,
      milestoneEnabled: row.milestoneEnabled,
      cravingTipsEnabled: row.cravingTipsEnabled,
      microChallengesEnabled: row.microChallengesEnabled,
      progressUpdatesEnabled: row.progressUpdatesEnabled,
      streakRemindersEnabled: row.streakRemindersEnabled,
      healthFactsEnabled: row.healthFactsEnabled,
      motivationalQuotesEnabled: row.motivationalQuotesEnabled,
      preferredHours: row.preferredHours ?? [9, 12, 15, 18, 20],
      permissionDeniedAt: row.permissionDeniedAt,
      userMode: row.userMode,
      quitDatePrepEnabled: row.quitDatePrepEnabled,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  drift_db.NotificationPreferencesCompanion _prefsToCompanion(models.NotificationPreferences p) {
    return drift_db.NotificationPreferencesCompanion(
      userId: Value(p.userId),
      notificationsEnabled: Value(p.notificationsEnabled),
      frequency: Value(p.frequency.name),
      quietHoursEnabled: Value(p.quietHoursEnabled),
      quietHoursStart: Value(p.quietHoursStart),
      quietHoursEnd: Value(p.quietHoursEnd),
      dailyCheckInEnabled: Value(p.dailyCheckInEnabled),
      encouragementEnabled: Value(p.encouragementEnabled),
      milestoneEnabled: Value(p.milestoneEnabled),
      cravingTipsEnabled: Value(p.cravingTipsEnabled),
      microChallengesEnabled: Value(p.microChallengesEnabled),
      progressUpdatesEnabled: Value(p.progressUpdatesEnabled),
      streakRemindersEnabled: Value(p.streakRemindersEnabled),
      healthFactsEnabled: Value(p.healthFactsEnabled),
      motivationalQuotesEnabled: Value(p.motivationalQuotesEnabled),
      preferredHours: Value(p.preferredHours),
      permissionDeniedAt: Value(p.permissionDeniedAt),
      userMode: Value(p.userMode),
      quitDatePrepEnabled: Value(p.quitDatePrepEnabled),
      createdAt: Value(p.createdAt),
      updatedAt: Value(p.updatedAt),
    );
  }

  models.NotificationHistory _historyFromRow(drift_db.DbNotificationHistory row) {
    return models.NotificationHistory(
      id: row.id,
      userId: row.userId,
      type: models.NotificationType.values.byName(row.type),
      title: row.title,
      body: row.body,
      sentAt: row.sentAt,
      wasOpened: row.wasOpened,
      openedAt: row.openedAt,
    );
  }
}

extension on models.ScheduledNotification {
  models.ScheduledNotification copyWith({int? id}) {
    return models.ScheduledNotification(
      id: id ?? this.id,
      userId: userId,
      type: type,
      title: title,
      body: body,
      scheduledTime: scheduledTime,
      isSent: isSent,
      sentAt: sentAt,
      wasOpened: wasOpened,
      openedAt: openedAt,
      wasDismissed: wasDismissed,
      payload: payload,
      relatedStreakDays: relatedStreakDays,
      relatedMoneySaved: relatedMoneySaved,
      createdAt: createdAt,
    );
  }
}
