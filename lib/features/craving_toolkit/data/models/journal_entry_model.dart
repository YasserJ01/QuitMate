import 'package:isar/isar.dart';

part 'journal_entry_model.g.dart';

/// Freeform journal entry with optional mood tag.
///
/// Can be created standalone from the Journal tab or linked from a toolkit
/// exercise session via [sourceExerciseId].
@collection
class JournalEntryModel {
  Id id = Isar.autoIncrement;

  /// Stable UUID for cross-referencing.
  @Index(unique: true)
  late String entryId;

  @Index()
  late String userId;

  @Index()
  late DateTime createdAt; // UTC

  DateTime? updatedAt;

  /// Freeform text content.  Encrypted at the Isar box level.
  late String content;

  /// [MoodTag.name] or null.
  String? moodTag;

  /// If created from a toolkit exercise, the exercise's stable UUID.
  String? sourceExerciseId;

  /// Denormalised exercise name for display.
  String? sourceExerciseName;
}