import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quitmate/features/achievements/data/models/achievement_model.dart';
import 'package:quitmate/features/craving_toolkit/data/models/toolkit_exercise_model.dart';
import '../../../features/craving_toolkit/data/models/toolkit_models.dart';
import '../../../features/craving_toolkit/data/models/toolkit_session_model.dart';
import '../../../features/craving_toolkit/data/models/journal_entry_model.dart';
import '../../../features/interventions/data/models/notification_models.dart';
import '../../../features/onboarding/data/models/user_profile.dart';
import '../../../features/relapse_prevention/data/models/relapse_models.dart';
import '../../../features/relapse_prevention/data/models/lapse_recovery_session_model.dart';
import '../../../features/tracking/data/models/craving_entry.dart';
import '../../../features/tracking/data/models/log_entry.dart';
import '../../../features/tracking/data/models/weekly_review_model.dart';

class IsarService {
  static Isar? _isar;

  static Future<Isar> get instance async {
    if (_isar != null && _isar!.isOpen) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        // ── Onboarding ──────────────────────────────────────────────────
        UserProfileSchema,

        // ── Achievements ────────────────────────────────────────────────
        AchievementModelSchema,

        // ── Tracking ────────────────────────────────────────────────────
        LogEntrySchema,
        CravingEntrySchema,
        WeeklyReviewModelSchema,

        // ── Craving toolkit ─────────────────────────────────────────────
        BreathingSessionSchema,
        CbtSessionSchema,
        GroundingSessionSchema,
        DistractionSessionSchema,
        ToolkitExerciseModelSchema,
        ToolkitSessionModelSchema,
        JournalEntryModelSchema,

        // ── Interventions / Notifications ────────────────────────────────
        ScheduledNotificationSchema,
        NotificationPreferencesSchema,
        NotificationHistorySchema,

        // ── Relapse prevention ───────────────────────────────────────────
        RelapseContactSchema,
        RelapsePlanSchema,
        LapseRecoverySessionModelSchema,
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