import 'package:isar/isar.dart';

part 'craving_entry.g.dart';

enum CravingIntensity {
  mild,
  moderate,
  strong,
  veryStrong;

  String get displayName {
    switch (this) {
      case CravingIntensity.mild:
        return 'Mild';
      case CravingIntensity.moderate:
        return 'Moderate';
      case CravingIntensity.strong:
        return 'Strong';
      case CravingIntensity.veryStrong:
        return 'Very Strong';
    }
  }

  int get value {
    switch (this) {
      case CravingIntensity.mild:
        return 3;
      case CravingIntensity.moderate:
        return 5;
      case CravingIntensity.strong:
        return 7;
      case CravingIntensity.veryStrong:
        return 10;
    }
  }
}

enum CravingOutcome {
  resisted,
  gaveIn,
  delayed,
  distracted;

  String get displayName {
    switch (this) {
      case CravingOutcome.resisted:
        return 'Resisted Successfully';
      case CravingOutcome.gaveIn:
        return 'Gave In';
      case CravingOutcome.delayed:
        return 'Delayed';
      case CravingOutcome.distracted:
        return 'Distracted';
    }
  }

  String get emoji {
    switch (this) {
      case CravingOutcome.resisted:
        return '💪';
      case CravingOutcome.gaveIn:
        return '😞';
      case CravingOutcome.delayed:
        return '⏰';
      case CravingOutcome.distracted:
        return '🎮';
    }
  }
}

@collection
class CravingEntry {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  late DateTime startTime;
  DateTime? endTime;

  @Enumerated(EnumType.name)
  late CravingIntensity initialIntensity;

  @Enumerated(EnumType.name)
  CravingIntensity? finalIntensity;

  @Enumerated(EnumType.name)
  CravingOutcome? outcome;

  // Triggers
  List<String> triggers = [];

  // Coping strategies used (link to Feature C)
  List<String> copingStrategiesUsed = [];

  // Notes
  String? notes;

  // Location
  String? location;

  // Metadata
  late DateTime createdAt;
  DateTime? updatedAt;

  CravingEntry() {
    createdAt = DateTime.now();
    startTime = DateTime.now();
  }

  // Computed properties
  int? get durationMinutes {
    if (endTime == null) return null;
    return endTime!.difference(startTime).inMinutes;
  }

  bool get wasSuccessfullyResisted {
    return outcome == CravingOutcome.resisted ||
        outcome == CravingOutcome.delayed ||
        outcome == CravingOutcome.distracted;
  }

  bool get isOngoing {
    return endTime == null;
  }

  int? get intensityReduction {
    if (finalIntensity == null) return null;
    return initialIntensity.value - finalIntensity!.value;
  }
}