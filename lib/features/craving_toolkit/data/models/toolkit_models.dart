import 'package:isar/isar.dart';

part 'toolkit_models.g.dart';

// ============= BREATHING EXERCISE =============

enum BreathingPattern {
  box,           // 4-4-4-4 (Box Breathing)
  relaxing,      // 4-7-8 (Relaxing Breath)
  energizing,    // 4-4-4-0 (Energizing)
  calm,          // 4-6-4-0 (Calming)
  custom;        // User defined

  String get displayName {
    switch (this) {
      case BreathingPattern.box:
        return 'Box Breathing';
      case BreathingPattern.relaxing:
        return '4-7-8 Relaxing';
      case BreathingPattern.energizing:
        return 'Energizing Breath';
      case BreathingPattern.calm:
        return 'Calming Breath';
      case BreathingPattern.custom:
        return 'Custom Pattern';
    }
  }

  String get description {
    switch (this) {
      case BreathingPattern.box:
        return 'Equal breathing pattern used by Navy SEALs. Great for stress.';
      case BreathingPattern.relaxing:
        return 'Proven to reduce anxiety. Perfect for bedtime.';
      case BreathingPattern.energizing:
        return 'Quick breaths to boost energy and alertness.';
      case BreathingPattern.calm:
        return 'Gentle pattern to restore calm and balance.';
      case BreathingPattern.custom:
        return 'Create your own breathing rhythm.';
    }
  }

  int get inhaleSeconds {
    switch (this) {
      case BreathingPattern.box:
        return 4;
      case BreathingPattern.relaxing:
        return 4;
      case BreathingPattern.energizing:
        return 4;
      case BreathingPattern.calm:
        return 4;
      case BreathingPattern.custom:
        return 4;
    }
  }

  int get holdSeconds {
    switch (this) {
      case BreathingPattern.box:
        return 4;
      case BreathingPattern.relaxing:
        return 7;
      case BreathingPattern.energizing:
        return 4;
      case BreathingPattern.calm:
        return 6;
      case BreathingPattern.custom:
        return 4;
    }
  }

  int get exhaleSeconds {
    switch (this) {
      case BreathingPattern.box:
        return 4;
      case BreathingPattern.relaxing:
        return 8;
      case BreathingPattern.energizing:
        return 4;
      case BreathingPattern.calm:
        return 4;
      case BreathingPattern.custom:
        return 4;
    }
  }

  int get pauseSeconds {
    switch (this) {
      case BreathingPattern.box:
        return 4;
      case BreathingPattern.relaxing:
        return 0;
      case BreathingPattern.energizing:
        return 0;
      case BreathingPattern.calm:
        return 0;
      case BreathingPattern.custom:
        return 0;
    }
  }

  int get totalCycleSeconds {
    return inhaleSeconds + holdSeconds + exhaleSeconds + pauseSeconds;
  }

  String get emoji {
    switch (this) {
      case BreathingPattern.box:
        return '📦';
      case BreathingPattern.relaxing:
        return '😌';
      case BreathingPattern.energizing:
        return '⚡';
      case BreathingPattern.calm:
        return '🧘';
      case BreathingPattern.custom:
        return '⚙️';
    }
  }
}

@collection
class BreathingSession {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late BreathingPattern pattern;

  late int durationSeconds;
  late int cyclesCompleted;
  late DateTime startTime;
  DateTime? endTime;

  // Linked craving
  int? cravingId;

  // Effectiveness rating (1-5)
  int? effectivenessRating;

  late DateTime createdAt;

  BreathingSession() {
    createdAt = DateTime.now();
    startTime = DateTime.now();
  }

  bool get isCompleted => endTime != null;

  int? get totalMinutes {
    if (endTime == null) return null;
    return endTime!.difference(startTime).inMinutes;
  }
}

// ============= CBT TECHNIQUES =============

enum CbtTechnique {
  urgeSurfing,
  thoughtChallenge,
  consequenceAnalysis,
  delayTactic,
  alternativeBehavior;

  String get displayName {
    switch (this) {
      case CbtTechnique.urgeSurfing:
        return 'Urge Surfing';
      case CbtTechnique.thoughtChallenge:
        return 'Challenge Your Thoughts';
      case CbtTechnique.consequenceAnalysis:
        return 'Play the Tape Forward';
      case CbtTechnique.delayTactic:
        return '5-Minute Delay';
      case CbtTechnique.alternativeBehavior:
        return 'Alternative Actions';
    }
  }

