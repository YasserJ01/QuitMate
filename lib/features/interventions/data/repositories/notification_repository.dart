import 'package:isar/isar.dart';
import '../../../../core/services/database/isar_service.dart';
import '../models/notification_models.dart';

class NotificationRepository {
  // ============= PREFERENCES =============

  Future<NotificationPreferences> getPreferences(String userId) async {
    final isar = await IsarService.instance;
    var prefs = await isar.notificationPreferences
        .filter()
        .userIdEqualTo(userId)
        .findFirst();

    if (prefs == null) {
      // Create default preferences
      prefs = NotificationPreferences()..userId = userId;
      await savePreferences(prefs);
    }

    return prefs;
  }

  Future<void> savePreferences(NotificationPreferences preferences) async {
    final isar = await IsarService.instance;
    preferences.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.notificationPreferences.put(preferences);
    });
  }

  // ============= SCHEDULED NOTIFICATIONS =============

  Future<ScheduledNotification> scheduleNotification(
      ScheduledNotification notification,
      ) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.scheduledNotifications.put(notification);
    });
    return notification;
  }

  Future<List<ScheduledNotification>> getPendingNotifications(
      String userId,
      ) async {
    final isar = await IsarService.instance;
    return await isar.scheduledNotifications
        .filter()
        .userIdEqualTo(userId)
        .isSentEqualTo(false)
        .sortByScheduledTime()
        .findAll();
  }

  Future<List<ScheduledNotification>> getScheduledForToday(
      String userId,
      ) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final isar = await IsarService.instance;
    return await isar.scheduledNotifications
        .filter()
        .userIdEqualTo(userId)
        .scheduledTimeBetween(startOfDay, endOfDay)
        .sortByScheduledTime()
        .findAll();
  }

  Future<void> markAsSent(int notificationId) async {
    final isar = await IsarService.instance;
    final notification = await isar.scheduledNotifications.get(notificationId);

    if (notification != null) {
      notification.isSent = true;
      notification.sentAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.scheduledNotifications.put(notification);
      });

      // Archive to history
      await _archiveNotification(notification);
    }
  }

  Future<void> markAsOpened(int notificationId) async {
    final isar = await IsarService.instance;
    final notification = await isar.scheduledNotifications.get(notificationId);

    if (notification != null) {
      notification.wasOpened = true;
      notification.openedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.scheduledNotifications.put(notification);
      });
    }
  }

  Future<void> deleteScheduledNotification(int id) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.scheduledNotifications.delete(id);
    });
  }

  Future<void> clearOldScheduledNotifications(String userId) async {
    final isar = await IsarService.instance;
    final cutoff = DateTime.now().subtract(const Duration(days: 7));

    await isar.writeTxn(() async {
      await isar.scheduledNotifications
          .filter()
          .userIdEqualTo(userId)
          .isSentEqualTo(true)
          .sentAtLessThan(cutoff)
          .deleteAll();
    });
  }

  // ============= NOTIFICATION HISTORY =============

  Future<void> _archiveNotification(ScheduledNotification notification) async {
    final history = NotificationHistory.fromScheduled(notification);

    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.notificationHistorys.put(history);
    });
  }

  Future<List<NotificationHistory>> getHistory(
      String userId, {
        int? limit,
      }) async {
    final isar = await IsarService.instance;
    var query = isar.notificationHistorys
        .filter()
        .userIdEqualTo(userId)
        .sortBySentAtDesc();

    if (limit != null) {
      return await query.limit(limit).findAll();
    }

    return await query.findAll();
  }

  Future<Map<NotificationType, int>> getHistoryStats(String userId) async {
    final history = await getHistory(userId);
    final stats = <NotificationType, int>{};

    for (final entry in history) {
      stats[entry.type] = (stats[entry.type] ?? 0) + 1;
    }

    return stats;
  }

  Future<double> getOpenRate(String userId) async {
    final history = await getHistory(userId);
    if (history.isEmpty) return 0.0;

    final opened = history.where((h) => h.wasOpened).length;
    return (opened / history.length) * 100;
  }
}