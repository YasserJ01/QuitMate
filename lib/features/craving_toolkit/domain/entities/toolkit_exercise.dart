/// Domain entity for a toolkit exercise — no Flutter or Isar dependencies.
class ToolkitExercise {
  final String id;
  final String name;
  final ExerciseCategory category;
  final int durationEstimateSeconds;
  final bool isSharedBothModes;
  final String? modeFilter;
  final bool isFavorite;
  final DateTime? lastUsedAt;
  final String shortDescription;
  final String fullInstructions;
  final String? modeSpecificNote;

  const ToolkitExercise({
    required this.id,
    required this.name,
    required this.category,
    required this.durationEstimateSeconds,
    required this.isSharedBothModes,
    this.modeFilter,
    this.isFavorite = false,
    this.lastUsedAt,
    required this.shortDescription,
    required this.fullInstructions,
    this.modeSpecificNote,
  });

  String get durationLabel {
    final mins = durationEstimateSeconds ~/ 60;
    final secs = durationEstimateSeconds % 60;
    if (mins == 0) return '${secs}s';
    if (secs == 0) return '$mins min';
    return '$mins min ${secs}s';
  }
}

enum ExerciseCategory {
  breathing,
  grounding,
  urgeSurfing,
  delayAndDistract,
  cognitiveReframing,
  journaling,
  relapseRecoveryPlanning;

  String get displayName => switch (this) {
        breathing => 'Breathing',
        grounding => 'Grounding',
        urgeSurfing => 'Urge Surfing',
        delayAndDistract => 'Delay & Distract',
        cognitiveReframing => 'Cognitive Reframing',
        journaling => 'Journaling',
        relapseRecoveryPlanning => 'Recovery Planning',
      };

  String get emoji => switch (this) {
        breathing => '🫁',
        grounding => '👁️',
        urgeSurfing => '🌊',
        delayAndDistract => '⏰',
        cognitiveReframing => '🧠',
        journaling => '📝',
        relapseRecoveryPlanning => '🛡️',
      };
}