  String get description {
    switch (this) {
      case CbtTechnique.urgeSurfing:
        return 'Ride the wave of craving without giving in. Cravings peak and pass like ocean waves.';
      case CbtTechnique.thoughtChallenge:
        return 'Question and reframe automatic negative thoughts.';
      case CbtTechnique.consequenceAnalysis:
        return 'Think through what happens if you give in vs. resist.';
      case CbtTechnique.delayTactic:
        return 'Promise to wait 5 minutes. Cravings usually pass in 3-5 minutes.';
      case CbtTechnique.alternativeBehavior:
        return 'Replace the urge with a healthy alternative action.';
    }
  }

  String get emoji {
    switch (this) {
      case CbtTechnique.urgeSurfing:
        return '🌊';
      case CbtTechnique.thoughtChallenge:
        return '🧠';
      case CbtTechnique.consequenceAnalysis:
        return '⏭️';
      case CbtTechnique.delayTactic:
        return '⏰';
      case CbtTechnique.alternativeBehavior:
        return '🔄';
    }
  }

  int get estimatedMinutes {
    switch (this) {
      case CbtTechnique.urgeSurfing:
        return 3;
      case CbtTechnique.thoughtChallenge:
        return 2;
      case CbtTechnique.consequenceAnalysis:
        return 2;
      case CbtTechnique.delayTactic:
        return 5;
      case CbtTechnique.alternativeBehavior:
        return 1;
    }
  }
}

@collection
class CbtSession {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late CbtTechnique technique;

  late DateTime startTime;
  DateTime? endTime;

  // User responses/notes
  String? thoughtsBefore;
  String? thoughtsAfter;
  String? consequences;
  String? alternativeChosen;

  // Linked craving
  int? cravingId;

  // Did it help?
  bool? wasHelpful;
  int? helpfulnessRating; // 1-5

  late DateTime createdAt;

  CbtSession() {
    createdAt = DateTime.now();
    startTime = DateTime.now();
  }

  bool get isCompleted => endTime != null;
}

// ============= GROUNDING EXERCISES =============

enum GroundingExercise {
  fiveSenses,      // 5-4-3-2-1 technique
  bodyAwareness,   // Body scan
  objectFocus,     // Focus on one object
  counting,        // Count backwards
  coldWater;       // Splash cold water

  String get displayName {
    switch (this) {
      case GroundingExercise.fiveSenses:
        return '5-4-3-2-1 Grounding';
      case GroundingExercise.bodyAwareness:
        return 'Body Scan';
      case GroundingExercise.objectFocus:
        return 'Object Focus';
      case GroundingExercise.counting:
        return 'Counting';
      case GroundingExercise.coldWater:
        return 'Cold Water Reset';
    }
  }

  String get description {
    switch (this) {
      case GroundingExercise.fiveSenses:
        return 'Name 5 things you see, 4 you can touch, 3 you hear, 2 you smell, 1 you taste.';
      case GroundingExercise.bodyAwareness:
        return 'Notice sensations in your body from head to toe.';
      case GroundingExercise.objectFocus:
        return 'Study one object in detail for 60 seconds.';
      case GroundingExercise.counting:
        return 'Count backwards by 7s to reset your focus.';
      case GroundingExercise.coldWater:
        return 'Splash cold water on your face to reset your nervous system.';
    }
  }

  String get emoji {
    switch (this) {
      case GroundingExercise.fiveSenses:
        return '👁️';
      case GroundingExercise.bodyAwareness:
        return '🧘';
      case GroundingExercise.objectFocus:
        return '🔍';
      case GroundingExercise.counting:
        return '🔢';
      case GroundingExercise.coldWater:
        return '💧';
    }
  }

  int get estimatedMinutes {
    switch (this) {
      case GroundingExercise.fiveSenses:
        return 2;
      case GroundingExercise.bodyAwareness:
        return 3;
      case GroundingExercise.objectFocus:
        return 1;
      case GroundingExercise.counting:
        return 2;
      case GroundingExercise.coldWater:
        return 1;
    }
  }
}

@collection
class GroundingSession {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late GroundingExercise exercise;

  late DateTime startTime;
  DateTime? endTime;

  // Five senses responses
  String? seeItems;
  String? touchItems;
  String? hearItems;
  String? smellItems;
  String? tasteItems;

  // General notes
  String? notes;

  // Linked craving
  int? cravingId;

  // Effectiveness
  int? effectivenessRating;

  late DateTime createdAt;

  GroundingSession() {
    createdAt = DateTime.now();
    startTime = DateTime.now();
  }

  bool get isCompleted => endTime != null;
}

// ============= DISTRACTION ACTIVITIES =============

