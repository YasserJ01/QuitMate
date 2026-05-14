# QuitMate — Craving Toolkit Enhancement Plan

**Document Version:** 1.0
**Status:** Ready for Implementation
**Stack:** Flutter · Isar · Riverpod · Clean Architecture
**Scope:** Craving Toolkit Feature — Full Enhancement & SRS Compliance
**Predecessor Document:** `QUITMATE_INTERVENTIONS_RELAPSE_PLAN.md` (Interventions & Relapse Prevention — Implemented)

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Current State Analysis](#2-current-state-analysis)
   - 2.1 [What Exists and Works](#21-what-exists-and-works)
   - 2.2 [Critical Bugs Identified](#22-critical-bugs-identified)
   - 2.3 [SRS Compliance Gaps](#23-srs-compliance-gaps)
   - 2.4 [Architecture Issues](#24-architecture-issues)
3. [SRS Compliance Requirements](#3-srs-compliance-requirements)
   - 3.1 [FR-T01: Accessibility in ≤2 Taps](#31-fr-t01-accessibility-in-2-taps)
   - 3.2 [FR-T02: Minimum 7 Exercise Types](#32-fr-t02-minimum-7-exercise-types)
   - 3.3 [FR-T03: Mode-Specific Content Filtering](#33-fr-t03-mode-specific-content-filtering)
   - 3.4 [FR-T04: Favorites and Recents](#34-fr-t04-favorites-and-recents)
   - 3.5 [FR-T05: Usage Tracking with Timestamps](#35-fr-t05-usage-tracking-with-timestamps)
   - 3.6 [FR-T06: Duration Estimates on Cards](#36-fr-t06-duration-estimates-on-cards)
   - 3.7 [FR-T07: Animated Breathing Timer](#37-fr-t07-animated-breathing-timer)
   - 3.8 [FR-T08: Journaling with Encrypted Storage](#38-fr-t08-journaling-with-encrypted-storage)
4. [Bug Inventory and Fixes](#4-bug-inventory-and-fixes)
   - 4.1 [BreathingExerciseScreen — Phase Timing Bugs](#41-breathingexercisescreen--phase-timing-bugs)
   - 4.2 [GroundingExerciseScreen — Completion Flow Bug](#42-groundingexercisescreen--completion-flow-bug)
   - 4.3 [CbtTechniqueScreen — Completion Flow Bug](#43-cbttechniquescreen--completion-flow-bug)
   - 4.4 [CravingToolkitScreen — Hardcoded List Bug](#44-cravingtoolkitscreen--hardcoded-list-bug)
   - 4.5 [ToolkitProvider — Dead State on Error Bug](#45-toolkitprovider--dead-state-on-error-bug)
   - 4.6 [JournalRepositoryImpl — Dynamic Query Bug](#46-journalrepositoryimpl--dynamic-query-bug)
   - 4.7 [ToolkitSeedService — Missing Mode-Specific Wording Bug](#47-toolkitseedservice--missing-mode-specific-wording-bug)
   - 4.8 [BreathingAnimation — SingleTicker Leak Bug](#48-breathinganimation--singleticker-leak-bug)
5. [Architecture Enhancement Plan](#5-architecture-enhancement-plan)
   - 5.1 [Clean Architecture Layer Boundaries](#51-clean-architecture-layer-boundaries)
   - 5.2 [Provider Topology Redesign](#52-provider-topology-redesign)
   - 5.3 [Repository Pattern Consolidation](#53-repository-pattern-consolidation)
   - 5.4 [Domain Entity Completion](#54-domain-entity-completion)
6. [CravingToolkitScreen — Full Redesign](#6-cravingtoolkitscreen--full-redesign)
   - 6.1 [Screen Entry & Navigation](#61-screen-entry--navigation)
   - 6.2 [Favorites Section](#62-favorites-section)
   - 6.3 [Recents Section](#63-recents-section)
   - 6.4 [All Exercises Section (Mode-Filtered)](#64-all-exercises-section-mode-filtered)
   - 6.5 [Exercise Detail Screen](#65-exercise-detail-screen)
   - 6.6 [Widget Breakdown and Accessibility](#66-widget-breakdown-and-accessibility)
7. [Breathing Exercise Enhancement](#7-breathing-exercise-enhancement)
   - 7.1 [Phase Timing Architecture Fix](#71-phase-timing-architecture-fix)
   - 7.2 [BreathingCircle Widget Redesign](#72-breathingcircle-widget-redesign)
   - 7.3 [Breathing Phase State Machine](#73-breathing-phase-state-machine)
   - 7.4 [AnimationController Lifecycle Safety](#74-animationcontroller-lifecycle-safety)
   - 7.5 [BreathingExerciseNotifier Refactor](#75-breathingexercisenotifier-refactor)
8. [Grounding Exercise Enhancement](#8-grounding-exercise-enhancement)
   - 8.1 [Stepped PageView Flow for All 5 Exercise Types](#81-stepped-pageview-flow-for-all-5-exercise-types)
   - 8.2 [Completion Flow Fix](#82-completion-flow-fix)
   - 8.3 [Optional Journal Save Integration](#83-optional-journal-save-integration)
9. [CBT Technique Enhancement](#9-cbt-technique-enhancement)
   - 9.1 [Completion Flow Fix](#91-completion-flow-fix)
   - 9.2 [Interactive Prompt Screens](#92-interactive-prompt-screens)
   - 9.3 [Mode-Specific Wording](#93-mode-specific-wording)
10. [New Exercise Screens](#10-new-exercise-screens)
    - 10.1 [UrgeSurfingScreen — Full Implementation](#101-urgesurfingscreen--full-implementation)
    - 10.2 [DelayDistractScreen — Full Implementation](#102-delaydistract-screen--full-implementation)
    - 10.3 [CognitiveReframingScreen — Full Implementation](#103-cognitivereframingscreen--full-implementation)
    - 10.4 [RelapseRecoveryPlanScreen — Toolkit Exercise](#104-relapserecoveryplanscreen--toolkit-exercise)
11. [Journaling Feature — Full Implementation](#11-journaling-feature--full-implementation)
    - 11.1 [JournalEntry Domain Entity](#111-journalentry-domain-entity)
    - 11.2 [JournalEntryModel Isar Collection](#112-journalentrymodel-isar-collection)
    - 11.3 [JournalRepositoryImpl Fix](#113-journalrepositoryimpl-fix)
    - 11.4 [JournalEntryScreen](#114-journalentryscreen)
    - 11.5 [JournalListScreen](#115-journallistscreen)
    - 11.6 [JournalProvider Architecture](#116-journalprovider-architecture)
12. [Post-Exercise Feedback Loop](#12-post-exercise-feedback-loop)
    - 12.1 [PostExerciseFeedbackSheet Widget](#121-postexercisefeedbacksheet-widget)
    - 12.2 [Feedback Data Storage](#122-feedback-data-storage)
    - 12.3 [Conditional Follow-Up Logic](#123-conditional-follow-up-logic)
13. [ToolkitSession Usage Tracking](#13-toolkitsession-usage-tracking)
    - 13.1 [ToolkitSessionModel Schema Review](#131-toolkitsessionmodel-schema-review)
    - 13.2 [Session Start and End Wiring](#132-session-start-and-end-wiring)
    - 13.3 [Weekly Summary Integration](#133-weekly-summary-integration)
14. [Mode-Specific Content Filtering](#14-mode-specific-content-filtering)
    - 14.1 [Exercise Catalogue — Mode Matrix](#141-exercise-catalogue--mode-matrix)
    - 14.2 [Seed Service — Mode-Specific Records](#142-seed-service--mode-specific-records)
    - 14.3 [GetExercisesForModeUseCase Fix](#143-getexercisesformodeusec-fix)
    - 14.4 [Runtime Mode Injection Pattern](#144-runtime-mode-injection-pattern)
15. [Favorites and Recents System](#15-favorites-and-recents-system)
    - 15.1 [Favorites Toggle — Isar Write Pattern](#151-favorites-toggle--isar-write-pattern)
    - 15.2 [StreamProvider for Live Favorites Updates](#152-streamprovider-for-live-favorites-updates)
    - 15.3 [Recents Query — lastUsedAt Sorting](#153-recents-query--lastuseddat-sorting)
    - 15.4 [Repeat Button — Skipping Detail Screen](#154-repeat-button--skipping-detail-screen)
16. [Accessibility Requirements](#16-accessibility-requirements)
    - 16.1 [Semantics Labeling Matrix](#161-semantics-labeling-matrix)
    - 16.2 [Live Regions for Dynamic Content](#162-live-regions-for-dynamic-content)
    - 16.3 [Contrast and Font Scaling](#163-contrast-and-font-scaling)
17. [Data Model Revisions](#17-data-model-revisions)
    - 17.1 [ToolkitExerciseModel — No Changes Required](#171-toolkitexercisemodel--no-changes-required)
    - 17.2 [ToolkitSessionModel — feedbackRating Enum Alignment](#172-toolkitsessionmodel--feedbackrating-enum-alignment)
    - 17.3 [JournalEntryModel — Schema Confirmed](#173-journalentrymodel--schema-confirmed)
    - 17.4 [Isar Registration — Verified Complete](#174-isar-registration--verified-complete)
18. [State Management Revisions](#18-state-management-revisions)
    - 18.1 [ToolkitSessionNotifier — AutoDisposeNotifier Migration](#181-toolkitsessionnotifier--autodisposenotifier-migration)
    - 18.2 [JournalNotifier — AsyncNotifier Pattern](#182-journalnotifier--asyncnotifier-pattern)
    - 18.3 [BreathingExerciseNotifier — Provider Cleanup](#183-breathingexercisenotifier--provider-cleanup)
    - 18.4 [FavoriteExercises — StreamProvider vs FutureProvider](#184-favoriteexercises--streamprovider-vs-futureprovider)
19. [Screen Inventory — Final State](#19-screen-inventory--final-state)
20. [Implementation Sequence](#20-implementation-sequence)
21. [File-Level Change Matrix](#21-file-level-change-matrix)
22. [Acceptance Criteria Checklist](#22-acceptance-criteria-checklist)
23. [QA Traceability Matrix](#23-qa-traceability-matrix)

---

## 1. Executive Summary

The craving toolkit is the most interaction-intensive feature in QuitMate. Users access it during active cravings — urgency is high, patience is low, and failures are visible. The current implementation has a working skeleton: 4 exercise types are partially functional, the data layer (Isar models, repositories, seed service) is largely in place, and the UI screens exist. However, critical bugs in completion flows, phase timing, and provider architecture prevent the feature from delivering on its SRS requirements.

This document defines a precise, developer-ready plan to bring the craving toolkit to full SRS v2.0 compliance. The plan covers:

- **Bug fixes** that prevent exercises from completing correctly and persisting data.
- **Architecture cleanup** that resolves provider race conditions, duplicated repository responsibilities, and broken dynamic Isar queries.
- **New screens and exercises** to meet the SRS minimum of 7 exercise categories.
- **Favorites and recents systems** backed by Isar live queries.
- **Mode-specific content filtering** at the domain layer.
- **Full journaling feature** with encrypted Isar storage, mood tags, and auto-save.
- **Post-exercise feedback** wired to `ToolkitSessionModel.feedbackRating`.
- **Accessibility compliance** per SRS NFR-08/09.

**Architectural constraints — retained unchanged:**

- Database: **Isar** (no Hive, no SQLite).
- State management: **Riverpod** (`StateNotifier`, `AsyncNotifier`, `FutureProvider`, `StreamProvider`). No BLoC.
- Architecture: **Clean Architecture** — Domain → Data → Presentation. Domain layer has zero Flutter dependencies.
- Offline-only: zero outbound network requests.

---

## 2. Current State Analysis

### 2.1 What Exists and Works

| Component | Status | Notes |
|-----------|--------|-------|
| `ToolkitExerciseModel` (Isar) | ✅ Schema correct | Generated `.g.dart` in place |
| `ToolkitSessionModel` (Isar) | ✅ Schema correct | Generated `.g.dart` in place |
| `JournalEntryModel` (Isar) | ✅ Schema correct | Generated `.g.dart` in place |
| `ToolkitSeedService` | ⚠️ Partially correct | 16 exercises seeded; mode-specific wording NOT set in catalogue despite fields existing |
| `ToolkitRepositoryImpl` | ⚠️ Mostly correct | `watchFavorites` uses a broken `.asStream().asyncMap()` pattern that does not reactively watch Isar |
| `JournalRepositoryImpl` | ⚠️ Bug present | Uses `dynamic` query builder — Isar type-state breaks at runtime when filters are applied after sort |
| `CravingToolkitScreen` | ⚠️ Functional skeleton | No favorites section, no recents, no mode filtering, hardcoded exercise lists |
| `BreathingExerciseScreen` | ⚠️ Functional but wrong | Phase timing logic in `toolkit_models.dart` has incorrect values for `relaxing` and `calm` patterns |
| `GroundingExerciseScreen` | ⚠️ Bug: never completes | `_completeExercise()` saves responses but `notifier.complete()` is never called unless rating dialog is dismissed, leaving `isCompleted = false` |
| `CbtTechniqueScreen` | ⚠️ Bug: never completes | `_completeExercise()` only calls `updateThoughts()` but not `notifier.complete()` — fixed in codebase notes but needs confirmation |
| `UrgeSurfingScreen` | ✅ Exists | Standalone screen; not wired to catalogue |
| `DelayDistractScreen` | ✅ Exists | Standalone screen; not wired to catalogue |
| `CognitiveReframingScreen` | ✅ Exists | Standalone screen; not wired to catalogue |
| `RelapseRecoveryPlanScreen` | ✅ Exists | Standalone screen; not wired to catalogue |
| `JournalEntryScreen` | ✅ Exists | Not wired to catalogue |
| `JournalListScreen` | ✅ Exists | Accessible only if directly navigated to |
| `PostExerciseFeedbackSheet` | ✅ Widget exists | Not wired to any exercise screen except `UrgeSurfingScreen` |
| `ExerciseCard` widget | ✅ Exists | Not used in `CravingToolkitScreen` — screen uses old category cards instead |
| `ExerciseChip` widget | ✅ Exists | Not used anywhere |
| Domain entities | ✅ Exist | `ToolkitExercise`, `ToolkitSession`, `JournalEntry` all defined |
| Use cases | ✅ Exist | `GetExercisesForModeUseCase`, `ToggleFavoriteUseCase`, `RecordSessionUseCase`, `GetRecentExercisesUseCase` |
| `ToolkitProvider` | ⚠️ Duplicate responsibilities | Both `ToolkitRepository` (old) and `ToolkitRepositoryImpl` (new) exist; provider file creates both; exercises use old repo, session tracking uses new repo — inconsistent |

### 2.2 Critical Bugs Identified

**Bug 1 — Breathing phase timing incorrect (FR-T07)**

In `lib/features/craving_toolkit/data/models/toolkit_models.dart`, the `BreathingPattern` enum returns incorrect hold and exhale seconds for the `relaxing` (4-7-8) and `calm` patterns:

```dart
// CURRENT (WRONG):
int get holdSeconds {
  case BreathingPattern.relaxing:
    return 7;    // ✅ Correct
  case BreathingPattern.calm:
    return 6;    // ❌ Wrong — calm should have 0 hold, just 4 inhale + 6 exhale
}

int get exhaleSeconds {
  case BreathingPattern.relaxing:
    return 8;    // ✅ Correct
  case BreathingPattern.energizing:
    return 4;    // ❌ Wrong — energizing should be 2s exhale (quick breath out)
  case BreathingPattern.calm:
    return 4;    // ❌ Wrong — calm should be 6s exhale
}
```

The SRS §4.4 Breathing Exercise Enhancement defines the correct timings as:
- Box: inhale 4 / hold 4 / exhale 4 / pause 4
- Relaxing (4-7-8): inhale 4 / hold 7 / exhale 8 / pause 0
- Energizing: inhale 6 / exhale 2 / (no hold, no pause)
- Calm: inhale 4 / exhale 6 / (no hold, no pause)

**Bug 2 — GroundingExerciseScreen completion never reaches `isCompleted = true`**

In `grounding_exercise_screen.dart`, `_completeExercise()` calls `saveFiveSensesResponses()` then `_showEffectivenessRating()`. The rating dialog shows, but if the user taps "Skip" (which calls `Navigator.pop(context)` with no value), `rating` becomes `null`, and the code uses `rating ?? 3`. The `notifier.complete(effectivenessRating)` IS called — however the screen then immediately calls `Navigator.pop(context)` without waiting for state to propagate to `isCompleted = true`. The completion screen is never shown because navigation happens synchronously before the Riverpod state update triggers a rebuild.

**Root cause:** `notifier.complete()` is `async` and updates Isar. The `if (mounted) Navigator.pop(context)` executes immediately after `await`, which pops the screen. The completion screen widget is never rendered.

**Fix:** Remove the `Navigator.pop(context)` from `_showEffectivenessRating()`. Instead, let `isCompleted = true` in the notifier trigger a `ref.listen` that pushes to a completion screen or shows a completion overlay.

**Bug 3 — CbtTechniqueScreen `_completeExercise` calls `_showEffectivenessRating` which pops the screen**

Same root cause as Bug 2. `_showEffectivenessRating()` ends with `Navigator.pop(context)`, which pops the `CbtTechniqueScreen` before the completion screen is rendered. The fix is the same pattern: listen to `state.isCompleted` via `ref.listen` and show an in-screen completion view.

**Bug 4 — `ToolkitRepositoryImpl.watchFavorites` uses broken `asStream().asyncMap()` pattern**

```dart
// CURRENT (BROKEN — does NOT watch Isar reactively):
Stream<List<ToolkitExercise>> watchFavorites(String mode) {
  return _db.asStream().asyncMap((isar) async {
    // This fires ONCE when the Future completes, then never again
    final models = await isar.toolkitExerciseModels
        .filter()
        .isFavoriteEqualTo(true)
        .findAll();
    ...
  });
}
```

The correct Isar reactive pattern uses `.watch(fireImmediately: true)`:

```dart
// CORRECT — fires on every change to the collection:
Stream<List<ToolkitExercise>> watchFavorites(String mode) async* {
  final isar = await _db;
  yield* isar.toolkitExerciseModels
      .filter()
      .isFavoriteEqualTo(true)
      .watch(fireImmediately: true)
      .map((models) => models
          .where((m) => m.isSharedBothModes || m.modeFilter == mode)
          .map(_toEntity)
          .toList());
}
```

**Bug 5 — `JournalRepositoryImpl.getEntries` dynamic query pattern breaks at runtime**

```dart
// CURRENT (BROKEN — Isar QueryBuilder type-state changes after .sortBy*):
dynamic query = isar.journalEntryModels
    .filter()
    .userIdEqualTo(userId)
    .sortByCreatedAtDesc();   // <-- Type changes here

if (moodFilter != null) {
  query = query.filter().moodTagEqualTo(moodFilter);  // ❌ .filter() not available on sorted query
}
```

Isar's `QueryBuilder` uses Dart's generic type-state pattern. After calling `.sortByCreatedAtDesc()`, the builder is in `QAfterSortBy` state, which does not have a `.filter()` method. Using `dynamic` bypasses compile-time checking but causes a runtime `NoSuchMethodError`.

**Fix:** Build the query conditionally before sorting:

```dart
Future<List<JournalEntry>> getEntries({
  required String userId,
  String? moodFilter,
  int? limit,
}) async {
  final isar = await _db;

  // Build filter chain without dynamic
  QueryBuilder<JournalEntryModel, JournalEntryModel, QAfterFilterCondition> filterQuery;

  if (moodFilter != null) {
    filterQuery = isar.journalEntryModels
        .filter()
        .userIdEqualTo(userId)
        .and()
        .moodTagEqualTo(moodFilter);
  } else {
    filterQuery = isar.journalEntryModels
        .filter()
        .userIdEqualTo(userId);
  }

  final sortedQuery = filterQuery.sortByCreatedAtDesc();
  
  final models = limit != null
      ? await sortedQuery.limit(limit).findAll()
      : await sortedQuery.findAll();

  return models.map(_toEntity).toList();
}
```

**Bug 6 — `ToolkitSeedService` does not set `modeSpecificNote` despite catalogue defining it**

In `toolkit_seed_service.dart`, the `_make()` factory helper accepts `modeNoteSmoking` and `modeNoteReduction` parameters but the `ToolkitExerciseModel` is created with `modeSpecificNote = null` unconditionally:

```dart
static ToolkitExerciseModel _make({
  ...
  String? modeNoteSmoking,    // Accepted but IGNORED
  String? modeNoteReduction,  // Accepted but IGNORED
}) {
  final model = ToolkitExerciseModel()
    ...
    ..modeSpecificNote = null;  // ❌ Always null regardless of input
  return model;
}
```

Since exercises for urge surfing and delay-and-distract have different wording per mode, the seed service must create **two separate records** — one per mode — when `modeNoteSmoking` or `modeNoteReduction` are provided.

**Bug 7 — `BreathingExerciseNotifier` provider creates a dead notifier on error state**

```dart
// In toolkit_provider.dart:
final breathingExerciseProvider = StateNotifierProvider.autoDispose
    .family<...>((ref, pattern) {
  ...
  return userIdAsync.when(
    data: (userId) => BreathingExerciseNotifier(repository, userId ?? '', pattern),
    loading: () => BreathingExerciseNotifier(repository, '', pattern),
    error: (_, _) => BreathingExerciseNotifier(repository, '', pattern),  // ❌ Dead notifier with empty userId
  );
});
```

When `currentUserIdProvider` errors (e.g., secure storage unavailable during first launch), a notifier with an empty userId is returned. Any session started from this notifier will write records with `userId = ''`, which are orphaned. The fix is to not create the breathing notifier until the userId is available, or to guard all writes in the notifier with a userId validation.

**Bug 8 — `CravingToolkitScreen` does not use the domain layer at all**

The `CravingToolkitScreen` currently shows 4 hardcoded category cards (Breathing, CBT, Grounding, Distraction) built entirely in the widget with no connection to `ToolkitRepositoryImpl`, `ExerciseCard`, favorites, recents, or mode filtering. The entire new data layer (provider, repository, use cases, seed service) is unreachable from the main entry point of the feature.

### 2.3 SRS Compliance Gaps

| SRS Reference | Requirement | Current Status |
|---------------|-------------|----------------|
| FR-T01 | Toolkit accessible in ≤2 taps from any screen | ⚠️ Accessible from dashboard FAB but not verified from all screens |
| FR-T02 | Minimum 7 exercise types fully implemented | ❌ 4 types present (breathing, CBT/urge surfing, grounding, distraction stub), 3 missing from catalogue wiring |
| FR-T03 | Mode-specific content when needed | ❌ No mode filtering in `CravingToolkitScreen` |
| FR-T04 | Favorites and "repeat recent" in 1 tap | ❌ No favorites UI, no recents section |
| FR-T05 | Usage timestamps + exerciseId recorded | ⚠️ Session model exists but screens do not call `startSession` / `endSession` |
| FR-T06 | Duration estimate visible before starting | ⚠️ `ExerciseCard` widget has it but is not used in main screen |
| FR-T07 | Breathing animation correct timing + phase labels | ❌ Phase timings wrong for `relaxing` and `calm` patterns |
| FR-T08 | Journaling stored in encrypted local database | ⚠️ Model and repository exist but dynamic query bug prevents reliable reads |

### 2.4 Architecture Issues

**Issue 1 — Dual Repository Problem**

Two repositories exist in parallel:
- `ToolkitRepository` (old): handles `BreathingSession`, `CbtSession`, `GroundingSession`, `DistractionSession` — the legacy Isar collections.
- `ToolkitRepositoryImpl`: handles `ToolkitExerciseModel`, `ToolkitSessionModel` — the new unified catalogue.

The `toolkit_provider.dart` exposes providers for both (`toolkitRepositoryProvider` and `toolkitExerciseRepoProvider`). Screens that use the old `BreathingExerciseNotifier` call the old repository, while the new session tracking calls the new repository. This means a single exercise session may write to **both** the old `BreathingSession` collection AND the new `ToolkitSessionModel` collection — creating duplicate records.

**Resolution:** The old per-type session collections (`BreathingSession`, `CbtSession`, `GroundingSession`, `DistractionSession`) should be deprecated. All session recording goes through `ToolkitSessionModel`. The old `ToolkitRepository` (stats calculation, per-type session CRUD) should be removed or converted to read from `ToolkitSessionModel`.

**Issue 2 — `CravingToolkitScreen` is not integrated with the domain layer**

The main toolkit screen bypasses the entire domain layer. The `ExerciseCard`, `ExerciseChip`, `IToolkitRepository`, and `ToolkitSessionNotifier` all exist but are invisible to the user because `CravingToolkitScreen` renders hardcoded `_buildCategoryCard` widgets.

**Issue 3 — Missing mode context injection**

The `CravingToolkitScreen` has no access to the user's current `GoalType`. The `UrgeSurfingScreen`, `DelayDistractScreen`, and `CognitiveReframingScreen` all accept a `mode` parameter but are never navigated to from `CravingToolkitScreen` with the correct mode value.

---

## 3. SRS Compliance Requirements

### 3.1 FR-T01: Accessibility in ≤2 Taps

The toolkit must be reachable in ≤2 taps from any screen. The existing navigation entry points are:
- Dashboard FAB labeled "I need help now" → `CravingToolkitScreen` (1 tap — compliant).
- Log screen persistent button → `CravingToolkitScreen` (1 tap — compliant).
- `LapseRecoveryScreen` Step 2 option "Open Craving Toolkit" → `CravingToolkitScreen` (compliant, context-triggered).

**Action required:** Verify the FAB and Log screen button are both wired in `DashboardScreen`. Once `CravingToolkitScreen` is open, the first exercise must begin in **<1 second** with no network requests (FR-T01 acceptance criterion).

The toolkit must open as a `MaterialPageRoute` (not a bottom sheet) to ensure full-screen availability of the exercise content. Current implementation is correct on this point.

### 3.2 FR-T02: Minimum 7 Exercise Types

SRS §7.4 requires a minimum of 7 exercise types:

| # | Exercise Type | Category | Current Status |
|---|--------------|----------|----------------|
| 1 | Breathing exercises (4 patterns) | `breathing` | ✅ Implemented (bugs to fix) |
| 2 | Grounding (5-4-3-2-1, body scan, object focus, counting, cold water) | `grounding` | ✅ Implemented (completion bug) |
| 3 | Urge surfing | `urgeSurfing` | ✅ Screen exists, not wired to catalogue |
| 4 | Delay-and-distract | `delayAndDistract` | ✅ Screen exists, not wired to catalogue |
| 5 | Cognitive reframing | `cognitiveReframing` | ✅ Screen exists, not wired to catalogue |
| 6 | Journaling | `journaling` | ✅ Screen exists, not wired to catalogue |
| 7 | Relapse recovery planning | `relapseRecoveryPlanning` | ✅ Screen exists, not wired to catalogue |

**Summary:** All 7 exercise type screens exist. The work required is wiring them to the `CravingToolkitScreen` via the `ToolkitExerciseModel` catalogue and proper navigation.

### 3.3 FR-T03: Mode-Specific Content Filtering

The toolkit must show mode-specific content:
- **Smoking mode:** nicotine-withdrawal coping for breathing and urge surfing; oral substitutes for delay-and-distract; smoke-free identity for cognitive reframing.
- **Reduction mode:** stimulus control and environment redesign; sexual-urge wording for urge surfing; physical activity suggestions for delay-and-distract.

Shared exercises include a `modeSpecificNote` field that is conditionally rendered. Mode-exclusive exercises have a `modeFilter` set to the appropriate `GoalType.name`.

**Action required:** The `CravingToolkitScreen` must read the user's `GoalType` from the profile provider and pass it as a family parameter to `toolkitExercisesProvider(mode)`. The mode must be injected into exercise screens that branch on it.

### 3.4 FR-T04: Favorites and Recents

- **Favorites:** Heart/star icon on each `ExerciseCard`. Toggle is instant and persisted in Isar. A favorites section appears at the top of the toolkit list.
- **Recents:** Last 3 used exercises shown in a "Recently Used" section. Each has a "Repeat" button that navigates directly to the exercise screen, skipping the detail screen.
- **Both must persist across app restarts** via Isar `isFavorite` and `lastUsedAt` fields.

### 3.5 FR-T05: Usage Tracking with Timestamps

Every exercise session must write a `ToolkitSessionModel` record:
- On screen `initState`: `ToolkitSessionNotifier.startSession(exercise, userId, mode)`.
- On completion/abandon: `ToolkitSessionNotifier.endSession(completed: true/false)`.
- On feedback: `ToolkitSessionNotifier.recordFeedback(rating)`.

The session record feeds the weekly summary and toolkit history screen.

### 3.6 FR-T06: Duration Estimates on Cards

Each exercise card must show an estimated duration (e.g., "~3 min") visible **before** the user taps into the exercise. This uses `ToolkitExercise.durationLabel` from the domain entity. The `ExerciseCard` widget already implements `_DurationChip` — it is not being rendered because the screen uses hardcoded category cards instead.

### 3.7 FR-T07: Animated Breathing Timer

The breathing animation must work fully offline, use `AnimationController` (no GIF/video), and show the correct phase durations per pattern. Phase label must change synchronously with the animation phase change. The circle must grow on inhale and shrink on exhale.

Current implementation uses `BreathingAnimation` widget (custom painter) which is offline-compliant. The bugs are in the duration values and phase synchronization.

### 3.8 FR-T08: Journaling with Encrypted Storage

Journal entries are stored in the encrypted `JournalEntryModel` Isar collection. The `JournalEntryScreen` supports freeform text + mood tag. Auto-save fires every 30 seconds. The entry can be initiated from within an exercise (CTA: "Save to Journal") or independently.

---

## 4. Bug Inventory and Fixes

### 4.1 BreathingExerciseScreen — Phase Timing Bugs

**File:** `lib/features/craving_toolkit/data/models/toolkit_models.dart`

**Problem:** The `BreathingPattern` enum's computed getters return incorrect values:

```dart
// CURRENT BROKEN STATE:
// Pattern: relaxing (4-7-8)
inhaleSeconds → 4  ✅
holdSeconds → 7    ✅
exhaleSeconds → 8  ✅  (correct!)
pauseSeconds → 0   ✅

// Pattern: calm (4-6, no hold)
inhaleSeconds → 4  ✅
holdSeconds → 6    ❌ (should be 0 — calm has no hold phase)
exhaleSeconds → 4  ❌ (should be 6 — the exhale is the long part)
pauseSeconds → 0   ✅

// Pattern: energizing (6-2, no hold)
inhaleSeconds → 4  ❌ (should be 6)
holdSeconds → 4    ❌ (should be 0)
exhaleSeconds → 4  ❌ (should be 2)
pauseSeconds → 0   ✅
```

**Fix — Corrected Enum Values:**

```dart
int get inhaleSeconds {
  switch (this) {
    case BreathingPattern.box:        return 4;
    case BreathingPattern.relaxing:   return 4;
    case BreathingPattern.energizing: return 6;  // FIXED: was 4
    case BreathingPattern.calm:       return 4;
    case BreathingPattern.custom:     return 4;
  }
}

int get holdSeconds {
  switch (this) {
    case BreathingPattern.box:        return 4;
    case BreathingPattern.relaxing:   return 7;
    case BreathingPattern.energizing: return 0;  // FIXED: was 4 — no hold phase
    case BreathingPattern.calm:       return 0;  // FIXED: was 6 — no hold phase
    case BreathingPattern.custom:     return 4;
  }
}

int get exhaleSeconds {
  switch (this) {
    case BreathingPattern.box:        return 4;
    case BreathingPattern.relaxing:   return 8;
    case BreathingPattern.energizing: return 2;  // FIXED: was 4 — quick exhale
    case BreathingPattern.calm:       return 6;  // FIXED: was 4 — long exhale
    case BreathingPattern.custom:     return 4;
  }
}

int get pauseSeconds {
  switch (this) {
    case BreathingPattern.box:        return 4;
    case BreathingPattern.relaxing:   return 0;
    case BreathingPattern.energizing: return 0;
    case BreathingPattern.calm:       return 0;
    case BreathingPattern.custom:     return 0;
  }
}
```

**Impact of fix:** `_alignDuration()` in `BreathingExerciseNotifier` calls `totalCycleSeconds` which is derived from these getters. Correcting them ensures the duration alignment and progress calculations work correctly. The `BreathingAnimation` widget uses the phase label from `state.currentPhase`, which is driven by `_getNextPhase()` — this logic is cycle-aware and will work correctly once the enum values are fixed.

### 4.2 GroundingExerciseScreen — Completion Flow Bug

**File:** `lib/features/craving_toolkit/presentation/screens/grounding_exercise_screen.dart`

**Problem:** After the user completes a grounding exercise and submits the effectiveness rating, `notifier.complete(effectivenessRating)` is called and then `Navigator.pop(context)` immediately follows. The `isCompleted` state change triggers a widget rebuild, but since the screen has already been popped, the completion screen is never shown.

**Fix — Use `ref.listen` for completion state:**

Remove `Navigator.pop(context)` from `_showEffectivenessRating()`. Instead, add a `ref.listen` in `build()`:

```dart
@override
Widget build(BuildContext context) {
  final state = ref.watch(groundingSessionProvider(widget.exercise));

  // Listen for completion — show snackbar and pop after state settles
  ref.listen<GroundingSessionState>(
    groundingSessionProvider(widget.exercise),
    (previous, next) {
      if (previous?.isCompleted == false && next.isCompleted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Great job staying grounded!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        // Navigate out only AFTER state is updated and completion screen renders
        Future.microtask(() {
          if (mounted) Navigator.pop(context);
        });
      }
    },
  );

  return PopScope(
    // ... existing pop handling
    child: Scaffold(
      body: state.isCompleted
          ? _buildCompletionScreen(state)
          : !_hasStarted
              ? _buildIntroScreen()
              : _buildExerciseContent(state),
    ),
  );
}
```

This ensures the completion screen renders (because `isCompleted = true` → `_buildCompletionScreen()` is shown) before the microtask pops the screen.

**Alternative approach (simpler):** Show the completion content inline within the screen rather than popping. The rating feedback is the final step; after it, show a "Well done" card within the exercise screen and provide a "Return to Toolkit" button. This is the approach already implemented in `CbtTechniqueScreen._buildCompletionScreen()` — adopt the same pattern for grounding.

### 4.3 CbtTechniqueScreen — Completion Flow Bug

**File:** `lib/features/craving_toolkit/presentation/screens/cbt_technique_screen.dart`

**Problem:** `_completeExercise()` calls `_showEffectivenessRating()`, which upon dialog dismissal calls `await notifier.complete()` and then `Navigator.pop(context)`. Same root cause as grounding.

**Fix:** Adopt the same pattern — remove `Navigator.pop(context)` from the rating callback and use `ref.listen` to detect `state.isCompleted` and render the completion screen. The `_buildCompletionScreen()` already exists in `CbtTechniqueScreen` — it just needs to be triggered by state rather than by explicit navigation.

The key change in `_showEffectivenessRating()`:

```dart
// BEFORE (broken):
await ref.read(...).complete(wasHelpful, rating);
if (mounted) {
  ScaffoldMessenger.of(context).showSnackBar(...);
  Navigator.pop(context);  // ❌ This pops before completion screen renders
}

// AFTER (correct):
await ref.read(...).complete(wasHelpful, rating);
// State update triggers ref.listen → completion screen renders
// Navigator.pop is handled by the "Return to Toolkit" button in _buildCompletionScreen
```

### 4.4 CravingToolkitScreen — Hardcoded List Bug

**File:** `lib/features/craving_toolkit/presentation/screens/craving_toolkit_screen.dart`

**Problem:** The entire screen renders 4 hardcoded `_buildCategoryCard` widgets that navigate to bottom sheets with more hardcoded lists. None of this uses the catalogue, `ExerciseCard`, favorites, recents, or mode filtering.

**Fix:** Full screen redesign (see Section 6).

### 4.5 ToolkitProvider — Dead State on Error Bug

**File:** `lib/features/craving_toolkit/presentation/providers/toolkit_provider.dart`

**Problem:** `breathingExerciseProvider` returns a notifier with `userId = ''` when `currentUserIdProvider` is in error state:

```dart
error: (_, _) => BreathingExerciseNotifier(repository, '', pattern),
```

**Fix:** The provider should throw or return a loading state, not create a notifier with empty userId:

```dart
final breathingExerciseProvider = StateNotifierProvider.autoDispose
    .family<BreathingExerciseNotifier, BreathingExerciseState, BreathingPattern>(
  (ref, pattern) {
    final repository = ref.watch(toolkitRepositoryProvider);
    final userId = ref.watch(currentUserIdProvider).valueOrNull ?? '';
    // If userId is empty, the notifier will guard writes
    return BreathingExerciseNotifier(repository, userId, pattern);
  },
);
```

Inside `BreathingExerciseNotifier.start()`, add a guard:

```dart
Future<void> start() async {
  if (_userId.isEmpty) {
    debugPrint('BreathingExerciseNotifier: userId not available, skipping session record');
    // Still allow the visual exercise to run — just don't write to Isar
    state = state.copyWith(isRunning: true);
    _startTimer();
    return;
  }
  // ... existing start logic
}
```

### 4.6 JournalRepositoryImpl — Dynamic Query Bug

**File:** `lib/features/craving_toolkit/data/repositories/journal_repository_impl.dart`

**Problem:** Described in Section 2.2 Bug 5.

**Fix:** Described in Section 2.2 Bug 5. The corrected implementation avoids `dynamic` by building the filter query conditionally before applying `sortBy`.

### 4.7 ToolkitSeedService — Missing Mode-Specific Wording Bug

**File:** `lib/features/craving_toolkit/data/datasources/toolkit_seed_service.dart`

**Problem:** Mode-specific exercises (urge surfing, delay-and-distract) need two separate catalogue entries — one per mode — with appropriate `modeFilter` and `modeSpecificNote`. The current `_make()` factory always sets `modeFilter = null` and `modeSpecificNote = null`.

**Fix:** Create separate entries for mode-specific exercises. Update the catalogue:

```dart
// Urge Surfing — Smoking version
_makeMode(
  id: 'urge-surfing-smoking',
  name: 'Urge Surfing (Smoking)',
  category: 'urgeSurfing',
  duration: 300,
  modeFilter: 'quitSmoking',
  shortDesc: 'Ride the nicotine craving wave. Peak passes in 3-5 minutes.',
  fullInstr: 'Nicotine cravings peak within 3–5 minutes. '
      'You do not need to fight it — just observe it.',
  modeNote: 'Nicotine cravings typically peak within 3–5 minutes. '
      'You do not need to fight it — just observe it.',
),

// Urge Surfing — Reduction version
_makeMode(
  id: 'urge-surfing-reduction',
  name: 'Urge Surfing',
  category: 'urgeSurfing',
  duration: 300,
  modeFilter: 'reduceMasturbation',
  shortDesc: 'Urges are waves. They rise, peak, and fall.',
  fullInstr: 'Urges follow the same wave pattern. '
      'They rise, peak, and fall. You are not the urge.',
  modeNote: 'Urges follow the same wave pattern. '
      'They rise, peak, and fall. You are not the urge.',
),
```

Add a `_makeMode()` factory helper alongside `_make()`:

```dart
static ToolkitExerciseModel _makeMode({
  required String id,
  required String name,
  required String category,
  required int duration,
  required String modeFilter,    // GoalType.name — non-null for mode-specific
  required String shortDesc,
  required String fullInstr,
  String? modeNote,
}) {
  return ToolkitExerciseModel()
    ..exerciseId = id
    ..name = name
    ..category = category
    ..isFavorite = false
    ..lastUsedAt = null
    ..durationEstimateSeconds = duration
    ..isSharedBothModes = false
    ..modeFilter = modeFilter
    ..shortDescription = shortDesc
    ..fullInstructions = fullInstr
    ..modeSpecificNote = modeNote
    ..seededAt = DateTime.now().toUtc();
}
```

### 4.8 BreathingAnimation — SingleTicker Leak Bug

**File:** `lib/features/craving_toolkit/presentation/widgets/breathing_animation.dart`

**Problem:** `BreathingAnimation` uses `SingleTickerProviderStateMixin` and creates an `AnimationController` in `initState`. When `didUpdateWidget` fires (phase changes), `_setupAnimation()` calls `_controller.duration = ...` and `_controller.reset()`, then `_controller.forward()`. However, the old animation controller is disposed and recreated — but within `_setupAnimation()`, a **new** `AnimationController` is NOT created; instead the existing one's duration is updated. This is correct. However, if the widget is disposed while an animation is in progress, the `_controller.dispose()` in `dispose()` correctly cleans up.

**The actual issue:** `_setupAnimation()` calls `_controller.reset()` and `_controller.forward()` in a loop. If `didUpdateWidget` fires very rapidly (phase changes every 4 seconds), the controller can be mid-animation when reset. This is acceptable for the breathing use case. No actual memory leak exists — this is a non-critical note.

**Minor fix to improve robustness:** Add `_controller.stop()` before `_controller.reset()` in `_setupAnimation()`:

```dart
void _setupAnimation() {
  _controller.stop();    // ADD THIS — stop any in-progress animation
  _controller.duration = Duration(seconds: _getPhaseDuration());
  // ... rest of setup
  _controller.reset();
  _controller.forward();
}
```

---

## 5. Architecture Enhancement Plan

### 5.1 Clean Architecture Layer Boundaries

The craving toolkit must maintain strict separation between layers. After enhancement, the dependency graph is:

```
Presentation Layer
  ├── Screens (use Riverpod providers via ref.watch/ref.read)
  ├── Widgets (receive data as constructor params, emit callbacks)
  └── Providers (wrap domain use cases, expose AsyncValue/state)
          │
          ▼
Domain Layer (ZERO Flutter dependencies)
  ├── Entities: ToolkitExercise, ToolkitSession, JournalEntry, MoodTag
  ├── Repositories: IToolkitRepository, IJournalRepository (abstract)
  └── Use Cases: GetExercisesForModeUseCase, ToggleFavoriteUseCase,
                 RecordSessionUseCase, GetRecentExercisesUseCase
          │
          ▼
Data Layer
  ├── Isar Models: ToolkitExerciseModel, ToolkitSessionModel, JournalEntryModel
  ├── Repository Impls: ToolkitRepositoryImpl, JournalRepositoryImpl
  └── Datasources: ToolkitSeedService
```

**Key rule:** No screen imports Isar models directly. No domain entity imports Flutter packages. Providers import domain interfaces, not Isar models.

### 5.2 Provider Topology Redesign

**Current (broken) topology:**

```
toolkitRepositoryProvider → ToolkitRepository (old, has per-type session CRUD)
toolkitExerciseRepoProvider → ToolkitRepositoryImpl (new, has catalogue + sessions)
breathingExerciseProvider → uses toolkitRepositoryProvider (old)
toolkitSessionProvider → uses toolkitExerciseRepoProvider (new)
```

**Target (clean) topology:**

```
toolkitRepositoryProvider → ToolkitRepositoryImpl (SINGLE source of truth)
  ├── toolkitExercisesProvider(mode) → FutureProvider.family — exercise catalogue
  ├── favoriteExercisesProvider(mode) → StreamProvider.family — live favorites
  ├── recentExercisesProvider → FutureProvider — last 3 used
  └── toolkitSessionProvider → NotifierProvider — active session

journalRepositoryProvider → JournalRepositoryImpl
  ├── journalEntriesProvider(moodFilter) → FutureProvider.family
  └── journalNotifierProvider → AsyncNotifierProvider

breathingExerciseProvider(pattern) → StateNotifierProvider.family
  └── uses toolkitRepositoryProvider for session recording ONLY
      (visual animation is purely local state — no repository needed)
```

**Implication:** The old `ToolkitRepository` class (handling `BreathingSession`, `CbtSession`, etc.) will be kept temporarily for the `ToolkitHistoryScreen` but new features will NOT write to these collections. Future cleanup can migrate history screen to read from `ToolkitSessionModel`.

### 5.3 Repository Pattern Consolidation

**`IToolkitRepository` interface — retained as-is (all methods already defined)**

The interface in `i_toolkit_repository.dart` is correct. No changes needed.

**`ToolkitRepositoryImpl` — fix `watchFavorites`, audit all methods**

1. Fix `watchFavorites` to use proper Isar watch query (Bug 4 fix).
2. Audit `startSession` — confirm it sets `exerciseName` and `exerciseCategory` from the exercise record, not hardcoded defaults.
3. Confirm `endSession` handles the case where `sessionId` cannot be parsed as `int`.

**`JournalRepositoryImpl` — fix `getEntries` dynamic query (Bug 5 fix)**

Full fix described in Section 4.6.

### 5.4 Domain Entity Completion

All domain entities exist and are correct. The `MoodTag` enum is defined in `journal_entry.dart`. No new entities are required.

One addition needed: a `FeedbackRating` enum in the domain layer to formalize the `0/1/2` integer stored in `ToolkitSessionModel.feedbackRating`:

**File: `lib/features/craving_toolkit/domain/entities/feedback_rating.dart`** *(new)*

```dart
/// Rating given after completing or abandoning a toolkit exercise.
enum FeedbackRating {
  helped,     // 0
  somewhat,   // 1
  notReally;  // 2

  int get value => index;

  static FeedbackRating fromValue(int value) =>
      FeedbackRating.values[value.clamp(0, 2)];

  String get label => switch (this) {
    helped    => 'Yes, it helped',
    somewhat  => 'Somewhat',
    notReally => 'Not really',
  };

  String get emoji => switch (this) {
    helped    => '😊',
    somewhat  => '🤷',
    notReally => '😕',
  };
}
```

---

## 6. CravingToolkitScreen — Full Redesign

### 6.1 Screen Entry & Navigation

The `CravingToolkitScreen` is reached via:
1. Dashboard FAB "I need help now" — passes no arguments; screen reads mode from profile provider internally.
2. Log screen "Help" button — same as above.
3. `LapseRecoveryScreen` Step 2 — same as above.
4. Direct navigation from `PanicModeScreen` step (goes to specific exercise screen, skipping toolkit home).

**Mode injection pattern:**

```dart
class CravingToolkitScreen extends ConsumerWidget {
  const CravingToolkitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read user profile to get current GoalType
    final profileAsync = ref.watch(userProfileProvider);

    return profileAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => const Scaffold(body: Center(child: Text('Unable to load toolkit'))),
      data: (profile) {
        final mode = profile?.goalType.name ?? 'quitSmoking';
        return _ToolkitContent(mode: mode);
      },
    );
  }
}
```

### 6.2 Favorites Section

**Provider:** `favoriteExercisesProvider(mode)` — `StreamProvider.family<List<ToolkitExercise>, String>`

**Rendering:** Horizontal scrolling row of `ExerciseChip` widgets. Hidden when no favorites exist.

```dart
Widget _buildFavoritesSection(String mode, WidgetRef ref) {
  final favoritesAsync = ref.watch(favoriteExercisesProvider(mode));

  return favoritesAsync.when(
    loading: () => const SizedBox.shrink(),
    error: (_, __) => const SizedBox.shrink(),
    data: (favorites) {
      if (favorites.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Your Favorites',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 72,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: favorites.length,
              itemBuilder: (context, i) => ExerciseChip(
                exercise: favorites[i],
                onTap: () => _navigateToExercise(context, favorites[i], mode, ref),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
    },
  );
}
```

### 6.3 Recents Section

**Provider:** `recentExercisesProvider` — `FutureProvider.autoDispose<List<ToolkitExercise>>`

**Rendering:** Up to 3 compact `ExerciseCard` widgets with a "Repeat" button that skips the detail screen.

```dart
Widget _buildRecentsSection(String mode, WidgetRef ref) {
  final recentsAsync = ref.watch(recentExercisesProvider);

  return recentsAsync.when(
    loading: () => const SizedBox.shrink(),
    error: (_, __) => const SizedBox.shrink(),
    data: (recents) {
      if (recents.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Recently Used',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 12),
          ...recents.map((exercise) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ExerciseCard(
              exercise: exercise,
              onTap: () => _navigateToDetail(context, exercise, mode, ref),
              onFavoriteToggle: () =>
                  ref.read(toolkitSessionProvider.notifier).toggleFavorite(exercise.id),
              showRepeatButton: true,
              onRepeat: () => _navigateToExercise(context, exercise, mode, ref),
            ),
          )),
          const SizedBox(height: 24),
        ],
      );
    },
  );
}
```

### 6.4 All Exercises Section (Mode-Filtered)

**Provider:** `toolkitExercisesProvider(mode)` — `FutureProvider.autoDispose.family<List<ToolkitExercise>, String>`

**Rendering:** `ListView.builder` (never `Column` with `.map()` — SRS Pitfall 11) of `ExerciseCard` widgets grouped by category.

```dart
Widget _buildAllExercisesSection(String mode, WidgetRef ref) {
  final exercisesAsync = ref.watch(toolkitExercisesProvider(mode));

  return exercisesAsync.when(
    loading: () => const Center(child: CircularProgressIndicator()),
    error: (e, _) => Center(child: Text('Error loading exercises: $e')),
    data: (exercises) {
      if (exercises.isEmpty) {
        return const Center(child: Text('No exercises available'));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ExerciseCard(
              exercise: exercise,
              onTap: () => _navigateToDetail(context, exercise, mode, ref),
              onFavoriteToggle: () =>
                  ref.read(toolkitSessionProvider.notifier).toggleFavorite(exercise.id),
            ),
          );
        },
      );
    },
  );
}
```

### 6.5 Exercise Detail Screen

A new **`ExerciseDetailScreen`** sits between `ExerciseCard` tap and the actual exercise screen. It shows:
- Category icon (large)
- Exercise name
- Duration chip
- Short description
- Mode-specific note (if applicable, shown as a highlighted callout)
- "Start" `ElevatedButton`

```dart
class ExerciseDetailScreen extends StatelessWidget {
  final ToolkitExercise exercise;
  final String mode;

  const ExerciseDetailScreen({
    super.key,
    required this.exercise,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
        actions: [
          // Favorite toggle in AppBar
          Consumer(
            builder: (context, ref, _) => IconButton(
              icon: Icon(
                exercise.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: exercise.isFavorite ? AppTheme.errorColor : null,
              ),
              onPressed: () =>
                  ref.read(toolkitSessionProvider.notifier).toggleFavorite(exercise.id),
              tooltip: exercise.isFavorite
                  ? 'Remove from favorites'
                  : 'Add to favorites',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                exercise.category.emoji,
                style: const TextStyle(fontSize: 80),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: _DurationChip(duration: exercise.durationLabel),
            ),
            const SizedBox(height: 24),
            Text(
              exercise.shortDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (exercise.modeSpecificNote != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryColor.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  exercise.modeSpecificNote!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _navigateToExercise(context, exercise, mode),
              child: const Text('Start', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToExercise(
    BuildContext context,
    ToolkitExercise exercise,
    String mode,
  ) {
    Navigator.pushReplacement(  // Replace detail screen with exercise screen
      context,
      MaterialPageRoute(
        builder: (_) => ExerciseScreenRouter(exercise: exercise, mode: mode),
      ),
    );
  }
}
```

### 6.6 Widget Breakdown and Accessibility

**ExerciseCard** (already exists — minor additions needed):
- Add `showRepeatButton` flag with `onRepeat` callback.
- Semantic label: `"${exercise.name}, ${exercise.durationLabel}, ${isFavorite ? 'favorited' : 'tap to favorite'}"`.

**ExerciseChip** (already exists — no changes needed).

**`_navigateToExercise()` — Navigation Router:**

A `ExerciseScreenRouter` widget or static function maps `ExerciseCategory` to the correct screen:

```dart
/// Routes a ToolkitExercise to its implementation screen.
///
/// Called both from ExerciseDetailScreen and from the "Repeat" button
/// on recent exercise cards (which skips the detail screen).
Widget _exerciseScreenFor(ToolkitExercise exercise, String mode) {
  switch (exercise.category) {
    case ExerciseCategory.breathing:
      // Map exercise name to BreathingPattern
      final pattern = _breathingPatternFrom(exercise.id);
      return BreathingExerciseScreen(pattern: pattern);

    case ExerciseCategory.grounding:
      final groundingExercise = _groundingExerciseFrom(exercise.id);
      return GroundingExerciseScreen(exercise: groundingExercise);

    case ExerciseCategory.urgeSurfing:
      return UrgeSurfingScreen(mode: mode);

    case ExerciseCategory.delayAndDistract:
      return DelayDistractScreen(mode: mode);

    case ExerciseCategory.cognitiveReframing:
      return CognitiveReframingScreen(mode: mode);

    case ExerciseCategory.journaling:
      return JournalEntryScreen(
        sourceExerciseId: exercise.id,
        sourceExerciseName: exercise.name,
      );

    case ExerciseCategory.relapseRecoveryPlanning:
      return RelapseRecoveryPlanScreen(mode: mode);
  }
}

BreathingPattern _breathingPatternFrom(String exerciseId) {
  return switch (exerciseId) {
    'breathing-box'        => BreathingPattern.box,
    'breathing-relaxing'   => BreathingPattern.relaxing,
    'breathing-energizing' => BreathingPattern.energizing,
    'breathing-calm'       => BreathingPattern.calm,
    _                      => BreathingPattern.box,
  };
}

GroundingExercise _groundingExerciseFrom(String exerciseId) {
  return switch (exerciseId) {
    'grounding-fivesenses' => GroundingExercise.fiveSenses,
    'grounding-bodyscan'   => GroundingExercise.bodyAwareness,
    'grounding-objectfocus'=> GroundingExercise.objectFocus,
    'grounding-coldwater'  => GroundingExercise.coldWater,
    _                      => GroundingExercise.fiveSenses,
  };
}
```

---

## 7. Breathing Exercise Enhancement

### 7.1 Phase Timing Architecture Fix

The fix is described in Section 4.1. The corrected `BreathingPattern` enum values will cascade correctly through all dependent logic:
- `totalCycleSeconds` (used by `_alignDuration`) — correct.
- `_startTimer()` → `_getNextPhase()` — driven by current phase string; independent of enum values.
- `BreathingAnimation` — receives `phase` string and `pattern` — correct after enum fix.
- Duration chip and setup screen labels — correct after enum fix.

**Additional fix — `_getNextPhase()` must handle `holdSeconds = 0` and `pauseSeconds = 0`:**

When a pattern has `holdSeconds = 0` (calm, energizing), the "hold" phase must be skipped entirely:

```dart
Map<String, dynamic> _getNextPhase() {
  String nextPhase;
  int seconds;
  int cycle = state.currentCycle;

  switch (state.currentPhase) {
    case 'inhale':
      // Skip hold if holdSeconds is 0
      if (state.pattern.holdSeconds > 0) {
        nextPhase = 'hold';
        seconds = state.pattern.holdSeconds;
      } else {
        nextPhase = 'exhale';
        seconds = state.pattern.exhaleSeconds;
      }

    case 'hold':
      nextPhase = 'exhale';
      seconds = state.pattern.exhaleSeconds;

    case 'exhale':
      // Skip pause if pauseSeconds is 0
      if (state.pattern.pauseSeconds > 0) {
        nextPhase = 'pause';
        seconds = state.pattern.pauseSeconds;
      } else {
        nextPhase = 'inhale';
        seconds = state.pattern.inhaleSeconds;
        cycle++;
      }

    case 'pause':
      nextPhase = 'inhale';
      seconds = state.pattern.inhaleSeconds;
      cycle++;

    default:
      nextPhase = 'inhale';
      seconds = state.pattern.inhaleSeconds;
  }

  return {'phase': nextPhase, 'seconds': seconds, 'cycle': cycle};
}
```

**Phase initialization — also needs the same skip logic:**

The initial phase is always 'inhale', which is always non-zero — no change needed there. But the `phaseSecondsRemaining` in the initial `BreathingExerciseState` must use `pattern.inhaleSeconds`:

```dart
// Confirmed already correct in BreathingExerciseNotifier constructor:
super(BreathingExerciseState(
  pattern: pattern,
  targetDuration: 60,
  phaseSecondsRemaining: pattern.inhaleSeconds,  // ✅
));
```

### 7.2 BreathingCircle Widget Redesign

The existing `BreathingAnimation` widget in `breathing_animation.dart` uses `SingleTickerProviderStateMixin`. It is visually adequate for the MVP. The main issues are:

1. `_setupAnimation()` is called from `didUpdateWidget` which fires on every parent rebuild — this can reset a mid-phase animation unnecessarily if the parent rebuilds for unrelated reasons.

2. The `BreathingAnimation` widget receives the `phase` String and creates animations based on it. If the parent rebuilds with the same phase, `_setupAnimation()` re-runs unnecessarily.

**Fix — Add phase equality check in `didUpdateWidget`:**

```dart
@override
void didUpdateWidget(BreathingAnimation oldWidget) {
  super.didUpdateWidget(oldWidget);
  // Only reset animation if the phase actually changed
  if (oldWidget.phase != widget.phase) {
    _setupAnimation();
  }
}
```

This is a minor performance fix — the visual behavior is already correct.

**The `_controller.stop()` addition** (from Bug 4.8) should also be applied here.

### 7.3 Breathing Phase State Machine

The current `BreathingExerciseState` includes `currentPhase` as a `String`. This works but is fragile. Consider a typed enum approach for improved correctness — but given the existing working implementation, this is a future enhancement. The String-based approach is acceptable for this enhancement cycle.

The complete phase state machine for the enhanced version:

```
START
  └─► 'inhale' (inhaleSeconds)
          └─► [if holdSeconds > 0] 'hold' (holdSeconds)
              └─► 'exhale' (exhaleSeconds)
                  └─► [if pauseSeconds > 0] 'pause' (pauseSeconds) → 'inhale' (cycle++)
                      [else] → 'inhale' (cycle++)
          └─► [if holdSeconds == 0] 'exhale' (exhaleSeconds)
                  └─► [if pauseSeconds > 0] 'pause' (pauseSeconds) → 'inhale' (cycle++)
                      [else] → 'inhale' (cycle++)
COMPLETE when elapsed >= targetDuration
```

### 7.4 AnimationController Lifecycle Safety

The `BreathingExerciseScreen` uses `SingleTickerProviderStateMixin` on the Riverpod `ConsumerStatefulWidget`. The `AnimationController` lives in the `BreathingAnimation` widget (child), which also uses `SingleTickerProviderStateMixin`. This is correct — each widget manages its own controller.

**Safety checklist:**
- ✅ `controller.dispose()` called in widget `dispose()` — confirmed in `breathing_animation.dart`.
- ✅ `state.isRunning` check before `_startTimer()` in notifier — present in existing code.
- ⚠️ `if (mounted)` check before `setState` in `_startTimer` — confirm this is present in the implementation and add if missing.
- ⚠️ `mounted` guard in `BreathingExerciseNotifier._startTimer()` — the notifier is a `StateNotifier`, not a widget, so it uses the Riverpod lifecycle. After the provider is disposed, `state = ...` calls will throw. Fix: Use `if (mounted)` — Riverpod `StateNotifier` exposes a `mounted` getter.

```dart
void _startTimer() {
  Future.delayed(const Duration(seconds: 1), () async {
    if (!mounted) return;  // ✅ Guard against disposed notifier
    if (!state.isRunning) return;
    // ... rest of timer logic
  });
}
```

### 7.5 BreathingExerciseNotifier Refactor

The `BreathingExerciseNotifier` currently writes to `BreathingSession` (old repository). After the architecture consolidation (Section 5.2), it should write to `ToolkitSessionModel` via `ToolkitRepositoryImpl`.

**Migration path:**

1. Remove `BreathingSession` write in `BreathingExerciseNotifier.start()`.
2. Call `ToolkitSessionNotifier.startSession()` from the exercise screen's `initState` instead.
3. `BreathingExerciseNotifier` becomes a pure visual state machine — no Isar writes.
4. Session recording responsibility moves entirely to `ToolkitSessionNotifier`.

**Result:** `BreathingExerciseNotifier` only needs the `BreathingPattern` — it no longer needs a repository reference.

```dart
// AFTER REFACTOR:
class BreathingExerciseNotifier extends StateNotifier<BreathingExerciseState> {
  // No repository — pure visual state
  BreathingExerciseNotifier(BreathingPattern pattern)
      : super(BreathingExerciseState(
          pattern: pattern,
          targetDuration: 60,
          phaseSecondsRemaining: pattern.inhaleSeconds,
        ));

  // All methods remain the same EXCEPT:
  // - start() no longer creates a BreathingSession record
  // - complete() no longer writes to Isar
}

// Provider — no longer needs repository:
final breathingExerciseProvider = StateNotifierProvider.autoDispose
    .family<BreathingExerciseNotifier, BreathingExerciseState, BreathingPattern>(
  (ref, pattern) => BreathingExerciseNotifier(pattern),
);
```

**In `BreathingExerciseScreen.initState()`:**

```dart
@override
void initState() {
  super.initState();
  // Start session tracking via unified session notifier
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
    if (userId.isNotEmpty) {
      ref.read(toolkitSessionProvider.notifier).startSession(
        exerciseId: _exerciseIdForPattern(widget.pattern),
        exerciseName: widget.pattern.displayName,
        exerciseCategory: 'breathing',
        userId: userId,
        mode: ref.read(currentModeProvider) ?? 'quitSmoking',
      );
    }
  });
}

String _exerciseIdForPattern(BreathingPattern pattern) => switch (pattern) {
  BreathingPattern.box        => 'breathing-box',
  BreathingPattern.relaxing   => 'breathing-relaxing',
  BreathingPattern.energizing => 'breathing-energizing',
  BreathingPattern.calm       => 'breathing-calm',
  BreathingPattern.custom     => 'breathing-box',
};
```

---

## 8. Grounding Exercise Enhancement

### 8.1 Stepped PageView Flow for All 5 Exercise Types

The grounding exercise currently uses separate widget files per type (`FiveSensesExercise`, `BodyScanExercise`, etc.). These work and should be retained. The `GroundingExerciseScreen` correctly routes to each via a switch on `widget.exercise`.

**No restructuring needed for the exercise content widgets.** The only bug is in the completion flow (Section 8.2).

**Improvement needed:** The `ColdWaterExercise` and `ObjectFocusExercise` already use `SingleChildScrollView` correctly. Confirm all 5 exercise widgets wrap their content in `SingleChildScrollView` to avoid overflow on small screens (SRS Pitfall 1).

**Verify the following in each grounding widget:**
- `FiveSensesExercise` — wraps intro in scrollable column ✅
- `BodyScanExercise` — intro uses scrollable; exercise view uses `Padding` with non-scrollable `Column` — **add `SingleChildScrollView` wrapper to `_buildInstructionCard` section**
- `ObjectFocusExercise` — uses `Padding` with `Column` in intro — **add `SingleChildScrollView`**
- `CountingExercise` — uses `SingleChildScrollView` ✅
- `ColdWaterExercise` — uses `SingleChildScrollView` ✅

### 8.2 Completion Flow Fix

As described in Section 4.2, the fix requires one of two approaches:

**Approach A (Recommended) — In-screen completion view, no pop from feedback:**

Remove `Navigator.pop(context)` from `_showEffectivenessRating()`. The `ref.listen` pattern triggers when `isCompleted` becomes true, which renders `_buildCompletionScreen()` in place. The user manually taps "Return to Toolkit" to navigate away.

```dart
// In GroundingExerciseScreen.build():
ref.listen<GroundingSessionState>(
  groundingSessionProvider(widget.exercise),
  (prev, next) {
    // When completed, show a congratulatory snackbar
    // The completion screen renders automatically via the state-driven body
    if ((prev?.isCompleted ?? false) == false && next.isCompleted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Great job staying grounded!'),
          backgroundColor: AppTheme.successColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  },
);

// Body now shows completion screen when state.isCompleted = true:
body: state.isCompleted
    ? _buildCompletionScreen(state)  // Shown when isCompleted = true
    : !_hasStarted
        ? _buildIntroScreen()
        : _buildExerciseContent(state),
```

**Updated `_showEffectivenessRating()`:**

```dart
void _showEffectivenessRating() async {
  final rating = await showDialog<int>(
    context: context,
    barrierDismissible: false,
    builder: (context) => const EffectivenessRatingDialog(),
  );

  if (!mounted) return;

  final effectivenessRating = rating ?? 3;
  await ref
      .read(groundingSessionProvider(widget.exercise).notifier)
      .complete(effectivenessRating);
  // ❌ REMOVE: Navigator.pop(context)  ← was here, now removed
  // The ref.listen above handles the snackbar
  // The body renders _buildCompletionScreen automatically
}
```

**`_buildCompletionScreen()` must include a navigation button:**

```dart
ElevatedButton(
  onPressed: () => Navigator.pop(context),  // User decides when to leave
  child: const Text('Return to Toolkit'),
),
```

### 8.3 Optional Journal Save Integration

At the end of any grounding exercise completion screen, show a "Save to Journal" CTA:

```dart
// In _buildCompletionScreen():
TextButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => JournalEntryScreen(
          sourceExerciseId: 'grounding-${widget.exercise.name.toLowerCase()}',
          sourceExerciseName: widget.exercise.displayName,
        ),
      ),
    );
  },
  icon: const Icon(Icons.book_outlined),
  label: const Text('Save to Journal'),
),
```

---

## 9. CBT Technique Enhancement

### 9.1 Completion Flow Fix

As described in Section 4.3. The fix mirrors the grounding approach: remove `Navigator.pop(context)` from the rating callback, use `ref.listen` to detect `state.isCompleted`, and render `_buildCompletionScreen()` in place.

**In `CbtTechniqueScreen.build()`:**

```dart
ref.listen<CbtSessionState>(
  cbtSessionProvider(widget.technique),
  (prev, next) {
    if ((prev?.isCompleted ?? false) == false && next.isCompleted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Exercise complete!'),
          backgroundColor: AppTheme.successColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  },
);
```

**Updated `_showEffectivenessRating()`:**

```dart
void _showEffectivenessRating() async {
  final result = await showDialog<Map<String, dynamic>>(
    context: context,
    barrierDismissible: false,
    builder: (context) => const CbtEffectivenessDialog(),
  );
  if (!mounted) return;

  final wasHelpful = result != null ? result['wasHelpful'] as bool : true;
  final rating = result != null ? result['rating'] as int : 3;

  await ref
      .read(cbtSessionProvider(widget.technique).notifier)
      .complete(wasHelpful, rating);
  // ❌ REMOVE: ScaffoldMessenger snackbar + Navigator.pop
}
```

### 9.2 Interactive Prompt Screens

The CBT technique content is already implemented in `ThoughtChallengeSteps`, `UrgeSurfingSteps`, `ConsequenceAnalysisSteps`, `DelayTacticSteps`, and `AlternativeBehaviorSteps` widgets. The stepped `PageView` flow is working.

**Issue:** `ConsequenceAnalysisSteps`, `DelayTacticSteps`, and `AlternativeBehaviorSteps` all extend `ThoughtChallengeSteps` — they reuse the exact same steps, which shows thought-challenge prompts regardless of which CBT technique is selected. This is a content bug.

**Fix:** Each CBT technique should have its own dedicated steps widget (or at minimum, technique-specific copy injected via constructor). For the current enhancement cycle, the minimum viable fix is:

1. `ConsequenceAnalysisSteps` — override the step titles and prompts to show consequence analysis ("What happens if you give in vs. resist?") instead of thought challenge.
2. `DelayTacticSteps` — show a countdown timer + activity suggestion.
3. `AlternativeBehaviorSteps` — show a list of mode-specific alternative behaviors.

Full implementation of each is a Phase 3 item (see Section 20).

### 9.3 Mode-Specific Wording

The `UrgeSurfingSteps` widget already has mode-specific wording via its timer prompts. For other CBT techniques, mode-specific wording means:

- **Smoking mode cognitive reframing:** "I am a smoke-free person" identity reframe.
- **Reduction mode cognitive reframing:** Self-control and values reframe.

Pass `mode` as a constructor parameter to `CbtTechniqueContent` and downstream widgets. The `CbtTechniqueScreen` already accepts `mode` implicitly through the user profile — inject it.

---

## 10. New Exercise Screens

### 10.1 UrgeSurfingScreen — Full Implementation

**Status:** Screen exists at `lib/features/craving_toolkit/presentation/screens/urge_surfing_screen.dart`.

**Wiring needed:**
1. Wire to `CravingToolkitScreen` navigation via `ExerciseScreenRouter`.
2. Add `ToolkitSessionNotifier` calls in `initState` / completion.
3. Wire `PostExerciseFeedbackSheet` on completion — partially done via `_showFeedbackSheet()`.

**Session tracking integration:**

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
    final exerciseId = _isSmoking ? 'urge-surfing-smoking' : 'urge-surfing-reduction';
    if (userId.isNotEmpty) {
      ref.read(toolkitSessionProvider.notifier).startSession(
        exerciseId: exerciseId,
        exerciseName: 'Urge Surfing',
        exerciseCategory: 'urgeSurfing',
        userId: userId,
        mode: widget.mode,
      );
    }
  });
}
```

**`PostExerciseFeedbackSheet` wiring:**

The existing `_showFeedbackSheet()` shows the feedback sheet but does not record the rating to `ToolkitSessionModel`. Connect `onRatingSelected` to `ToolkitSessionNotifier.recordFeedback()`:

```dart
void _showFeedbackSheet() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: PostExerciseFeedbackSheet(
        exerciseName: 'Urge Surfing',
        wasCompleted: _isCompleted,
        onRatingSelected: (rating) {
          Navigator.pop(context);
          // Record feedback
          ref.read(toolkitSessionProvider.notifier).recordFeedback(rating);
          // End session
          ref.read(toolkitSessionProvider.notifier).endSession(completed: _isCompleted);
        },
      ),
    ),
  );
}
```

### 10.2 DelayDistractScreen — Full Implementation

**Status:** Screen exists at `lib/features/craving_toolkit/presentation/screens/delay_distract_screen.dart`.

**Wiring needed:**
1. Wire to catalogue navigation (same as UrgeSurfing).
2. Add session tracking in `initState`.
3. Add `PostExerciseFeedbackSheet` on completion.

**No structural changes to the screen logic required.**

**Session tracking:**

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
    final exerciseId = _isSmoking ? 'delay-distract-smoking' : 'delay-distract-reduction';
    if (userId.isNotEmpty) {
      ref.read(toolkitSessionProvider.notifier).startSession(
        exerciseId: exerciseId,
        exerciseName: 'Delay & Distract',
        exerciseCategory: 'delayAndDistract',
        userId: userId,
        mode: widget.mode,
      );
    }
  });
}
```

**Convert `StatefulWidget` to `ConsumerStatefulWidget`** to access `ref`.

### 10.3 CognitiveReframingScreen — Full Implementation

**Status:** Screen exists at `lib/features/craving_toolkit/presentation/screens/cognitive_reframing_screen.dart`.

**Wiring needed:**
1. Wire to catalogue navigation.
2. Add session tracking.
3. Add `PostExerciseFeedbackSheet` on the final step.
4. Add "Save to Journal" CTA on the balanced perspective step.

**Mode-specific content:** The screen currently has mode-specific copy gated on `_isSmoking`. This is already implemented — confirm the routing passes the correct `mode` value.

**Convert to `ConsumerStatefulWidget`** to access `ref` for session tracking.

### 10.4 RelapseRecoveryPlanScreen — Toolkit Exercise

**Status:** Screen exists at `lib/features/craving_toolkit/presentation/screens/relapse_recovery_plan_screen.dart`.

**Wiring needed:**
1. Wire to catalogue navigation.
2. Add session tracking.
3. On save, offer to write journal entry with the recovery plan content.

**Session tracking:**

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
    if (userId.isNotEmpty) {
      ref.read(toolkitSessionProvider.notifier).startSession(
        exerciseId: 'relapse-recovery-plan',
        exerciseName: 'Recovery Plan Exercise',
        exerciseCategory: 'relapseRecoveryPlanning',
        userId: userId,
        mode: widget.mode,
      );
    }
  });
}
```

**Journal integration on save:**

```dart
ElevatedButton(
  onPressed: () async {
    // End session as completed
    ref.read(toolkitSessionProvider.notifier).endSession(completed: true);

    // Offer journal save
    final content = _buildPlanContent();
    if (content.isNotEmpty) {
      final saveToJournal = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Save to Journal?'),
          content: const Text(
            'Would you like to save this recovery plan to your journal?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No thanks'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Save'),
            ),
          ],
        ),
      );

      if (saveToJournal == true && mounted) {
        await ref.read(journalNotifierProvider.notifier).createEntry(
          content: content,
          sourceExerciseId: 'relapse-recovery-plan',
          sourceExerciseName: 'Recovery Plan Exercise',
        );
      }
    }

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your recovery plan is ready.'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    }
  },
  child: const Text('Save My Plan', style: TextStyle(fontSize: 16)),
),
```

---

## 11. Journaling Feature — Full Implementation

### 11.1 JournalEntry Domain Entity

**File:** `lib/features/craving_toolkit/domain/entities/journal_entry.dart` — **No changes needed.**

The `JournalEntry` class and `MoodTag` enum are complete and correct.

### 11.2 JournalEntryModel Isar Collection

**File:** `lib/features/craving_toolkit/data/models/journal_entry_model.dart` — **No changes needed.**

The schema is complete and registered in `IsarService`.

### 11.3 JournalRepositoryImpl Fix

**File:** `lib/features/craving_toolkit/data/repositories/journal_repository_impl.dart`

**Fix:** Replace dynamic query pattern with type-safe conditional query building. Full fix specification in Section 4.6.

**Additional fix — `updateEntry` should also set `updatedAt` using the correct format:**

```dart
@override
Future<void> updateEntry({
  required String entryId,
  required String content,
  String? moodTag,
}) async {
  final isar = await _db;
  await isar.writeTxn(() async {
    final model = await isar.journalEntryModels
        .filter()
        .entryIdEqualTo(entryId)
        .findFirst();
    if (model != null) {
      model.content = content;
      model.moodTag = moodTag;
      model.updatedAt = DateTime.now().toUtc();  // ✅ Already correct
      await isar.journalEntryModels.put(model);
    }
  });
}
```

### 11.4 JournalEntryScreen

**File:** `lib/features/craving_toolkit/presentation/screens/journal_entry_screen.dart` — **Mostly complete.**

**Issues to fix:**
1. `_hasSaved` flag prevents auto-save from firing again after the first save — this is intentional for the auto-save timer, but the field should be reset to `false` when content changes significantly. Current implementation is acceptable for MVP.
2. The screen does not show an edit flow for existing entries. A separate edit screen or passing an existing `JournalEntry` as a constructor parameter is needed for `JournalListScreen` tap-to-edit.

**Add edit support:**

```dart
class JournalEntryScreen extends ConsumerStatefulWidget {
  final String? sourceExerciseId;
  final String? sourceExerciseName;
  final JournalEntry? existingEntry;  // ADD THIS — for edit mode

  const JournalEntryScreen({
    super.key,
    this.sourceExerciseId,
    this.sourceExerciseName,
    this.existingEntry,  // ADD THIS
  });

  @override
  ConsumerState<JournalEntryScreen> createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends ConsumerState<JournalEntryScreen> {
  final _contentController = TextEditingController();
  String? _selectedMood;
  Timer? _autoSaveTimer;
  bool _hasSaved = false;
  bool get _isEditMode => widget.existingEntry != null;

  @override
  void initState() {
    super.initState();
    // Pre-populate in edit mode
    if (_isEditMode) {
      _contentController.text = widget.existingEntry!.content;
      _selectedMood = widget.existingEntry!.moodTag;
      _hasSaved = false;
    }
    _startAutoSave();
  }

  Future<void> _save() async {
    if (_contentController.text.trim().isEmpty) return;
    try {
      if (_isEditMode) {
        // Update existing entry
        await ref.read(journalNotifierProvider.notifier).updateEntry(
          widget.existingEntry!.id,
          _contentController.text.trim(),
          _selectedMood,
        );
      } else {
        // Create new entry
        await ref.read(journalNotifierProvider.notifier).createEntry(
          content: _contentController.text.trim(),
          moodTag: _selectedMood,
          sourceExerciseId: widget.sourceExerciseId,
          sourceExerciseName: widget.sourceExerciseName,
        );
      }
      _hasSaved = true;
    } catch (_) {}
  }
  // ... rest unchanged
}
```

### 11.5 JournalListScreen

**File:** `lib/features/craving_toolkit/presentation/screens/journal_list_screen.dart` — **Minor fixes needed.**

**Fix: `onTap` navigation passes wrong sourceExerciseId:**

```dart
// CURRENT (wrong — passes entry.id as sourceExerciseId):
onTap: () {
  Navigator.push(context, MaterialPageRoute(
    builder: (_) => JournalEntryScreen(
      sourceExerciseId: entry.id,  // ❌ This is the entry's own ID, not the source exercise
    ),
  ));
},

// FIX:
onTap: () {
  Navigator.push(context, MaterialPageRoute(
    builder: (_) => JournalEntryScreen(
      existingEntry: entry,  // ✅ Pass full entry for edit mode
    ),
  ));
},
```

**Add mood filter UI:**

The provider accepts `moodFilter` but the screen always passes `null`. Add a `FilterChip` row at the top for mood filtering:

```dart
// In JournalListScreen.build():
// Add state for selected mood filter
// Provider: ref.watch(journalEntriesProvider(selectedMoodFilter))
// FilterChips for each MoodTag value
```

This is a `ConsumerStatefulWidget` change — add `_selectedMoodFilter` local state.

### 11.6 JournalProvider Architecture

**File:** `lib/features/craving_toolkit/presentation/providers/journal_provider.dart` — **No structural changes needed.**

The `journalEntriesProvider` and `journalNotifierProvider` are correctly defined. The `currentUserIdProvider` import needs to be verified — ensure it resolves to the same provider used by tracking and other features.

**Confirm import path:**

```dart
import '../../../tracking/presentation/providers/tracking_provider.dart';
// currentUserIdProvider must be defined here and re-exported or the import path is correct
```

---

## 12. Post-Exercise Feedback Loop

### 12.1 PostExerciseFeedbackSheet Widget

**File:** `lib/features/craving_toolkit/presentation/widgets/post_exercise_feedback_sheet.dart` — **Complete and correct.**

No changes needed to the widget itself. It accepts `exerciseName`, `wasCompleted`, and `onRatingSelected` callback.

### 12.2 Feedback Data Storage

The `onRatingSelected` callback receives a rating `int` (0=helped, 1=somewhat, 2=notReally). This must be persisted via `ToolkitSessionNotifier.recordFeedback(rating)`.

**Wiring pattern for every exercise screen:**

```dart
// In PostExerciseFeedbackSheet onRatingSelected callback:
onRatingSelected: (rating) {
  Navigator.pop(context);  // Dismiss the sheet
  // Record feedback
  ref.read(toolkitSessionProvider.notifier).recordFeedback(rating);
  // End session (if not already ended)
  ref.read(toolkitSessionProvider.notifier).endSession(completed: _isCompleted);
},
```

**`ToolkitSessionNotifier.recordFeedback` — existing implementation is correct:**

```dart
Future<void> recordFeedback(int rating) async {
  final session = state.lastCompletedSession;
  if (session == null) return;
  await ref.read(toolkitExerciseRepoProvider).recordFeedback(
    sessionId: session.id,
    rating: rating,
  );
}
```

### 12.3 Conditional Follow-Up Logic

Per the IMPLEMENTATION_NOTES.md, if `wasCompleted == false` AND user says "Not really" → offer "Try a different exercise?" CTA.

**Add this to the `PostExerciseFeedbackSheet.build()` or handle in the `onRatingSelected` callback:**

```dart
onRatingSelected: (rating) {
  Navigator.pop(context);
  ref.read(toolkitSessionProvider.notifier).recordFeedback(rating);
  ref.read(toolkitSessionProvider.notifier).endSession(completed: _isCompleted);

  // Conditional follow-up: if abandoned AND rated "not really", suggest alternatives
  if (!_isCompleted && rating == 2) {  // 2 = notReally
    Future.microtask(() {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Try a different exercise?'),
            action: SnackBarAction(
              label: 'Yes',
              onPressed: () {
                Navigator.pop(context);  // Pop exercise screen
                // CravingToolkitScreen is now at the top of the stack
              },
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    });
  }
},
```

---

## 13. ToolkitSession Usage Tracking

### 13.1 ToolkitSessionModel Schema Review

**File:** `lib/features/craving_toolkit/data/models/toolkit_session_model.dart` — **Schema correct.**

`ToolkitSessionModel` captures: `userId`, `exerciseId`, `exerciseName`, `exerciseCategory`, `startedAt`, `completedAt`, `feedbackRating`, `mode`, `linkedJournalEntryId`. All fields are present.

**One addition needed:** The `feedbackRating` field stores an `int?` (0/1/2). After adding the `FeedbackRating` enum (Section 5.4), the repository should convert between the enum and the int. No schema change required — just repository-layer conversion.

### 13.2 Session Start and End Wiring

**Pattern for ALL exercise screens:**

Every exercise screen must call `ToolkitSessionNotifier.startSession()` in `initState` and `endSession()` when the exercise completes or is abandoned (via `PopScope` / back navigation).

**Verified wiring locations:**

| Screen | `startSession` | `endSession` | Notes |
|--------|---------------|--------------|-------|
| `BreathingExerciseScreen` | `initState` | After `notifier.complete()` | After refactor (Section 7.5) |
| `GroundingExerciseScreen` | `initState` (after `_hasStarted = true`) | In `_showEffectivenessRating()` | After completion fix |
| `CbtTechniqueScreen` | `initState` (after `_hasStarted = true`) | In `_showEffectivenessRating()` | After completion fix |
| `UrgeSurfingScreen` | `initState` | In `_showFeedbackSheet` → `onRatingSelected` | After wiring |
| `DelayDistractScreen` | `initState` | On completion | After conversion to `ConsumerStatefulWidget` |
| `CognitiveReframingScreen` | `initState` | On final step | After conversion |
| `RelapseRecoveryPlanScreen` | `initState` | On save | After conversion |
| `JournalEntryScreen` | `initState` | On save | Journal is its own session type |

**`PopScope` → abandon session wiring:**

For screens where the user can exit mid-exercise, the `PopScope.onPopInvokedWithResult` should call `endSession(completed: false)` before allowing pop:

```dart
PopScope(
  canPop: false,
  onPopInvokedWithResult: (didPop, result) async {
    if (!didPop) {
      final confirm = await _showExitConfirmation();
      if (confirm == true && mounted) {
        // Record as abandoned session
        ref.read(toolkitSessionProvider.notifier).endSession(completed: false);
        Navigator.pop(context);
      }
    }
  },
  // ...
)
```

### 13.3 Weekly Summary Integration

`ToolkitSessionModel` records feed the weekly review screen and `ToolkitHistoryScreen`. The `StatisticsCalculator` (in the tracking feature) queries sessions for the past 7 days.

**Additions to `ToolkitRepositoryImpl`:**

Add a method to query sessions within a date range:

```dart
/// Returns sessions for [userId] within the last [days] days.
Future<List<ToolkitSession>> getRecentSessions({
  required String userId,
  int days = 7,
}) async {
  final isar = await _db;
  final since = DateTime.now().toUtc().subtract(Duration(days: days));
  final models = await isar.toolkitSessionModels
      .filter()
      .userIdEqualTo(userId)
      .startedAtGreaterThan(since)
      .sortByStartedAtDesc()
      .findAll();
  return models.map(_sessionToEntity).toList();
}

/// Returns aggregated statistics for the weekly summary.
Future<Map<String, dynamic>> getWeeklySummary({required String userId}) async {
  final sessions = await getRecentSessions(userId: userId, days: 7);
  
  final completedSessions = sessions.where((s) => s.wasCompleted).toList();
  final exerciseNames = sessions.map((s) => s.exerciseName).toSet().toList();
  
  // Most used exercise (by count)
  final exerciseCounts = <String, int>{};
  for (final session in sessions) {
    exerciseCounts[session.exerciseName] =
        (exerciseCounts[session.exerciseName] ?? 0) + 1;
  }
  final mostUsed = exerciseCounts.entries
      .sorted((a, b) => b.value.compareTo(a.value))
      .firstOrNull?.key;

  return {
    'totalSessionsThisWeek': sessions.length,
    'completedSessionsThisWeek': completedSessions.length,
    'mostUsedExercise': mostUsed ?? 'None',
    'exercisesUsed': exerciseNames,
    'averageFeedbackRating': _calculateAverageFeedback(completedSessions),
  };
}
```

---

## 14. Mode-Specific Content Filtering

### 14.1 Exercise Catalogue — Mode Matrix

After the seed service fix (Section 4.7), the catalogue contains these mode-specific records:

| Exercise ID | Name | Mode | Notes |
|------------|------|------|-------|
| `breathing-box` | Box Breathing | Shared | |
| `breathing-relaxing` | 4-7-8 Relaxing Breath | Shared | |
| `breathing-energizing` | Energizing Breath | Shared | |
| `breathing-calm` | Calming Breath | Shared | |
| `grounding-fivesenses` | 5-4-3-2-1 Grounding | Shared | |
| `grounding-bodyscan` | Body Scan | Shared | |
| `grounding-objectfocus` | Object Focus | Shared | |
| `grounding-coldwater` | Cold Water Reset | Shared | |
| `urge-surfing-smoking` | Urge Surfing | `quitSmoking` | Nicotine wording |
| `urge-surfing-reduction` | Urge Surfing | `reduceMasturbation` | Sexual-urge wording |
| `delay-distract-smoking` | Delay & Distract | `quitSmoking` | Oral substitutes |
| `delay-distract-reduction` | Delay & Distract | `reduceMasturbation` | Physical activity |
| `cognitive-thoughtchallenge` | Thought Challenge | Shared | |
| `cognitive-consequence` | Play the Tape Forward | Shared | |
| `cognitive-alternative` | Alternative Actions | Shared | |
| `journaling` | Journaling | Shared | |
| `relapse-recovery-plan` | Recovery Plan Exercise | Shared | |
| `shame-neutral-recommit` | Shame-Neutral Recommitment | Shared | Anti-shame framing |

**Total:** 18 catalogue entries (previous 16 + 2 mode-specific splits for urge surfing and delay-distract).

**Note:** `counting` exercise from `GroundingExercise` enum is not in the catalogue because it maps to an `ExerciseCategory.grounding` type but with different screen routing. Add it:

| `grounding-counting` | Counting (Backwards by 7) | Shared | Maps to `GroundingExercise.counting` |

### 14.2 Seed Service — Mode-Specific Records

Update `ToolkitSeedService._catalogue` to include the mode-specific entries listed above. The `seedIfNeeded()` check uses `count >= _catalogue.length` — after adding records, the count check will trigger re-seeding on the next launch if the count is less. **Important:** Because the seed is additive (it checks for existing `exerciseId` before inserting), existing records will not be duplicated.

### 14.3 GetExercisesForModeUseCase Fix

**File:** `lib/features/craving_toolkit/domain/usecases/get_exercises_for_mode_usecase.dart` — **Logic is correct.**

The use case delegates to `_repository.getExercisesForMode(mode)`. The repository's `getExercisesForMode` already filters by `isSharedBothModes == true || modeFilter == mode`. No changes needed.

### 14.4 Runtime Mode Injection Pattern

The `mode` string must flow from the user profile all the way down to exercise screens. The injection chain is:

```
UserProfile.goalType.name
    └─► CravingToolkitScreen (reads via userProfileProvider)
            └─► toolkitExercisesProvider(mode) [FutureProvider.family]
            └─► favoriteExercisesProvider(mode) [StreamProvider.family]
            └─► _navigateToExercise(exercise, mode) [passed as parameter]
                    └─► ExerciseDetailScreen(exercise, mode)
                            └─► ExerciseScreenRouter → UrgeSurfingScreen(mode: mode)
                                                    → DelayDistractScreen(mode: mode)
                                                    → CognitiveReframingScreen(mode: mode)
                                                    → RelapseRecoveryPlanScreen(mode: mode)
```

Screens that don't need mode (breathing, grounding, journaling) receive it but ignore it — acceptable overhead.

**Add `currentModeProvider` for convenience:**

```dart
// In toolkit_provider.dart:
final currentModeProvider = FutureProvider.autoDispose<String?>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return profile?.goalType.name;
});
```

---

## 15. Favorites and Recents System

### 15.1 Favorites Toggle — Isar Write Pattern

**File:** `lib/features/craving_toolkit/data/repositories/toolkit_repository_impl.dart`

`toggleFavorite` is already implemented correctly using an Isar write transaction. No change needed.

```dart
@override
Future<void> toggleFavorite(String exerciseId) async {
  final isar = await _db;
  await isar.writeTxn(() async {
    final model = await isar.toolkitExerciseModels
        .filter()
        .exerciseIdEqualTo(exerciseId)
        .findFirst();
    if (model != null) {
      model.isFavorite = !model.isFavorite;
      await isar.toolkitExerciseModels.put(model);
    }
  });
}
```

The Isar write triggers a change notification on the collection, which will propagate to `watchFavorites` once the streaming fix (Bug 4 fix) is applied.

### 15.2 StreamProvider for Live Favorites Updates

**Fix `watchFavorites`** in `ToolkitRepositoryImpl` per Bug 4:

```dart
@override
Stream<List<ToolkitExercise>> watchFavorites(String mode) async* {
  final isar = await _db;
  yield* isar.toolkitExerciseModels
      .filter()
      .isFavoriteEqualTo(true)
      .watch(fireImmediately: true)
      .map((models) => models
          .where((m) => m.isSharedBothModes || m.modeFilter == mode)
          .map(_toEntity)
          .toList());
}
```

**`favoriteExercisesProvider` uses `StreamProvider.family` — correct:**

```dart
final favoriteExercisesProvider = StreamProvider.autoDispose
    .family<List<ToolkitExercise>, String>((ref, mode) {
  final repo = ref.watch(toolkitRepositoryProvider);
  return repo.watchFavorites(mode);
});
```

When the user toggles a favorite, `toggleFavorite()` writes to Isar, which fires the Isar watcher, which pushes a new list to the stream, which updates the `StreamProvider`, which rebuilds the favorites section — all automatically.

### 15.3 Recents Query — lastUsedAt Sorting

**`getRecentExercises` is correct:**

```dart
@override
Future<List<ToolkitExercise>> getRecentExercises({int limit = 3}) async {
  final isar = await _db;
  final models = await isar.toolkitExerciseModels
      .filter()
      .lastUsedAtIsNotNull()
      .sortByLastUsedAtDesc()
      .limit(limit)
      .findAll();
  return models.map(_toEntity).toList();
}
```

**`markExerciseUsed` must be called every time an exercise is started:**

```dart
@override
Future<void> markExerciseUsed(String exerciseId) async {
  final isar = await _db;
  await isar.writeTxn(() async {
    final model = await isar.toolkitExerciseModels
        .filter()
        .exerciseIdEqualTo(exerciseId)
        .findFirst();
    if (model != null) {
      model.lastUsedAt = DateTime.now().toUtc();
      await isar.toolkitExerciseModels.put(model);
    }
  });
}
```

After `markExerciseUsed` is called, `recentExercisesProvider` must be invalidated so the recents section refreshes:

```dart
// In ToolkitSessionNotifier.startSession():
await repo.markExerciseUsed(exercise.id);
ref.invalidate(recentExercisesProvider);  // Force refresh
```

**Alternative:** Use a `StreamProvider` for recents too, watching `lastUsedAt` changes. Given the low frequency of recents updates, `FutureProvider` with invalidation is sufficient.

### 15.4 Repeat Button — Skipping Detail Screen

The "Repeat" button on recent `ExerciseCard`s navigates directly to the exercise screen without going through `ExerciseDetailScreen`:

```dart
// ExerciseCard with showRepeatButton:
if (showRepeatButton && onRepeat != null)
  Positioned(
    bottom: 8,
    right: 8,
    child: TextButton(
      onPressed: onRepeat,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.replay, size: 16),
          const SizedBox(width: 4),
          const Text('Repeat', style: TextStyle(fontSize: 13)),
        ],
      ),
    ),
  ),
```

`onRepeat` in `CravingToolkitScreen` calls `_navigateToExercise(context, exercise, mode, ref)` which uses `ExerciseScreenRouter` to push the correct screen.

---

## 16. Accessibility Requirements

### 16.1 Semantics Labeling Matrix

Per SRS NFR-08/09, all interactive elements must have semantic labels.

| Widget | Required Semantics Label |
|--------|------------------------|
| `ExerciseCard` | `"${exercise.name}, ${exercise.durationLabel}, ${isFavorite ? 'favorited' : 'not favorited'}"` |
| `ExerciseCard` favorite button | `"Toggle favorite for ${exercise.name}"` + `button: true` |
| `ExerciseChip` | `"${exercise.name}, ${exercise.durationLabel}"` + `button: true` |
| `PostExerciseFeedbackSheet` option buttons | Explicit `Semantics(label: rating.label, button: true)` |
| `BreathingAnimation` circle | `Semantics(label: phaseLabel, liveRegion: true)` |
| Repeat button on recents | `Semantics(label: "Repeat ${exercise.name}", button: true)` |
| Phase countdown text | `Semantics(liveRegion: true)` — announces countdowns to screen reader |
| Mood tag filter chips in journal | `Semantics(label: "${tag.label} mood filter, ${isSelected ? 'selected' : 'not selected'}")` |

### 16.2 Live Regions for Dynamic Content

The breathing exercise phase label and countdown change every second. Screen readers must announce these changes. Use `Semantics(liveRegion: true)` on the phase label `Text` widget:

```dart
// In BreathingExerciseScreen._buildExerciseScreen():
Semantics(
  liveRegion: true,
  label: state.phaseInstruction,
  child: Text(
    state.phaseInstruction,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  ),
),
```

Similarly for the `GroundingExerciseScreen` step prompts:

```dart
Semantics(
  liveRegion: true,
  header: true,
  child: Text(promptText, style: ...),
),
```

### 16.3 Contrast and Font Scaling

Per SRS NFR-08, all text must meet WCAG 2.1 AA contrast ratios (minimum 4.5:1 for normal text, 3:1 for large text). All `AppTheme` colors are pre-validated.

**Font scaling:** All `TextStyle` declarations must omit explicit `fontFamily` and rely on system defaults. Font sizes use `sp` units via Flutter's default behavior (all `fontSize` values scale with `MediaQuery.textScaleFactor`). Avoid specifying a fixed `fontSize` without testing at 200% scaling.

**Specific risk areas:**
- `BreathingExerciseScreen` — countdown text at `48sp` and phase label at `32sp` may overflow at 200% scaling on small screens. Use `FittedBox` with `BoxFit.scaleDown` around these widgets.
- `GroundingExerciseScreen` stats in `_buildPatternRow` — ensure `Flexible` or `Expanded` wraps the text to prevent overflow.

---

## 17. Data Model Revisions

### 17.1 ToolkitExerciseModel — No Changes Required

The schema is correct and registered. The `.g.dart` file is generated. No field additions needed.

### 17.2 ToolkitSessionModel — feedbackRating Enum Alignment

The `feedbackRating` field stores `int?` (0=helped, 1=somewhat, 2=notReally). After adding `FeedbackRating` enum (Section 5.4), the repository converts:

```dart
// In ToolkitRepositoryImpl.recordFeedback():
@override
Future<void> recordFeedback({
  required String sessionId,
  required int rating,
}) async {
  // rating is FeedbackRating.value (0, 1, or 2) — stored directly as int
  // No schema change required
  ...
}
```

No Isar model changes. No `.g.dart` regeneration needed.

### 17.3 JournalEntryModel — Schema Confirmed

Schema is correct. No changes.

### 17.4 Isar Registration — Verified Complete

In `lib/core/services/database/isar_service.dart`, all three new schemas are registered:

```dart
ToolkitExerciseModelSchema,   ✅
ToolkitSessionModelSchema,    ✅
JournalEntryModelSchema,      ✅
LapseRecoverySessionModelSchema, ✅ (from interventions plan)
```

No additions needed.

---

## 18. State Management Revisions

### 18.1 ToolkitSessionNotifier — AutoDisposeNotifier Migration

**File:** `lib/features/craving_toolkit/presentation/providers/toolkit_provider.dart`

Current `ToolkitSessionNotifier` extends `AutoDisposeNotifier<ToolkitSessionState>`. This is correct.

**Add `startSession` overload that accepts field-level parameters** (to support screens that construct the exercise ID themselves):

```dart
// Add to ToolkitSessionNotifier:
Future<void> startSession({
  required String exerciseId,
  required String exerciseName,
  required String exerciseCategory,
  required String userId,
  required String mode,
}) async {
  final repo = ref.read(toolkitRepositoryProvider);
  final sessionId = await repo.startSession(
    exerciseId: exerciseId,
    userId: userId,
    mode: mode,
  );

  // Mark exercise as used
  await repo.markExerciseUsed(exerciseId);
  ref.invalidate(recentExercisesProvider);

  state = state.copyWith(
    activeSession: ToolkitSession(
      id: sessionId,
      exerciseId: exerciseId,
      exerciseName: exerciseName,
      exerciseCategory: exerciseCategory,
      startedAt: DateTime.now().toUtc(),
      mode: mode,
    ),
  );
}
```

**The existing `startSession(ToolkitExercise exercise, String userId, String mode)` overload** should be retained for screens that receive the full `ToolkitExercise` entity.

### 18.2 JournalNotifier — AsyncNotifier Pattern

**File:** `lib/features/craving_toolkit/presentation/providers/journal_provider.dart` — **Correct.**

`JournalNotifier` extends `AutoDisposeAsyncNotifier<void>`. All mutations call `ref.invalidate(journalEntriesProvider)` to force list refresh. Correct.

### 18.3 BreathingExerciseNotifier — Provider Cleanup

After the refactor in Section 7.5, the provider signature changes:

```dart
// BEFORE (needs repository):
final breathingExerciseProvider = StateNotifierProvider.autoDispose
    .family<BreathingExerciseNotifier, BreathingExerciseState, BreathingPattern>(
  (ref, pattern) {
    final repository = ref.watch(toolkitRepositoryProvider);
    final userIdAsync = ref.watch(currentUserIdProvider);
    return userIdAsync.when(
      data: (userId) => BreathingExerciseNotifier(repository, userId ?? '', pattern),
      ...
    );
  },
);

// AFTER (no repository needed):
final breathingExerciseProvider = StateNotifierProvider.autoDispose
    .family<BreathingExerciseNotifier, BreathingExerciseState, BreathingPattern>(
  (ref, pattern) => BreathingExerciseNotifier(pattern),
);
```

### 18.4 FavoriteExercises — StreamProvider vs FutureProvider

`favoriteExercisesProvider` uses `StreamProvider.family` backed by `watchFavorites()` (Isar watch). This is the correct choice — favorites must update reactively when toggled.

`toolkitExercisesProvider` uses `FutureProvider.autoDispose.family` — correct for the mode-filtered catalogue list. The catalogue changes only when mode changes (which requires a profile reset, a rare event).

`recentExercisesProvider` uses `FutureProvider.autoDispose` and is invalidated by `ToolkitSessionNotifier` after each `markExerciseUsed` call — correct.

---

## 19. Screen Inventory — Final State

After enhancement, the craving toolkit feature includes:

```
CRAVING TOOLKIT
├── CravingToolkitScreen                S50  (FULL REDESIGN)
│   ├── [Section] Your Favorites        ← Hidden when empty
│   │   └── ExerciseChip ×N            ← Horizontal scroll
│   ├── [Section] Recently Used         ← Hidden until first use
│   │   └── ExerciseCard (compact) ×3  ← With "Repeat" button
│   └── [Section] All Exercises         ← Mode-filtered catalogue
│       └── ExerciseCard ×N
│
├── ExerciseDetailScreen                S51  (NEW)
│   ├── Category icon
│   ├── Duration chip
│   ├── Description + mode note
│   └── "Start" button
│
├── BreathingExerciseScreen             S51a (BUGS FIXED)
│   ├── Setup (duration selector)
│   ├── Exercise (animated circle, phase label, countdown)
│   └── Completion (stats, rate effectiveness, do another)
│
├── GroundingExerciseScreen             S51b (COMPLETION BUG FIXED)
│   ├── FiveSensesExercise
│   ├── BodyScanExercise
│   ├── ObjectFocusExercise
│   ├── CountingExercise
│   └── ColdWaterExercise
│   └── Completion screen (with "Save to Journal" CTA)
│
├── UrgeSurfingScreen                   S51c (NOW WIRED TO CATALOGUE)
│   ├── Intro (mode-specific)
│   ├── Timer with phase prompts
│   └── Completion (did urge pass?) + PostExerciseFeedbackSheet
│
├── CbtTechniqueScreen                  S51d (COMPLETION BUG FIXED)
│   ├── Intro
│   ├── ThoughtChallengeSteps (mode-specific copy)
│   ├── ConsequenceAnalysisSteps (own content — BUG FIX)
│   ├── DelayTacticSteps (timer + suggestions — BUG FIX)
│   └── AlternativeBehaviorSteps (mode-specific list — BUG FIX)
│
├── DelayDistractScreen                 S51e (NOW WIRED TO CATALOGUE)
│   ├── Intro + timer selector
│   ├── Exercise (countdown + activity list)
│   └── Completion + PostExerciseFeedbackSheet
│
├── CognitiveReframingScreen            S51f (NOW WIRED TO CATALOGUE)
│   ├── 5-step guided worksheet
│   └── Completion + "Save to Journal" CTA
│
├── RelapseRecoveryPlanScreen           S51g (NOW WIRED TO CATALOGUE)
│   ├── 5 reflection prompts
│   └── Save (with optional journal save)
│
├── JournalEntryScreen                  S80  (EDIT MODE ADDED)
│   ├── Mood tag chips
│   ├── Freeform text field
│   └── Auto-save + manual save
│
└── JournalListScreen                   (MOOD FILTER ADDED, EDIT FIXED)
    ├── Mood FilterChip row
    └── ListView of JournalCard (tap to edit)
```

**Screens NOT changed:**
- `ToolkitHistoryScreen` — minor visual-only; retained as-is for the MVP. Future enhancement will migrate it to use `ToolkitSessionModel`.
- `DistractionChooserScreen` — stub; replaced by catalogue routing in this cycle. The stub can remain for legacy navigation paths.

---

## 20. Implementation Sequence

Implement strictly in this order to minimize merge conflicts and enable incremental testing.

### Phase 1 — Critical Bug Fixes (no UI changes) — ~2 days

1. Fix `BreathingPattern` enum values (Section 4.1) — `toolkit_models.dart`
2. Fix `watchFavorites` in `ToolkitRepositoryImpl` (Section 4.4) — `toolkit_repository_impl.dart`
3. Fix `JournalRepositoryImpl.getEntries` dynamic query (Section 4.6) — `journal_repository_impl.dart`
4. Fix `ToolkitSeedService._make()` to set `modeSpecificNote` (Section 4.7) — `toolkit_seed_service.dart`
5. Add `_stop()` before `_controller.reset()` in `BreathingAnimation` (Section 4.8) — `breathing_animation.dart`
6. Fix `_getNextPhase()` to skip zero-duration phases (Section 7.1) — `toolkit_provider.dart`
7. Guard `BreathingExerciseNotifier._startTimer()` with `if (!mounted) return` (Section 7.4) — `toolkit_provider.dart`

### Phase 2 — Completion Flow Fixes — ~1 day

8. Fix `GroundingExerciseScreen` completion flow (Section 4.2) — `grounding_exercise_screen.dart`
9. Fix `CbtTechniqueScreen` completion flow (Section 4.3) — `cbt_technique_screen.dart`
10. Add `ref.listen` pattern for `isCompleted` in both screens.
11. Add "Return to Toolkit" button in completion screens.

### Phase 3 — Architecture Consolidation — ~1 day

12. Add `FeedbackRating` domain enum (Section 5.4) — new file
13. Refactor `BreathingExerciseNotifier` to remove repository dependency (Section 7.5) — `toolkit_provider.dart`
14. Update `breathingExerciseProvider` to remove repository injection (Section 18.3)
15. Add `currentModeProvider` to `toolkit_provider.dart` (Section 14.4)
16. Add `ToolkitSessionNotifier.startSession({...})` field-level overload (Section 18.1)

### Phase 4 — Data Layer Enhancements — ~1 day

17. Update `ToolkitSeedService` catalogue with mode-specific entries and `counting` exercise (Section 14.1, 14.2)
18. Add `getRecentSessions()` and `getWeeklySummary()` to `ToolkitRepositoryImpl` (Section 13.3)
19. Update Isar `seedIfNeeded()` to handle new catalogue size
20. Add `_makeMode()` factory to `ToolkitSeedService` (Section 4.7)

### Phase 5 — ExerciseDetailScreen and Navigation Router — ~1 day

21. Create `ExerciseDetailScreen` (Section 6.5) — new file
22. Create `ExerciseScreenRouter` static logic (Section 6.6) — in `craving_toolkit_screen.dart` or separate file
23. Implement `_breathingPatternFrom()` and `_groundingExerciseFrom()` helpers (Section 6.6)
24. Update `ExerciseCard` to add `showRepeatButton` + `onRepeat` callback (Section 15.4)

### Phase 6 — CravingToolkitScreen Full Redesign — ~2 days

25. Redesign `CravingToolkitScreen` to use domain layer (Section 6.1–6.4)
26. Implement `_buildFavoritesSection()` with `ExerciseChip` row
27. Implement `_buildRecentsSection()` with `ExerciseCard` + repeat button
28. Implement `_buildAllExercisesSection()` with `ListView.builder` + `ExerciseCard`
29. Wire `favoriteExercisesProvider(mode)`, `recentExercisesProvider`, `toolkitExercisesProvider(mode)`
30. Wire mode from `userProfileProvider`

### Phase 7 — Exercise Screen Wiring and Session Tracking — ~2 days

31. Wire `UrgeSurfingScreen` to catalogue: convert to `ConsumerStatefulWidget`, add session tracking, add feedback wiring (Section 10.1)
32. Wire `DelayDistractScreen`: same pattern (Section 10.2)
33. Wire `CognitiveReframingScreen`: same pattern + journal CTA (Section 10.3)
34. Wire `RelapseRecoveryPlanScreen`: same pattern + journal save dialog (Section 10.4)
35. Wire session tracking into `BreathingExerciseScreen.initState()` (Section 7.5)
36. Wire session tracking into `GroundingExerciseScreen` (Section 13.2)
37. Wire session tracking into `CbtTechniqueScreen` (Section 13.2)
38. Add `PopScope` abandon-session wiring to all exercise screens (Section 13.2)

### Phase 8 — Journaling Feature Completion — ~1 day

39. Fix `JournalListScreen` `onTap` navigation (Section 11.5)
40. Add mood filter state and `FilterChip` row to `JournalListScreen` (Section 11.5)
41. Add `existingEntry` constructor param to `JournalEntryScreen` (Section 11.4)
42. Add edit mode logic to `_save()` in `JournalEntryScreen` (Section 11.4)

### Phase 9 — CBT Content Fixes and Mode-Specific Copy — ~1 day

43. Implement `ConsequenceAnalysisSteps` with own content (Section 9.2)
44. Implement `DelayTacticSteps` with timer + mode-specific suggestions (Section 9.2)
45. Implement `AlternativeBehaviorSteps` with mode-specific behavior list (Section 9.2)
46. Pass `mode` through `CbtTechniqueContent` to all step widgets (Section 9.3)

### Phase 10 — Accessibility and Polish — ~1 day

47. Add `Semantics` labels per matrix in Section 16.1 to all exercise screens
48. Add `liveRegion: true` to breathing phase label and grounding step prompts (Section 16.2)
49. Add `FittedBox` wrappers to large breathing countdown text (Section 16.3)
50. Verify `SingleChildScrollView` on all exercise intro screens (Section 8.1)
51. Run Flutter Accessibility Scanner on all P0 screens

### Phase 11 — QA and Integration Testing — ~2 days

52. Unit test: `BreathingPattern` enum corrected values — all 4 patterns
53. Unit test: `GetExercisesForModeUseCase` — returns shared + mode-specific, excludes other mode
54. Unit test: `JournalRepositoryImpl.getEntries` — mood filter works without dynamic
55. Unit test: `ToolkitSeedService` — all 18 entries seeded, no duplicates
56. Widget test: `CravingToolkitScreen` — opens in <1s, shows favorites, recents, all exercises
57. Widget test: `BreathingExerciseScreen` — correct phase durations for relaxing (4-7-8)
58. Widget test: `GroundingExerciseScreen` — `isCompleted = true` after rating → completion screen shows
59. Widget test: `CbtTechniqueScreen` — same completion screen test
60. Integration test: start breathing → session written to `ToolkitSessionModel`
61. Integration test: toggle favorite → `favoriteExercisesProvider` updates reactively
62. Performance test: `CravingToolkitScreen` cold open ≤1000ms

---

## 21. File-Level Change Matrix

### Files to Modify

| File | Change Type | Changes |
|------|-------------|---------|
| `toolkit_models.dart` | Bug fix | Fix `BreathingPattern` enum values for calm and energizing |
| `toolkit_repository_impl.dart` | Bug fix + enhancement | Fix `watchFavorites`; add `getRecentSessions`, `getWeeklySummary` |
| `journal_repository_impl.dart` | Bug fix | Fix `getEntries` dynamic query |
| `toolkit_seed_service.dart` | Bug fix + enhancement | Fix `modeSpecificNote` assignment; add mode-specific catalogue entries; add `_makeMode()` factory |
| `toolkit_provider.dart` | Refactor + enhancement | Remove repository from `BreathingExerciseNotifier`; fix provider; add `currentModeProvider`; add `startSession` overload to `ToolkitSessionNotifier` |
| `breathing_animation.dart` | Bug fix | Add `_controller.stop()` before reset; add phase equality check in `didUpdateWidget` |
| `craving_toolkit_screen.dart` | Full redesign | Remove hardcoded cards; implement domain-layer-driven sections |
| `breathing_exercise_screen.dart` | Enhancement | Add `initState` session tracking; refactor to not call old repo |
| `grounding_exercise_screen.dart` | Bug fix + enhancement | Fix completion flow; add `ref.listen`; add journal CTA |
| `cbt_technique_screen.dart` | Bug fix + enhancement | Fix completion flow; add `ref.listen` |
| `urge_surfing_screen.dart` | Enhancement | Convert to `ConsumerStatefulWidget`; add session tracking; fix feedback wiring |
| `delay_distract_screen.dart` | Enhancement | Convert to `ConsumerStatefulWidget`; add session tracking; add feedback sheet |
| `cognitive_reframing_screen.dart` | Enhancement | Convert to `ConsumerStatefulWidget`; add session tracking; add journal CTA |
| `relapse_recovery_plan_screen.dart` | Enhancement | Convert to `ConsumerStatefulWidget`; add session tracking; add journal save dialog |
| `journal_list_screen.dart` | Bug fix + enhancement | Fix `onTap` edit navigation; add mood filter |
| `journal_entry_screen.dart` | Enhancement | Add `existingEntry` param; add edit mode |
| `journal_provider.dart` | Verify | Confirm `currentUserIdProvider` import path |
| `exercise_card.dart` | Enhancement | Add `showRepeatButton`, `onRepeat` callback |
| `thought_challenge_steps.dart` | Verify | Confirm mode-agnostic steps are correct |
| `urge_surfing_steps.dart` | Enhancement | Pass mode to customize wording |
| `consequence_analysis_steps.dart` | Bug fix | Implement own content instead of reusing `ThoughtChallengeSteps` |
| `delay_tactic_steps.dart` | Bug fix | Implement own content with timer + suggestions |
| `alternative_behavior_steps.dart` | Bug fix | Implement own content with mode-specific behavior list |

### New Files to Create

| File | Purpose |
|------|---------|
| `lib/features/craving_toolkit/domain/entities/feedback_rating.dart` | `FeedbackRating` enum |
| `lib/features/craving_toolkit/presentation/screens/exercise_detail_screen.dart` | Exercise detail/overview screen |

---

## 22. Acceptance Criteria Checklist

### FR-T01 — Accessibility

- [ ] `CravingToolkitScreen` opens from dashboard FAB in ≤1 second (no loading screen)
- [ ] `CravingToolkitScreen` opens from log screen button in ≤1 second
- [ ] All exercise screens work fully offline with zero network requests
- [ ] First exercise is visible immediately when toolkit opens

### FR-T02 — 7 Exercise Types

- [ ] Breathing exercises (box, relaxing, calm, energizing) — accessible from catalogue
- [ ] Grounding exercises (5-4-3-2-1, body scan, object focus, counting, cold water) — accessible from catalogue
- [ ] Urge surfing — accessible from catalogue with mode-specific wording
- [ ] Delay & Distract — accessible from catalogue with mode-specific suggestions
- [ ] Cognitive reframing — accessible from catalogue
- [ ] Journaling — accessible from catalogue
- [ ] Recovery planning exercise — accessible from catalogue
- [ ] Minimum 7 exercise types confirmed in `toolkitExercisesProvider(mode)` for both modes

### FR-T03 — Mode-Specific Content

- [ ] Smoking mode shows: `urge-surfing-smoking`, `delay-distract-smoking`
- [ ] Smoking mode does NOT show: `urge-surfing-reduction`, `delay-distract-reduction`
- [ ] Reduction mode shows: `urge-surfing-reduction`, `delay-distract-reduction`
- [ ] Reduction mode does NOT show: `urge-surfing-smoking`, `delay-distract-smoking`
- [ ] Shared exercises appear for both modes
- [ ] `modeSpecificNote` rendered in `ExerciseDetailScreen` when non-null

### FR-T04 — Favorites and Recents

- [ ] Heart icon visible on each `ExerciseCard`
- [ ] Tapping heart instantly toggles `isFavorite` in Isar
- [ ] Favorites section appears at top of toolkit when ≥1 exercise is favorited
- [ ] Favorites section hidden when no exercises favorited
- [ ] Favorites section updates reactively when toggled (no manual refresh)
- [ ] Favorites persisted across app restarts
- [ ] Recents section shows last 3 used exercises
- [ ] "Repeat" button on recents navigates directly to exercise (skips detail screen)
- [ ] Recents updated after each exercise start

### FR-T05 — Usage Tracking

- [ ] `ToolkitSessionModel` record written at exercise start
- [ ] `ToolkitSessionModel.completedAt` set on completion
- [ ] `ToolkitSessionModel.completedAt` null when abandoned
- [ ] `ToolkitSessionModel.feedbackRating` set when feedback given
- [ ] Abandoned session recorded when user exits mid-exercise via `PopScope`
- [ ] Weekly summary queries `ToolkitSessionModel` correctly

### FR-T06 — Duration Estimates

- [ ] Duration chip (`~X min`) visible on `ExerciseCard` before tapping
- [ ] Duration chip visible on `ExerciseDetailScreen`
- [ ] Duration label derived from `ToolkitExercise.durationEstimateSeconds`

### FR-T07 — Breathing Animation

- [ ] Box breathing: 4-4-4-4 seconds per phase
- [ ] 4-7-8 relaxing: 4-7-8 seconds (no pause)
- [ ] Energizing: 6-2 seconds (no hold, no pause)
- [ ] Calm: 4-6 seconds (no hold, no pause)
- [ ] Phase label "Inhale"/"Hold"/"Exhale"/"Pause" changes synchronously with phase
- [ ] Circle grows on inhale, holds on hold, shrinks on exhale
- [ ] Animation runs fully offline (no GIF/video)
- [ ] `AnimationController` disposed in `dispose()` — no memory leak
- [ ] `mounted` guard prevents state updates after dispose

### FR-T08 — Journaling

- [ ] Journal entries written to Isar `JournalEntryModel`
- [ ] Mood tag persisted with journal entry
- [ ] Auto-save fires every 30 seconds
- [ ] Manual save on AppBar "Save" tap
- [ ] Edit mode works for existing entries (tap from list)
- [ ] Mood filter in `JournalListScreen` works correctly
- [ ] `getEntries` with mood filter does not throw runtime error
- [ ] Journal entry linked to source exercise when created from exercise CTA

### Architecture and Quality

- [ ] `CravingToolkitScreen` uses domain layer (no hardcoded exercise lists)
- [ ] `BreathingExerciseNotifier` has no repository dependency after refactor
- [ ] `watchFavorites` uses Isar reactive watch (not `asStream().asyncMap()`)
- [ ] No `dynamic` types in repository implementations
- [ ] `ToolkitSeedService` creates mode-specific records for urge surfing and delay-distract
- [ ] All exercise screens wire `ToolkitSessionNotifier` for start/end/feedback
- [ ] CBT technique steps show correct content per technique (not shared `ThoughtChallengeSteps`)
- [ ] All new `ConsumerStatefulWidget` conversions maintain existing visual behavior

---

## 23. QA Traceability Matrix

| Requirement | Test Type | Test Description | Priority |
|-------------|-----------|------------------|----------|
| FR-T01: Toolkit opens in <1s | Performance test | Measure `MaterialPageRoute` push time on 2GB RAM Android in release mode | P0 |
| FR-T02: 7 exercise types | Unit test | `toolkitExercisesProvider('quitSmoking')` returns ≥7 exercises; same for reduction | P0 |
| FR-T03: Mode filtering | Unit test | `GetExercisesForModeUseCase.execute('quitSmoking')` returns smoking-specific + shared; does NOT return reduction-specific | P0 |
| FR-T03: Mode wording | Widget test | `UrgeSurfingScreen(mode: 'quitSmoking')` shows nicotine-specific copy; reduction mode shows different copy | P1 |
| FR-T04: Favorites toggle | Integration test | Toggle favorite → `favoriteExercisesProvider` emits updated list within 500ms | P0 |
| FR-T04: Favorites persist | Integration test | Toggle favorite → kill app → reopen → exercise still favorited | P0 |
| FR-T04: Recents | Integration test | Start exercise → `recentExercisesProvider` returns it in top 3 | P1 |
| FR-T04: Repeat button | Widget test | Tap "Repeat" on recent exercise → correct exercise screen opened (skips detail) | P1 |
| FR-T05: Session start | Integration test | Open any exercise screen → `ToolkitSessionModel` record created with correct `userId`, `exerciseId`, `mode` | P0 |
| FR-T05: Session complete | Integration test | Complete breathing exercise → `completedAt` set on `ToolkitSessionModel` | P0 |
| FR-T05: Session abandon | Integration test | Tap back mid-exercise (confirm exit) → `completedAt` is null on `ToolkitSessionModel` | P1 |
| FR-T05: Feedback rating | Integration test | Submit rating → `feedbackRating` updated on `ToolkitSessionModel` | P1 |
| FR-T06: Duration chip | Widget test | `ExerciseCard` renders `_DurationChip` with correct label for each exercise | P1 |
| FR-T07: Breathing phases — box | Unit test | `BreathingPattern.box` → `inhale=4, hold=4, exhale=4, pause=4` | P0 |
| FR-T07: Breathing phases — relaxing | Unit test | `BreathingPattern.relaxing` → `inhale=4, hold=7, exhale=8, pause=0` | P0 |
| FR-T07: Breathing phases — energizing | Unit test | `BreathingPattern.energizing` → `inhale=6, hold=0, exhale=2, pause=0` | P0 |
| FR-T07: Breathing phases — calm | Unit test | `BreathingPattern.calm` → `inhale=4, hold=0, exhale=6, pause=0` | P0 |
| FR-T07: Phase skip | Unit test | `_getNextPhase()` after inhale for calm → returns exhale (skips hold) | P0 |
| FR-T07: Animation offline | Network test | Open breathing exercise with device offline → animation runs, zero HTTP requests | P0 |
| FR-T07: AnimationController dispose | Widget test | Push then pop breathing screen → no `setState called after dispose` exception | P0 |
| FR-T08: Journal create | Integration test | Type content + select mood → tap save → `JournalEntryModel` record in Isar with correct fields | P0 |
| FR-T08: Journal edit | Integration test | Tap existing entry → edit content → save → Isar record updated | P1 |
| FR-T08: Journal mood filter | Unit test | `JournalRepositoryImpl.getEntries(userId: uid, moodFilter: 'calm')` returns only calm entries | P0 |
| FR-T08: Journal mood filter null | Unit test | `getEntries(userId: uid, moodFilter: null)` returns all entries | P0 |
| FR-T08: Journal auto-save | Widget test | Type in `JournalEntryScreen`, wait 31 seconds → entry created in Isar without manual save | P2 |
| Grounding completion | Widget test | Complete any grounding exercise → enter rating → `state.isCompleted = true` → completion screen renders | P0 |
| CBT completion | Widget test | Complete any CBT technique → enter rating → completion screen renders | P0 |
| Seed catalogue | Unit test | `ToolkitSeedService.seedIfNeeded()` → Isar has ≥18 records, no duplicates | P0 |
| Seed mode-specific | Unit test | After seeding, `isar.toolkitExerciseModels.filter().modeFilterEqualTo('quitSmoking').findAll()` returns ≥2 | P1 |
| watchFavorites reactive | Widget test | Toggle `isFavorite` in Isar → `watchFavorites` stream emits new list within 500ms | P0 |
| Accessibility — breathing | Manual + automated | `BreathingAnimation` phase label has `liveRegion: true`; VoiceOver announces phase changes | P1 |
| Accessibility — exercise card | Automated | Flutter Accessibility Scanner: `ExerciseCard` interactive elements have semantic labels | P1 |
| Content audit — toolkit copy | Static analysis | Grep all exercise descriptions and `modeSpecificNote` fields for banned phrases list | P0 |

---

*End of Craving Toolkit Enhancement Plan v1.0*

**Stack confirmation:** Flutter · Isar · Riverpod (AutoDisposeNotifier / StateNotifier / FutureProvider / StreamProvider / AsyncNotifier) · Clean Architecture — Domain has ZERO Flutter dependencies.

**Predecessor document implemented:** `QUITMATE_INTERVENTIONS_RELAPSE_PLAN.md` (Interventions, Notifications, Lapse Recovery, Help & Safety).

**Next document:** `QUITMATE_GAMIFICATION_SETTINGS_PLAN.md` — Achievement system, badge gallery, weekly review screen, data export, and settings screen enhancements.
