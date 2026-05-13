import 'package:isar/isar.dart';

part 'toolkit_exercise_model.g.dart';

/// Seeded exercise catalogue entry.
///
/// On first run [ToolkitSeedService] writes the full 16-exercise catalogue
/// into this collection.  Subsequent runs only add new exercises that don't
/// exist yet, making schema additions migration-free.
@collection
class ToolkitExerciseModel {
  Id id = Isar.autoIncrement;

  /// Stable UUID string — survives re-seeding and re-installs.
  @Index(unique: true)
  late String exerciseId;

  late String name;

  /// [ExerciseCategory.name] — stored as string for Isar compatibility.
  late String category;

  @Index()
  late bool isFavorite;

  @Index()
  DateTime? lastUsedAt;

  /// Estimated duration in seconds, shown on exercise cards.
  late int durationEstimateSeconds;

  /// When true the exercise appears for both smoking and reduction modes.
  late bool isSharedBothModes;

  /// [GoalType.name] when mode-exclusive, null when shared.
  String? modeFilter;

  /// One-liner shown on the exercise card.
  late String shortDescription;

  /// Full markdown-ish instructions shown on the detail screen.
  late String fullInstructions;

  /// Appended to [fullInstructions] for mode-specific wording.
  String? modeSpecificNote;

  /// UTC timestamp of when this record was first seeded.
  late DateTime seededAt;
}