enum DistractionActivity {
  breathing,
  puzzle,
  memoryGame,
  wordGame,
  drawing,
  music,
  walk,
  call,
  read,
  hobby;

  String get displayName {
    switch (this) {
      case DistractionActivity.breathing:
        return 'Breathing Exercise';
      case DistractionActivity.puzzle:
        return 'Quick Puzzle';
      case DistractionActivity.memoryGame:
        return 'Memory Game';
      case DistractionActivity.wordGame:
        return 'Word Game';
      case DistractionActivity.drawing:
        return 'Doodle';
      case DistractionActivity.music:
        return 'Listen to Music';
      case DistractionActivity.walk:
        return 'Take a Walk';
      case DistractionActivity.call:
        return 'Call Someone';
      case DistractionActivity.read:
        return 'Read Something';
      case DistractionActivity.hobby:
        return 'Do a Hobby';
    }
  }

  String get emoji {
    switch (this) {
      case DistractionActivity.breathing:
        return '🫁';
      case DistractionActivity.puzzle:
        return '🧩';
      case DistractionActivity.memoryGame:
        return '🃏';
      case DistractionActivity.wordGame:
        return '📝';
      case DistractionActivity.drawing:
        return '🎨';
      case DistractionActivity.music:
        return '🎵';
      case DistractionActivity.walk:
        return '🚶';
      case DistractionActivity.call:
        return '📞';
      case DistractionActivity.read:
        return '📚';
      case DistractionActivity.hobby:
        return '⚽';
    }
  }

  int get estimatedMinutes {
    switch (this) {
      case DistractionActivity.breathing:
        return 2;
      case DistractionActivity.puzzle:
        return 5;
      case DistractionActivity.memoryGame:
        return 3;
      case DistractionActivity.wordGame:
        return 3;
      case DistractionActivity.drawing:
        return 5;
      case DistractionActivity.music:
        return 3;
      case DistractionActivity.walk:
        return 10;
      case DistractionActivity.call:
        return 5;
      case DistractionActivity.read:
        return 5;
      case DistractionActivity.hobby:
        return 10;
    }
  }
}

@collection
class DistractionSession {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late DistractionActivity activity;

  late DateTime startTime;
  DateTime? endTime;

  // Did it help?
  bool? wasEffective;
  int? effectivenessRating;

  // Linked craving
  int? cravingId;

  late DateTime createdAt;

  DistractionSession() {
    createdAt = DateTime.now();
    startTime = DateTime.now();
  }

  bool get isCompleted => endTime != null;

  int? get durationMinutes {
    if (endTime == null) return null;
    return endTime!.difference(startTime).inMinutes;
  }
}

// ============= TOOLKIT USAGE STATISTICS =============

class ToolkitStatistics {
  final int totalBreathingSessions;
  final int totalCbtSessions;
  final int totalGroundingSessions;
  final int totalDistractionSessions;

  final double averageBreathingEffectiveness;
  final double averageCbtEffectiveness;
  final double averageGroundingEffectiveness;
  final double averageDistractionEffectiveness;

  final Map<BreathingPattern, int> breathingPatternUsage;
  final Map<CbtTechnique, int> cbtTechniqueUsage;
  final Map<GroundingExercise, int> groundingExerciseUsage;
  final Map<DistractionActivity, int> distractionActivityUsage;

  final String mostEffectiveTechnique;
  final int cravingsResistedWithToolkit;

  const ToolkitStatistics({
    required this.totalBreathingSessions,
    required this.totalCbtSessions,
    required this.totalGroundingSessions,
    required this.totalDistractionSessions,
    required this.averageBreathingEffectiveness,
    required this.averageCbtEffectiveness,
    required this.averageGroundingEffectiveness,
    required this.averageDistractionEffectiveness,
    required this.breathingPatternUsage,
    required this.cbtTechniqueUsage,
    required this.groundingExerciseUsage,
    required this.distractionActivityUsage,
    required this.mostEffectiveTechnique,
    required this.cravingsResistedWithToolkit,
  });

  static ToolkitStatistics empty() {
    return const ToolkitStatistics(
      totalBreathingSessions: 0,
      totalCbtSessions: 0,
      totalGroundingSessions: 0,
      totalDistractionSessions: 0,
      averageBreathingEffectiveness: 0,
      averageCbtEffectiveness: 0,
      averageGroundingEffectiveness: 0,
      averageDistractionEffectiveness: 0,
      breathingPatternUsage: {},
      cbtTechniqueUsage: {},
      groundingExerciseUsage: {},
      distractionActivityUsage: {},
      mostEffectiveTechnique: 'Not enough data',
      cravingsResistedWithToolkit: 0,
    );
  }
}
