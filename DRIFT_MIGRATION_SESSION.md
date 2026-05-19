# Drift Migration Session — May 19, 2026

## Objective
Migrate QuitMate Flutter app from Isar to **Drift** (SQLite) for offline-first database management and resolve all resulting compilation errors.

---

## 1. Dependency Changes

### Removed (Isar)
- `isar` / `isar_flutter_libs`
- `isar_generator`

### Added (Drift)
- `drift: ^2.28.2`
- `sqlite3_flutter_libs`
- `drift_dev: ^2.28.0` (dev dependency)

### `build.yaml` Created
```yaml
targets:
  $default:
    builders:
      drift_dev:
        options:
          generate_connect_constructor: true
          generate_values_in_copy_with: true
          scoped_dart_components: true
```

---

## 2. Database Schema (`lib/core/services/database/app_database.dart`)

### 18 Tables Defined
| Table | Data Class Name |
|---|---|
| `UserProfiles` | `DbUserProfile` |
| `LogEntries` | `DbLogEntry` |
| `CravingEntries` | `DbCravingEntry` |
| `WeeklyReviews` | `DbWeeklyReview` |
| `Achievements` | `DbAchievement` |
| `BreathingSessions` | `DbBreathingSession` |
| `CbtSessions` | `DbCbtSession` |
| `GroundingSessions` | `DbGroundingSession` |
| `DistractionSessions` | `DbDistractionSession` |
| `ToolkitExercises` | `DbToolkitExercise` |
| `ToolkitSessions` | `DbToolkitSession` |
| `JournalEntries` | `DbJournalEntry` |
| `ScheduledNotifications` | `DbScheduledNotification` |
| `NotificationPreferences` | `DbNotificationPreference` |
| `NotificationHistory` | `DbNotificationHistory` |
| `RelapsePlans` | `DbRelapsePlan` |
| `RelapseContacts` | `DbRelapseContact` |
| `LapseRecoverySessions` | `DbLapseRecoverySession` |

### Type Converters
- `StringListConverter` — `List<String>` ↔ JSON TEXT
- `IntListConverter` — `List<int>` ↔ JSON TEXT
- `TriggerTypeListConverter` — `List<String>` ↔ JSON TEXT
- `PanicStepListConverter` — `List<Map<String, dynamic>>` ↔ JSON TEXT

### Database Initialization
```dart
@DriftDatabase(tables: [...])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);
  @override int get schemaVersion => 1;

  static Future<AppDatabase> open() async {
    final db = LazyDatabase(() async {
      final folder = await getApplicationDocumentsDirectory();
      final file = File(p.join(folder.path, 'quitmate.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
    return AppDatabase(db);
  }
}
```

---

## 3. Key Architectural Decisions

### 3.1 `@DataClassName` Annotations
All 18 tables were annotated with `@DataClassName('Db...')` to prevent name collisions between Drift-generated data classes and existing domain entities (e.g., `Achievement`, `JournalEntry`, `BreathingSession`).

### 3.2 Import Aliasing Strategy
Repository files use `as drift_db` alias for the database import:
```dart
import '...app_database.dart' as drift_db;
```
When only specific types are needed, `show` imports are preferred:
```dart
import '...app_database.dart' show AppDatabase, JournalEntriesCompanion, DbJournalEntry;
```

### 3.3 Cascade Operator Query Pattern
Drift 2.28's `SimpleSelectStatement.where()` returns `void`, not a new query builder. The cascade operator (`..`) pattern was adopted throughout:

```dart
// SELECT
final rows = await (db.select(db.table)
  ..where((t) => t.userId.equals(userId))
  ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

// UPDATE
await (db.update(db.table)
  ..where((t) => t.id.equals(row.id))).write(companion);

// DELETE
await (db.delete(db.table)
  ..where((t) => t.id.equals(row.id))).go();
```

### 3.4 DateTime Filtering In-Memory
Due to type inference issues with `isBiggerOrEqualValue` in the cascade pattern, DateTime filtering is done in-memory after fetching rows:
```dart
final rows = await (db.select(db.table)
  ..where((t) => t.userId.equals(userId))).get();
final filtered = startDate != null
    ? rows.where((r) => !r.startTime.isBefore(startDate)).toList()
    : rows;
```

### 3.5 Companion Class Naming
Companion classes retain the plural table name (no `Db` prefix):
- `JournalEntriesCompanion`, `AchievementsCompanion`, `UserProfilesCompanion`, etc.

Required fields must be passed directly; optional fields use `Value(...)`.

---

## 4. Files Modified

### Core
| File | Change |
|---|---|
| `pubspec.yaml` | Replaced Isar with Drift dependencies |
| `build.yaml` | Created with Drift options |
| `lib/core/services/database/app_database.dart` | 18 tables, 4 type converters, `@DataClassName` annotations |
| `lib/core/services/database/database_provider.dart` | Riverpod provider for `AppDatabase` |
| `lib/main.dart` | Initializes `AppDatabase`, overrides provider, seeds toolkit |
| `lib/app.dart` | Uses cascade operator for DB queries, removed unused imports |

### Achievements
| File | Change |
|---|---|
| `.../data/repositories/achievement_repository_impl.dart` | Cascade queries, `DbAchievement` types, `drift_db` alias |
| `.../presentation/providers/achievement_provider.dart` | Removed unnecessary casts/imports |
| `.../presentation/widgets/reasons_wall_card.dart` | Cascade queries, `DbUserProfile` companion |

