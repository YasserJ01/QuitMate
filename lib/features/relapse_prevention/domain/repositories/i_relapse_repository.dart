import '../../domain/entities/lapse_recovery_session.dart';

/// Abstract interface for relapse prevention persistence.
abstract class IRelapseRepository {
  // ── Lapse recovery sessions ─────────────────────────────────────────────

  Future<String> createRecoverySession({
    required String userId,
    required String mode,
  });

  Future<void> updateRecoverySessionTriggers({
    required String sessionId,
    required List<String> triggers,
  });

  Future<void> completeRecoverySession({
    required String sessionId,
    required String action,
     bool openedToolkit = false,
    bool readRecoveryGuide = false,
    String? recoveryNote,
    }
  );

  Future<List<LapseRecoverySession>> getRecoverySessions(
    String userId, {
    int? limit,
  });
}