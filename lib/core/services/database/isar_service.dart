import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/craving_toolkit/data/models/toolkit_models.dart';
import '../../../features/interventions/data/models/notification_models.dart';
import '../../../features/onboarding/data/models/user_profile.dart';
import '../../../features/relapse_prevention/data/models/relapse_models.dart';
import '../../../features/tracking/data/models/craving_entry.dart';
import '../../../features/tracking/data/models/log_entry.dart';

class IsarService {
  static Isar? _isar;

  static Future<Isar> get instance async {
    if (_isar != null && _isar!.isOpen) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        // ── Onboarding ──────────────────────────────────────────────────
        UserProfileSchema,

        // ── Tracking ────────────────────────────────────────────────────
        LogEntrySchema,
        CravingEntrySchema,

        // ── Craving toolkit ─────────────────────────────────────────────
        BreathingSessionSchema,
        CbtSessionSchema,
        GroundingSessionSchema,
        DistractionSessionSchema,

        // ── Interventions / Notifications ────────────────────────────────
        ScheduledNotificationSchema,
        NotificationPreferencesSchema,
        NotificationHistorySchema,

        // ── Relapse prevention ───────────────────────────────────────────
        RelapseContactSchema,
        RelapsePlanSchema,
      ],
      directory: dir.path,
    );

    return _isar!;
  }

  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}