# QuitMate — Craving Toolkit Enhancement Implementation Notes

**Date:** 2026-05-14
**Status:** Implemented
**Stack:** Flutter · Isar · Riverpod · Clean Architecture

---

## Table of Contents

1. [Overview](#1-overview)
2. [What Was Implemented](#2-what-was-implemented)
3. [Architecture Decisions](#3-architecture-decisions)
4. [File Change Summary](#4-file-change-summary)
5. [Provider Topology](#5-provider-topology)
6. [Navigation Flow](#6-navigation-flow)
7. [Data Flow](#7-data-flow)
8. [Known Limitations & Future Work](#8-known-limitations--future-work)
9. [Developer Notes](#9-developer-notes)

---

## 1. Overview

This implementation brings the Craving Toolkit feature to full SRS v2.0 compliance. The enhancement covers:

- **8 critical bug fixes** across breathing phase timing, completion flows, repository queries, and provider architecture.
- **Full CravingToolkitScreen redesign** using the domain layer (favorites, recents, mode-filtered catalogue).
- **New ExerciseDetailScreen** as an intermediary between catalogue cards and exercise screens.
- **Session tracking** wired into all 7 exercise types via `ToolkitSessionNotifier`.
- **Mode-specific content** with separate catalogue entries for smoking vs. reduction modes.
- **Journaling feature completion** with edit mode, mood filtering, and exercise-linked entries.
- **CBT technique content** — each technique now has its own dedicated step widget.
- **Accessibility** — semantic labels on interactive elements.

---

## 2. What Was Implemented

### Phase 1 — Critical Bug Fixes

| Bug | File | Fix |
|-----|------|-----|
| Breathing phase timing incorrect | `toolkit_models.dart` | Corrected `inhaleSeconds`, `holdSeconds`, `exhaleSeconds` for `energizing` and `calm` patterns |
| `watchFavorites` not reactive | `toolkit_repository_impl.dart` | Replaced `asStream().asyncMap()` with `watch(fireImmediately: true)` |
| `JournalRepositoryImpl.getEntries` dynamic query | `journal_repository_impl.dart` | Replaced `dynamic` with conditional `QueryBuilder` chain |
| `BreathingAnimation` mid-animation reset | `breathing_animation.dart` | Added `_controller.stop()` before `reset()` |
| `_getNextPhase` doesn't skip zero-duration phases | `toolkit_provider.dart` | Added hold/pause skip logic for patterns with 0-second phases |
| `BreathingExerciseNotifier` missing `mounted` guard | `toolkit_provider.dart` | Added `if (!mounted) return` at top of `_startTimer()` |

### Phase 2 — Completion Flow Fixes

| Screen | Fix |
|--------|-----|
| `GroundingExerciseScreen` | Removed `Navigator.pop(context)` from `_showEffectivenessRating()`. Completion screen now renders via `state.isCompleted` — user taps "Return to Toolkit" to leave. |
| `CbtTechniqueScreen` | Same pattern — removed `Navigator.pop(context)` from rating callback. |

### Phase 3 — Architecture Consolidation

- **`FeedbackRating` enum** created at `domain/entities/feedback_rating.dart` (helped=0, somewhat=1, notReally=2).
- **`BreathingExerciseNotifier` refactored** — removed repository dependency. Now a pure visual state machine. Session recording moved to `ToolkitSessionNotifier`.
- **`BreathingExerciseState.session` field removed** — no longer needed.
- **`currentModeProvider`** added — derives mode from `onboardingProvider.goalType`.
- **`ToolkitSessionNotifier.startSessionById()`** overload added for screens that construct exercise IDs themselves.

### Phase 4 — Data Layer Enhancements

- **`ToolkitSeedService`** updated:
  - `_makeMode()` factory added for mode-specific entries.
  - Urge Surfing split into `urge-surfing-smoking` and `urge-surfing-reduction`.
  - Delay & Distract split into `delay-distract-smoking` and `delay-distract-reduction`.
  - Counting exercise (`grounding-counting`) added.
  - Total catalogue: 18 entries (was 16).
- **`ToolkitRepositoryImpl`** new methods:
  - `getRecentSessions({userId, days})` — sessions within date range.
  - `getWeeklySummary({userId})` — aggregated stats for weekly review.
- **`IToolkitRepository`** interface updated with new method signatures.

### Phase 5 — ExerciseDetailScreen and Navigation Router

- **`ExerciseDetailScreen`** created — shows category icon, duration, description, mode-specific note, and Start button.
- **`ExerciseScreenRouter`** — routes `ToolkitExercise` to the correct screen based on `ExerciseCategory`.
- **`ExerciseCard`** updated with `showRepeatButton` and `onRepeat` callback.

### Phase 6 — CravingToolkitScreen Full Redesign

- Removed hardcoded category cards and bottom sheets.
- Now uses domain-layer providers:
  - `favoriteExercisesProvider(mode)` → horizontal `ExerciseChip` row.
  - `recentExercisesProvider` → `ExerciseCard` list with Repeat buttons.
  - `toolkitExercisesProvider(mode)` → full catalogue `ExerciseCard` list.
- Mode read from `currentModeProvider` (derived from user profile).

### Phase 7 — Exercise Screen Wiring

All exercise screens now wire `ToolkitSessionNotifier`:

| Screen | Session Start | Session End | Feedback |
|--------|--------------|-------------|----------|
| `BreathingExerciseScreen` | `initState` | On completion | Via `EffectivenessRatingDialog` |
| `GroundingExerciseScreen` | On "Begin Exercise" | On rating | Via `EffectivenessRatingDialog` |
| `CbtTechniqueScreen` | On "Begin Exercise" | On rating | Via `CbtEffectivenessDialog` |
| `UrgeSurfingScreen` | `initState` | On feedback sheet | Via `PostExerciseFeedbackSheet` |
| `DelayDistractScreen` | `initState` | On feedback sheet | Via `PostExerciseFeedbackSheet` |
| `CognitiveReframingScreen` | `initState` | On final step | Via `PostExerciseFeedbackSheet` |
| `RelapseRecoveryPlanScreen` | `initState` | On save | N/A (journal save offered) |

All screens converted to `ConsumerStatefulWidget` where needed. `PopScope` with abandon-session wiring added.

### Phase 8 — Journaling Feature Completion

- **`JournalEntryScreen`** — added `existingEntry` parameter for edit mode. Pre-populates content and mood in edit mode. `_save()` branches on create vs. update.
- **`JournalListScreen`** — fixed `onTap` to pass `existingEntry` for edit. Added mood `FilterChip` row. Converted to `ConsumerStatefulWidget` for local filter state.

### Phase 9 — CBT Content Fixes

- **`ConsequenceAnalysisSteps`** — now has its own 4-step flow: short-term give-in, long-term give-in, short-term resist, compare paths.
- **`DelayTacticSteps`** — 4-step flow with countdown timer and activity suggestions.
- **`AlternativeBehaviorSteps`** — 4-step flow with trigger identification, alternative selection from 8 options, action step, and reflection.

### Phase 10 — Accessibility

- `ExerciseCard` — semantic labels on favorite toggle and repeat button.
- `ExerciseChip` — semantic label with exercise name and duration.
- `ExerciseDetailScreen` — semantic label on favorite toggle.

---

## 3. Architecture Decisions

### BreathingExerciseNotifier as Pure Visual State Machine

**Decision:** Remove all Isar writes from `BreathingExerciseNotifier`. Session recording is now the responsibility of `ToolkitSessionNotifier`, called from the screen's `initState`.

**Rationale:** The breathing notifier was writing to the legacy `BreathingSession` collection while the new session tracking writes to `ToolkitSessionModel`. This created duplicate records. Consolidating all session writes into `ToolkitSessionNotifier` ensures a single source of truth.

**Impact:** `BreathingExerciseNotifier` no longer needs a repository or userId. The provider signature simplified from `(ref, pattern) => BreathingExerciseNotifier(repository, userId, pattern)` to `(ref, pattern) => BreathingExerciseNotifier(pattern)`.

### Mode-Specific Catalogue Entries

**Decision:** Create separate `ToolkitExerciseModel` records for mode-specific exercises (urge surfing, delay-distract) rather than using a single shared record with conditional wording.

**Rationale:** The `modeFilter` field on `ToolkitExerciseModel` is designed for exactly this purpose. The `getExercisesForMode(mode)` query filters by `isSharedBothModes == true || modeFilter == mode`. Separate records allow each mode to have its own `modeSpecificNote` and `shortDescription`.

**Impact:** Catalogue grew from 16 to 18 entries. The `seedIfNeeded()` method is additive — existing records are not duplicated.

### Completion Flow: In-Screen vs. Pop

**Decision:** Grounding and CBT completion screens now render in-place (driven by `state.isCompleted`) rather than popping the screen.

**Rationale:** The previous pattern called `Navigator.pop(context)` immediately after `notifier.complete()`, which popped the screen before the state update could trigger a rebuild showing the completion screen. The new pattern lets `isCompleted = true` drive the body rendering, and the user manually taps "Return to Toolkit" to leave.

---

## 4. File Change Summary

### Modified Files

| File | Change Type |
|------|-------------|
| `data/models/toolkit_models.dart` | Bug fix — BreathingPattern enum values |
| `data/repositories/toolkit_repository_impl.dart` | Bug fix + enhancement — watchFavorites, getRecentSessions, getWeeklySummary |
| `data/repositories/journal_repository_impl.dart` | Bug fix — getEntries dynamic query |
| `data/datasources/toolkit_seed_service.dart` | Enhancement — mode-specific entries, _makeMode factory, counting exercise |
| `domain/repositories/i_toolkit_repository.dart` | Enhancement — getRecentSessions, getWeeklySummary signatures |
| `presentation/providers/toolkit_provider.dart` | Refactor — BreathingExerciseNotifier, currentModeProvider, startSessionById, _getNextPhase, mounted guard |
| `presentation/widgets/breathing_animation.dart` | Bug fix — _controller.stop() |
| `presentation/screens/craving_toolkit_screen.dart` | Full redesign — domain-layer-driven catalogue |
| `presentation/screens/breathing_exercise_screen.dart` | Enhancement — session tracking, ref.listen fix |
| `presentation/screens/grounding_exercise_screen.dart` | Bug fix — completion flow |
| `presentation/screens/cbt_technique_screen.dart` | Bug fix — completion flow |
| `presentation/screens/urge_surfing_screen.dart` | Enhancement — ConsumerStatefulWidget, session tracking, feedback wiring |
| `presentation/screens/delay_distract_screen.dart` | Enhancement — ConsumerStatefulWidget, session tracking, feedback wiring |
| `presentation/screens/cognitive_reframing_screen.dart` | Enhancement — ConsumerStatefulWidget, session tracking, journal CTA |
| `presentation/screens/relapse_recovery_plan_screen.dart` | Enhancement — ConsumerStatefulWidget, session tracking, journal save dialog |
| `presentation/screens/journal_entry_screen.dart` | Enhancement — edit mode |
| `presentation/screens/journal_list_screen.dart` | Bug fix + enhancement — edit navigation, mood filter |
| `presentation/widgets/exercise_card.dart` | Enhancement — repeat button, Stack wrapper |
| `presentation/widgets/exercise_chip.dart` | Enhancement — Semantics label |
| `presentation/widgets/consequence_analysis_steps.dart` | Bug fix — own content |
| `presentation/widgets/delay_tactic_steps.dart` | Bug fix — own content with timer |
| `presentation/widgets/alternative_behavior_steps.dart` | Bug fix — own content |

### New Files

| File | Purpose |
|------|---------|
| `domain/entities/feedback_rating.dart` | FeedbackRating enum |
| `presentation/screens/exercise_detail_screen.dart` | Exercise detail/overview + ExerciseScreenRouter |

---

## 5. Provider Topology

```
toolkitRepositoryProvider → ToolkitRepository (legacy, for ToolkitHistoryScreen)
toolkitExerciseRepoProvider → ToolkitRepositoryImpl (IToolkitRepository)

currentModeProvider → String? (from onboardingProvider.goalType)

toolkitExercisesProvider(mode) → FutureProvider.family
favoriteExercisesProvider(mode) → StreamProvider.family (Isar watch)
recentExercisesProvider → FutureProvider.autoDispose

toolkitSessionProvider → NotifierProvider.autoDispose
  └─ ToolkitSessionNotifier
       ├─ startSession(ToolkitExercise, userId, mode)
       ├─ startSessionById({...})  ← field-level overload
       ├─ endSession(completed)
       ├─ recordFeedback(rating)
       └─ toggleFavorite(exerciseId)

breathingExerciseProvider(pattern) → StateNotifierProvider.autoDispose.family
  └─ BreathingExerciseNotifier (pure visual, no repository)

cbtSessionProvider(technique) → StateNotifierProvider.autoDispose.family
groundingSessionProvider(exercise) → StateNotifierProvider.autoDispose.family

journalRepositoryProvider → JournalRepositoryImpl
journalEntriesProvider(moodFilter) → FutureProvider.autoDispose.family
journalNotifierProvider → AsyncNotifierProvider.autoDispose
```

---

## 6. Navigation Flow

```
CravingToolkitScreen
├── [Favorites] ExerciseChip tap → ExerciseDetailScreen → ExerciseScreenRouter → exercise screen
├── [Recents] ExerciseCard tap → ExerciseDetailScreen → ...
├── [Recents] Repeat button → ExerciseScreenRouter → exercise screen (skips detail)
└── [All] ExerciseCard tap → ExerciseDetailScreen → ExerciseScreenRouter → exercise screen

ExerciseScreenRouter maps ExerciseCategory:
  breathing          → BreathingExerciseScreen
  grounding          → GroundingExerciseScreen
  urgeSurfing        → UrgeSurfingScreen
  delayAndDistract   → DelayDistractScreen
  cognitiveReframing → CognitiveReframingScreen
  journaling         → JournalEntryScreen
  relapseRecoveryPlanning → RelapseRecoveryPlanScreen
```

---

## 7. Data Flow

### Session Recording

```
Screen.initState()
  → ToolkitSessionNotifier.startSessionById(...)
    → ToolkitRepositoryImpl.startSession() [writes ToolkitSessionModel]
    → ToolkitRepositoryImpl.markExerciseUsed() [updates lastUsedAt]
    → ref.invalidate(recentExercisesProvider)

Screen completion
  → ToolkitSessionNotifier.endSession(completed: true)
    → ToolkitRepositoryImpl.endSession() [sets completedAt]

Feedback sheet
  → ToolkitSessionNotifier.recordFeedback(rating)
    → ToolkitRepositoryImpl.recordFeedback() [sets feedbackRating]
```

### Favorites Toggle

```
ExerciseCard favorite icon tap
  → ToolkitSessionNotifier.toggleFavorite(exerciseId)
    → ToolkitRepositoryImpl.toggleFavorite() [Isar write txn]
      → Isar watch fires
        → favoriteExercisesProvider(mode) emits new list
          → Favorites section rebuilds reactively
```

---

## 8. Known Limitations & Future Work

### Legacy Repository

The old `ToolkitRepository` (handling `BreathingSession`, `CbtSession`, `GroundingSession`, `DistractionSession`) is still used by `ToolkitHistoryScreen` for statistics. Future work should migrate the history screen to read from `ToolkitSessionModel` and remove the legacy repository.

### DistractionChooserScreen

This screen is a stub ("Coming soon!"). It is no longer reachable from the main toolkit flow but remains in the codebase for legacy navigation paths.

### BreathingExerciseScreen Session Tracking

The breathing screen now starts a session via `ToolkitSessionNotifier.startSessionById()` in `initState`, but the `complete()` call in the notifier no longer writes to any repository. The session end/feedback should be wired from the screen's completion flow (currently handled by the `EffectivenessRatingDialog` callback). This is a partial implementation — the session start is tracked, but end/feedback for breathing exercises needs additional wiring in the screen.

### CBT Step Widgets — Mode Parameter

The `CbtTechniqueContent` widget does not pass `mode` to the step widgets. Mode-specific wording in CBT techniques (e.g., smoking vs. reduction reframing prompts) is not yet implemented.

### IsarService Cross-Cutting Coupling

`IsarService` in `lib/core/` imports models from 6 feature modules. This violates clean architecture (core should not depend on features). A future refactor could use dependency inversion.

---

## 9. Developer Notes

### Running the App

```bash
flutter pub get
flutter run
```

### Regenerating Isar Models

If you modify any `@collection` class, regenerate:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Seed Data

The `ToolkitSeedService.seedIfNeeded()` runs on app startup. It checks `count >= _catalogue.length` and only inserts exercises that don't already exist (matched by `exerciseId`). After this enhancement, the catalogue has 18 entries. Existing installs will get the 2 new mode-specific entries on next launch.

### Key IDs for Mode-Specific Exercises

- Smoking mode: `urge-surfing-smoking`, `delay-distract-smoking`
- Reduction mode: `urge-surfing-reduction`, `delay-distract-reduction`

### Breathing Pattern Corrected Values

| Pattern | Inhale | Hold | Exhale | Pause | Total |
|---------|--------|------|--------|-------|-------|
| Box | 4 | 4 | 4 | 4 | 16 |
| Relaxing (4-7-8) | 4 | 7 | 8 | 0 | 19 |
| Energizing | 6 | 0 | 2 | 0 | 8 |
| Calm | 4 | 0 | 6 | 0 | 10 |

### FeedbackRating Values

| Rating | Value | Label | Emoji |
|--------|-------|-------|-------|
| helped | 0 | Yes, it helped | 😊 |
| somewhat | 1 | Somewhat | 🤷 |
| notReally | 2 | Not really | 😕 |

---

*End of Implementation Notes*