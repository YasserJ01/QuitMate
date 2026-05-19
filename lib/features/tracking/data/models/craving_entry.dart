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

class CravingEntry {
  int id;
  String userId;
  DateTime startTime;
  DateTime? endTime;
  CravingIntensity initialIntensity;
  CravingIntensity? finalIntensity;
  CravingOutcome? outcome;
  List<String> triggers;
  List<String> copingStrategiesUsed;
  String? notes;
  String? location;
  DateTime createdAt;
  DateTime? updatedAt;

  CravingEntry({
    this.id = 0,
    required this.userId,
    DateTime? startTime,
    this.endTime,
    required this.initialIntensity,
    this.finalIntensity,
    this.outcome,
    this.triggers = const [],
    this.copingStrategiesUsed = const [],
    this.notes,
    this.location,
    DateTime? createdAt,
    this.updatedAt,
  })  : startTime = startTime ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

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
