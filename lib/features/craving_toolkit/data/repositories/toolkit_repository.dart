import 'package:isar/isar.dart';
import '../../../../core/services/database/isar_service.dart';
import '../../../tracking/data/models/craving_entry.dart';
import '../models/toolkit_models.dart';

class ToolkitRepository {
  // ============= BREATHING SESSIONS =============

  Future<BreathingSession> addBreathingSession(BreathingSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.breathingSessions.put(session);
    });
    return session;
  }

  Future<List<BreathingSession>> getBreathingSessions(
      String userId, {
        DateTime? startDate,
        int? limit,
      }) async {
    final isar = await IsarService.instance;

    var query = isar.breathingSessions.filter().userIdEqualTo(userId);

    if (startDate != null) {
      query = query.startTimeGreaterThan(startDate);
    }

    var results = query.sortByStartTimeDesc();

    if (limit != null) {
      return await results.limit(limit).findAll();
    }

    return await results.findAll();
  }

  Future<void> updateBreathingSession(BreathingSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.breathingSessions.put(session);
    });
  }

  // ============= CBT SESSIONS =============

  Future<CbtSession> addCbtSession(CbtSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.cbtSessions.put(session);
    });
    return session;
  }

  Future<List<CbtSession>> getCbtSessions(
      String userId, {
        DateTime? startDate,
        int? limit,
      }) async {
    final isar = await IsarService.instance;

    var query = isar.cbtSessions.filter().userIdEqualTo(userId);

    if (startDate != null) {
      query = query.startTimeGreaterThan(startDate);
    }

    var results = query.sortByStartTimeDesc();

    if (limit != null) {
      return await results.limit(limit).findAll();
    }

    return await results.findAll();
  }

  Future<void> updateCbtSession(CbtSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.cbtSessions.put(session);
    });
  }

  // ============= GROUNDING SESSIONS =============

  Future<GroundingSession> addGroundingSession(GroundingSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.groundingSessions.put(session);
    });
    return session;
  }

  Future<List<GroundingSession>> getGroundingSessions(
      String userId, {
        DateTime? startDate,
        int? limit,
      }) async {
    final isar = await IsarService.instance;

    var query = isar.groundingSessions.filter().userIdEqualTo(userId);

    if (startDate != null) {
      query = query.startTimeGreaterThan(startDate);
    }

    var results = query.sortByStartTimeDesc();

    if (limit != null) {
      return await results.limit(limit).findAll();
    }

    return await results.findAll();
  }

  Future<void> updateGroundingSession(GroundingSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.groundingSessions.put(session);
    });
  }

  // ============= DISTRACTION SESSIONS =============

  Future<DistractionSession> addDistractionSession(DistractionSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.distractionSessions.put(session);
    });
    return session;
  }

  Future<List<DistractionSession>> getDistractionSessions(
      String userId, {
        DateTime? startDate,
        int? limit,
      }) async {
    final isar = await IsarService.instance;

    var query = isar.distractionSessions.filter().userIdEqualTo(userId);

    if (startDate != null) {
      query = query.startTimeGreaterThan(startDate);
    }

    var results = query.sortByStartTimeDesc();

    if (limit != null) {
      return await results.limit(limit).findAll();
    }

    return await results.findAll();
  }

  Future<void> updateDistractionSession(DistractionSession session) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.distractionSessions.put(session);
    });
  }

  // ============= STATISTICS =============

  Future<ToolkitStatistics> calculateStatistics(String userId) async {
    final breathingSessions = (await getBreathingSessions(userId))
        .where((session) => session.isCompleted)
        .toList();
    final cbtSessions = (await getCbtSessions(userId))
        .where((session) => session.isCompleted)
        .toList();
    final groundingSessions = (await getGroundingSessions(userId))
        .where((session) => session.isCompleted)
        .toList();
    final distractionSessions = (await getDistractionSessions(userId))
        .where((session) => session.isCompleted)
        .toList();

    // Calculate averages
    double avgBreathing = 0;
    if (breathingSessions.isNotEmpty) {
      final rated = breathingSessions.where((s) => s.effectivenessRating != null);
      if (rated.isNotEmpty) {
        avgBreathing = rated
            .map((s) => s.effectivenessRating!)
            .reduce((a, b) => a + b) / rated.length;
      }
    }

    double avgCbt = 0;
    if (cbtSessions.isNotEmpty) {
      final rated = cbtSessions.where((s) => s.helpfulnessRating != null);
      if (rated.isNotEmpty) {
        avgCbt = rated
            .map((s) => s.helpfulnessRating!)
            .reduce((a, b) => a + b) / rated.length;
      }
    }

    double avgGrounding = 0;
    if (groundingSessions.isNotEmpty) {
      final rated = groundingSessions.where((s) => s.effectivenessRating != null);
      if (rated.isNotEmpty) {
        avgGrounding = rated
            .map((s) => s.effectivenessRating!)
            .reduce((a, b) => a + b) / rated.length;
      }
    }

    double avgDistraction = 0;
    if (distractionSessions.isNotEmpty) {
      final rated = distractionSessions.where((s) => s.effectivenessRating != null);
      if (rated.isNotEmpty) {
        avgDistraction = rated
            .map((s) => s.effectivenessRating!)
            .reduce((a, b) => a + b) / rated.length;
      }
    }

    // Calculate usage maps
    final breathingUsage = <BreathingPattern, int>{};
    for (final session in breathingSessions) {
      if (session.pattern == BreathingPattern.custom) continue;
      breathingUsage[session.pattern] = (breathingUsage[session.pattern] ?? 0) + 1;
    }

    final cbtUsage = <CbtTechnique, int>{};
    for (final session in cbtSessions) {
      cbtUsage[session.technique] = (cbtUsage[session.technique] ?? 0) + 1;
    }

    final groundingUsage = <GroundingExercise, int>{};
    for (final session in groundingSessions) {
      groundingUsage[session.exercise] = (groundingUsage[session.exercise] ?? 0) + 1;
    }

    final distractionUsage = <DistractionActivity, int>{};
    for (final session in distractionSessions) {
      distractionUsage[session.activity] = (distractionUsage[session.activity] ?? 0) + 1;
    }

    // Find most effective technique
    final techniques = {
      'Breathing': avgBreathing,
      'CBT': avgCbt,
      'Grounding': avgGrounding,
      'Distraction': avgDistraction,
    };

    String mostEffective = 'Not enough data';
    double highestRating = 0;
    techniques.forEach((name, rating) {
      if (rating > highestRating) {
        highestRating = rating;
        mostEffective = name;
      }
    });

    // Count cravings resisted with toolkit
    final isar = await IsarService.instance;
    final cravingsWithToolkit = await isar.cravingEntrys
        .filter()
        .userIdEqualTo(userId)
        .copingStrategiesUsedIsNotEmpty()
        .count();

    return ToolkitStatistics(
      totalBreathingSessions: breathingSessions.length,
      totalCbtSessions: cbtSessions.length,
      totalGroundingSessions: groundingSessions.length,
      totalDistractionSessions: distractionSessions.length,
      averageBreathingEffectiveness: avgBreathing,
      averageCbtEffectiveness: avgCbt,
      averageGroundingEffectiveness: avgGrounding,
      averageDistractionEffectiveness: avgDistraction,
      breathingPatternUsage: breathingUsage,
      cbtTechniqueUsage: cbtUsage,
      groundingExerciseUsage: groundingUsage,
      distractionActivityUsage: distractionUsage,
      mostEffectiveTechnique: mostEffective,
      cravingsResistedWithToolkit: cravingsWithToolkit,
    );
  }
}
