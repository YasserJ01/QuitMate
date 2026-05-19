class ToolkitExerciseModel {
  int id;
  String exerciseId;
  String name;
  String category;
  bool isFavorite;
  DateTime? lastUsedAt;
  int durationEstimateSeconds;
  bool isSharedBothModes;
  String? modeFilter;
  String shortDescription;
  String fullInstructions;
  String? modeSpecificNote;
  DateTime seededAt;

  ToolkitExerciseModel({
    this.id = 0,
    required this.exerciseId,
    required this.name,
    required this.category,
    this.isFavorite = false,
    this.lastUsedAt,
    required this.durationEstimateSeconds,
    required this.isSharedBothModes,
    this.modeFilter,
    required this.shortDescription,
    required this.fullInstructions,
    this.modeSpecificNote,
    DateTime? seededAt,
  }) : seededAt = seededAt ?? DateTime.now();
}