### Craving Toolkit
| File | Change |
|---|---|
| `.../data/datasources/toolkit_seed_service.dart` | Added `shared: false` to mode-filtered entries |
| `.../data/repositories/journal_repository_impl.dart` | Cascade queries, `DbJournalEntry`, `show` imports |
| `.../data/repositories/toolkit_repository.dart` | Cascade queries, `Db*` types, in-memory DateTime filtering |
| `.../data/repositories/toolkit_repository_impl.dart` | Cascade queries, `DbToolkitExercise`, `DbToolkitSession` |
| `.../presentation/providers/toolkit_provider.dart` | Fixed missing required constructor arguments |

### Interventions / Notifications
| File | Change |
|---|---|
| `.../data/repositories/notification_repository.dart` | `drift_db`/`models` aliases, `DbScheduledNotification`, `DbNotificationPreference` |
| `.../presentation/providers/notification_provider.dart` | Fixed missing `userId` in companions |
| `.../services/notification_manager.dart` | Constructor syntax for `ScheduledNotification` |
| `.../services/notification_scheduler_service.dart` | All 9 notification builders: cascade → constructor with required fields |

### Onboarding
| File | Change |
|---|---|
| `.../data/repositories/profile_repository.dart` | Cascade queries, `DbUserProfile`, removed unused import |
| `.../presentation/providers/onboarding_provider.dart` | Fixed `UserProfilesCompanion` required fields |

### Relapse Prevention
| File | Change |
|---|---|
| `.../data/repositories/relapse_repository.dart` | Cascade queries, `Db*` types, added `uuid` import |
| `.../presentation/screens/edit_panic_steps_screen.dart` | Fixed `PanicStep` constructor required fields |
| `.../presentation/screens/relapse_plan_screen.dart` | Fixed `RelapseContact` constructor required fields |

### Tracking
| File | Change |
|---|---|
| `.../data/repositories/tracking_repository.dart` | Cascade queries, `DbLogEntry`, `DbCravingEntry`, in-memory DateTime filtering |
| `.../presentation/providers/tracking_provider.dart` | Fixed `LogEntry`/`CravingEntry` constructor required fields |
| `.../presentation/providers/statistics_provider.dart` | Updated for Drift types |
| `.../presentation/providers/lapse_recovery_provider.dart` | Fixed companion required fields |
| `.../presentation/providers/checkin_provider.dart` | Fixed `LogEntry` constructor required fields |
| `.../presentation/widgets/quick_log_sheet.dart` | Fixed `LogEntry` constructor required fields |
| `.../presentation/widgets/quick_log_button.dart` | Fixed `LogEntry` constructor required fields |

---

## 5. Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

Generated `lib/core/services/database/app_database.g.dart` (~21,295 lines) containing:
- 18 table classes (`$UserProfilesTable`, `$LogEntriesTable`, etc.)
- 18 data classes (`DbUserProfile`, `DbLogEntry`, etc.)
- 18 companion classes (`UserProfilesCompanion`, `LogEntriesCompanion`, etc.)
- `_$AppDatabase` abstract base class
- `$AppDatabaseManager` with typed table managers

---

## 6. Final State

```
flutter analyze
0 errors
2 warnings (1 in generated .g.dart, 1 unused method)
25 info-level lint suggestions (pre-existing, non-blocking)
```

---

## 7. Lessons Learned

1. **Drift data class naming**: By default, Drift generates data classes with the singular table name (e.g., `Achievement`), which collides with domain entities. Use `@DataClassName` to prefix them (e.g., `DbAchievement`).

2. **`where()` returns `void`**: In Drift 2.28, `SimpleSelectStatement.where()` mutates the statement and returns `void`. Use the cascade operator (`..`) instead of reassignment.

3. **DateTime comparisons**: `isBiggerOrEqualValue` causes type inference issues in cascade chains. Filter DateTime conditions in-memory after fetching.

4. **Companion required fields**: Columns without defaults and non-nullable columns are required in companion constructors. Nullable columns and columns with `.withDefault()` are optional (wrapped in `Value`).

5. **Import conflicts**: Use `as drift_db` alias or `show` imports to disambiguate between Drift-generated types and domain models.

6. **Auto-increment `id` in companions**: Never pass `id: Value(...)` in companion classes for tables with `integer().autoIncrement()`. The database generates the ID automatically. Passing `id: Value(0)` causes SQLite constraint violations. Remove `id` from all `_toCompanion()` methods and let auto-increment handle it; use `where((t) => t.id.equals(...))` for UPDATE operations instead.

---

## 8. Post-Migration Fix: Auto-Increment ID Constraint Violation

### Problem
Runtime SQLite error during `INSERT INTO scheduled_notifications`:
```
INSERT INTO "scheduled_notifications" ("id", "user_id", ...) VALUES (0, ...)
```
The `_scheduledToCompanion()` method was passing `id: Value(n.id)` where `n.id` defaults to `0`, conflicting with the auto-increment column.

### Fix
Removed `id: Value(...)` from ALL companion methods across the codebase:
- `notification_repository.dart` — `ScheduledNotificationsCompanion`, `NotificationPreferencesCompanion`
- `relapse_repository.dart` — `RelapsePlansCompanion`, `RelapseContactsCompanion`
- `profile_repository.dart` — `UserProfilesCompanion`
- `tracking_repository.dart` — `LogEntriesCompanion`, `CravingEntriesCompanion`

UPDATE operations still work correctly because they use `where((t) => t.id.equals(row.id))` to identify the target row.
