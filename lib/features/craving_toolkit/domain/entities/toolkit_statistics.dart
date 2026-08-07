import 'toolkit_exercise.dart';

/// Aggregated, per-category statistics for the toolkit, computed from the
/// unified [ToolkitSession] table — the single source of truth for all
/// exercise activity across the feature.
class CategoryStat {
  final ExerciseCategory category;

  /// Total sessions started in this category.
  final int total;

  /// Sessions that were carried through to completion.
  final int completed;

  /// Average feedback rating (1–5) across rated sessions; 0 when none rated.
  final double averageRating;

  /// Per-exercise usage counts within this category, keyed by exercise name.
  final Map<String, int> exerciseUsage;

  const CategoryStat({
    required this.category,
    required this.total,
    required this.completed,
    required this.averageRating,
    required this.exerciseUsage,
  });
}

/// Toolkit usage statistics, keyed by [ExerciseCategory].
class ToolkitStatistics {
  /// Per-category breakdown. Only categories with at least one session appear.
  final Map<ExerciseCategory, CategoryStat> byCategory;

  /// Total sessions across all categories.
  final int totalSessions;

  /// Total completed sessions across all categories.
  final int completedSessions;

  /// The category with the highest average rating, or null when nothing rated.
  final ExerciseCategory? mostEffectiveCategory;

  /// Number of craving events where the user engaged a coping strategy.
  final int cravingsResistedWithToolkit;

  const ToolkitStatistics({
    required this.byCategory,
    required this.totalSessions,
    required this.completedSessions,
    required this.mostEffectiveCategory,
    required this.cravingsResistedWithToolkit,
  });

  bool get isEmpty => totalSessions == 0;

  /// Average rating for [category], or 0 when absent.
  double averageFor(ExerciseCategory category) =>
      byCategory[category]?.averageRating ?? 0;

  static ToolkitStatistics empty() {
    return const ToolkitStatistics(
      byCategory: {},
      totalSessions: 0,
      completedSessions: 0,
      mostEffectiveCategory: null,
      cravingsResistedWithToolkit: 0,
    );
  }
}
