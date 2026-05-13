/// Domain entity for a journal entry.
class JournalEntry {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String content;
  final String? moodTag;
  final String? sourceExerciseId;
  final String? sourceExerciseName;

  const JournalEntry({
    required this.id,
    required this.userId,
    required this.createdAt,
    this.updatedAt,
    required this.content,
    this.moodTag,
    this.sourceExerciseId,
    this.sourceExerciseName,
  });
}

enum MoodTag {
  calm,
  anxious,
  hopeful,
  struggling,
  proud,
  neutral;

  String get label => switch (this) {
        MoodTag.calm => 'Calm',
        MoodTag.anxious => 'Anxious',
        MoodTag.hopeful => 'Hopeful',
        MoodTag.struggling => 'Struggling',
        MoodTag.proud => 'Proud',
        MoodTag.neutral => 'Neutral',
      };

  String get emoji => switch (this) {
        MoodTag.calm => '😌',
        MoodTag.anxious => '😟',
        MoodTag.hopeful => '🌱',
        MoodTag.struggling => '😓',
        MoodTag.proud => '🌟',
        MoodTag.neutral => '😐',
      };
}