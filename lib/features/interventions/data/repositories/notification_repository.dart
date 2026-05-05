import 'package:isar/isar.dart';
import '../../../../core/services/database/isar_service.dart';
import '../models/notification_models.dart';

/// Data-access layer for all notification-related Isar collections.
///
/// All methods are async and safe to call from any isolate.
class NotificationRepository {
  // ─── Preferences ────────────────────────────────────────────────────────────

  Future<NotificationPreferences> getPreferences(String userId) async {
    final isar = await IsarService.instance;
    final existing = await isar.notificationPreferences
        .filter()
        .userIdEqualTo(userId)
        .findFirst();

    if (existing != null) return existing;

    // First-time: create sensible defaults and persist them.
    final prefs = NotificationPreferences()..userId = userId;
    await _writePreferences(isar, prefs);
    return prefs;
  }

  Future<void> savePreferences(NotificationPreferences prefs) async {
    prefs.updatedAt = DateTime.now();
    final isar = await IsarService.instance;
    await _writePreferences(isar, prefs);
  }

  Future<void> _writePreferences(
      Isar isar,
      NotificationPreferences prefs,
      ) async {
    await isar.writeTxn(() => isar.notificationPreferences.put(prefs));
  }

  // ─── Scheduled notifications ─────────────────────────────────────────────

  Future<ScheduledNotification> save(ScheduledNotification n) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() => isar.scheduledNotifications.put(n));
    return n;
  }

  /// All pending (not yet sent) notifications for [userId], sorted by time.
  Future<List<ScheduledNotification>> getPending(String userId) async {
    final isar = await IsarService.instance;
    return isar.scheduledNotifications
        .filter()
        .userIdEqualTo(userId)
        .isSentEqualTo(false)
        .sortByScheduledTime()
        .findAll();
  }

  /// Notifications scheduled for today (sent or not).
  Future<List<ScheduledNotification>> getToday(String userId) async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final isar = await IsarService.instance;
    return isar.scheduledNotifications
        .filter()
        .userIdEqualTo(userId)
        .scheduledTimeBetween(start, end)
        .sortByScheduledTime()
        .findAll();
  }

  Future<void> markSent(int id) async {
    final isar = await IsarService.instance;
    final n = await isar.scheduledNotifications.get(id);
    if (n == null) return;
    n
      ..isSent = true
      ..sentAt = DateTime.now();
    await isar.writeTxn(() => isar.scheduledNotifications.put(n));
    await _archive(n);
  }

  Future<void> markOpened(int id) async {
    final isar = await IsarService.instance;
    final n = await isar.scheduledNotifications.get(id);
    if (n == null) return;
    n
      ..wasOpened = true
      ..openedAt = DateTime.now();
    await isar.writeTxn(() => isar.scheduledNotifications.put(n));
    // Mirror in history
    final hist = await isar.notificationHistorys
        .filter()
        .userIdEqualTo(n.userId)
        .titleEqualTo(n.title)
        .sentAtGreaterThan(DateTime.now().subtract(const Duration(hours: 1)))
        .findFirst();
    if (hist != null) {
      hist
        ..wasOpened = true
        ..openedAt = n.openedAt;
      await isar.writeTxn(() => isar.notificationHistorys.put(hist));
    }
  }

  Future<void> delete(int id) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() => isar.scheduledNotifications.delete(id));
  }

  /// Remove sent notifications older than [olderThan] days to keep DB lean.
  Future<void> pruneOld(String userId, {int olderThan = 7}) async {
    final cutoff = DateTime.now().subtract(Duration(days: olderThan));
    final isar = await IsarService.instance;
    await isar.writeTxn(() => isar.scheduledNotifications
        .filter()
        .userIdEqualTo(userId)
        .isSentEqualTo(true)
        .sentAtLessThan(cutoff)
        .deleteAll());
  }

  // ─── History ────────────────────────────────────────────────────────────────

  Future<void> _archive(ScheduledNotification n) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(
            () => isar.notificationHistorys.put(NotificationHistory.fromScheduled(n)));
  }

  Future<List<NotificationHistory>> getHistory(
      String userId, {
        int? limit,
        DateTime? since,
      }) async {
    final isar = await IsarService.instance;
    var q = isar.notificationHistorys
        .filter()
        .userIdEqualTo(userId)
        .sortBySentAtDesc();
    if (limit != null) return q.limit(limit).findAll();
    return q.findAll();
  }

  Future<Map<NotificationType, int>> historyStats(String userId) async {
    final history = await getHistory(userId);
    final stats = <NotificationType, int>{};
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
}