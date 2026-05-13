# QuitMate — Interventions & Relapse Prevention Enhancement Plan

**Document Version:** 2.0  
**Status:** Ready for Implementation  
**Stack:** Flutter · Isar · Riverpod · Clean Architecture  
**Scope:** Craving Toolkit (Interventions) · Relapse Prevention  
**Predecessor Document:** `QUITMATE_ENHANCEMENT_PLAN.md` (Onboarding & Tracking — Implemented)

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Current State Analysis](#2-current-state-analysis)
   - 2.1 [Interventions — What Exists](#21-interventions--what-exists)
   - 2.2 [Relapse Prevention — What Exists](#22-relapse-prevention--what-exists)
   - 2.3 [Critical Violations Summary](#23-critical-violations-summary)
3. [SRS Compliance Gaps](#3-srs-compliance-gaps)
   - 3.1 [Craving Toolkit Gaps](#31-craving-toolkit-gaps)
   - 3.2 [Notification System Gaps](#32-notification-system-gaps)
   - 3.3 [Relapse Prevention Gaps](#33-relapse-prevention-gaps)
4. [Craving Toolkit — Enhancement Plan](#4-craving-toolkit--enhancement-plan)
   - 4.1 [Architecture Redesign](#41-architecture-redesign)
   - 4.2 [Exercise Data Model](#42-exercise-data-model)
   - 4.3 [Toolkit Screen Hierarchy](#43-toolkit-screen-hierarchy)
   - 4.4 [Breathing Exercise Enhancement](#44-breathing-exercise-enhancement)
   - 4.5 [Grounding Exercise Enhancement](#45-grounding-exercise-enhancement)
   - 4.6 [CBT Technique Enhancement](#46-cbt-technique-enhancement)
   - 4.7 [Journaling Feature](#47-journaling-feature)
   - 4.8 [Urge Surfing Exercise](#48-urge-surfing-exercise)
   - 4.9 [Mode-Specific Content Filtering](#49-mode-specific-content-filtering)
   - 4.10 [Favorites & Recents System](#410-favorites--recents-system)
   - 4.11 [Post-Exercise Feedback Loop](#411-post-exercise-feedback-loop)
   - 4.12 [Toolkit Usage Tracking](#412-toolkit-usage-tracking)
5. [Notification System — Enhancement Plan](#5-notification-system--enhancement-plan)
   - 5.1 [Architecture Overview](#51-architecture-overview)
   - 5.2 [Permission Flow Redesign](#52-permission-flow-redesign)
   - 5.3 [Notification Scheduling Logic](#53-notification-scheduling-logic)
   - 5.4 [Adaptive Notification Engine](#54-adaptive-notification-engine)
   - 5.5 [Notification Content Audit](#55-notification-content-audit)
   - 5.6 [Settings Integration](#56-settings-integration)
6. [Relapse Prevention — Enhancement Plan](#6-relapse-prevention--enhancement-plan)
   - 6.1 [Architecture Redesign](#61-architecture-redesign)
   - 6.2 [Relapse Plan Data Model](#62-relapse-plan-data-model)
   - 6.3 [Lapse Recovery Flow (Multi-Step)](#63-lapse-recovery-flow-multi-step)
   - 6.4 [Panic Mode Redesign](#64-panic-mode-redesign)
   - 6.5 [Emergency Contacts Enhancement](#65-emergency-contacts-enhancement)
   - 6.6 [Help & Safety Screen](#66-help--safety-screen)
   - 6.7 [Custom Relapse Plan Builder](#67-custom-relapse-plan-builder)
   - 6.8 [Recovery Statistics](#68-recovery-statistics)
7. [Data Model Revisions](#7-data-model-revisions)
   - 7.1 [ToolkitExercise Isar Model](#71-toolkitexercise-isar-model)
   - 7.2 [ToolkitSession Isar Model](#72-toolkitsession-isar-model)
   - 7.3 [JournalEntry Isar Model](#73-journalentry-isar-model)
   - 7.4 [RelapsePlan Isar Model Revision](#74-relapseplan-isar-model-revision)
   - 7.5 [NotificationPreferences Isar Model Revision](#75-notificationpreferences-isar-model-revision)
8. [State Management Revisions](#8-state-management-revisions)
   - 8.1 [ToolkitProvider Architecture](#81-toolkitprovider-architecture)
   - 8.2 [JournalProvider Architecture](#82-journalprovider-architecture)
   - 8.3 [RelapsePlanProvider Revision](#83-relapseplanprovider-revision)
   - 8.4 [NotificationPreferencesProvider Revision](#84-notificationpreferencesprovider-revision)
   - 8.5 [HelpSafetyProvider](#85-helpsafetyprovider)
9. [UI/UX Specification](#9-uiux-specification)
   - 9.1 [Craving Toolkit Screen Map](#91-craving-toolkit-screen-map)
   - 9.2 [Relapse Prevention Screen Map](#92-relapse-prevention-screen-map)
   - 9.3 [Component Library Additions](#93-component-library-additions)
   - 9.4 [Accessibility Requirements](#94-accessibility-requirements)
10. [Implementation Sequence](#10-implementation-sequence)
11. [File-Level Change Matrix](#11-file-level-change-matrix)
12. [Acceptance Criteria Checklist](#12-acceptance-criteria-checklist)

---

## 1. Executive Summary

The current codebase implements a functional skeleton for both the craving toolkit (interventions) and relapse prevention features, but diverges significantly from SRS v2.0 in critical areas. This document defines a developer-ready, phased enhancement plan covering:

- **Craving Toolkit** — Complete exercise catalogue with animated offline-safe breathing, grounding, CBT, urge surfing, and journaling. Mode-specific content filtering, favorites, recents, post-exercise feedback, and usage analytics wired to the weekly summary.
- **Notification System** — Full adaptive engine with permission flow compliant to Android 13+ and iOS, quiet hours, per-type toggles, high-risk hour detection, and shamefree content verification.
- **Relapse Prevention** — SRS-compliant multi-step lapse recovery flow (not a one-screen modal), custom relapse plan builder with drag-and-drop, panic mode with navigation to real toolkit screens, emergency contacts with phone-call deep-link, and a Help/Safety screen accessible without authentication.

**Architectural constraints** remain unchanged from the predecessor plan:
- **Database:** Isar (no Hive)
- **State management:** Riverpod `StateNotifier` + `FutureProvider` + `AsyncNotifier` (no BLoC)
- **Architecture:** Clean Architecture — Domain → Data → Presentation; domain layer has zero Flutter dependencies
- **Offline-only:** Zero outbound network requests in baseline release (NFR-01)

---

## 2. Current State Analysis

### 2.1 Interventions — What Exists

#### Notification System

| File | Role | Status |
|------|------|--------|
| `notification_models.dart` | Isar collections + enums | ⚠️ Partially correct — `NotificationPreferences` defaults `frequency` to `NotificationFrequency.low` instead of `medium` (SRS default); quiet-hours logic inverted edge case |
| `notification_models.g.dart` | Generated Isar accessors | ✅ Generated correctly from current model |
| `notification_content.dart` | Static template library | ⚠️ Missing mode-specific templates (smoking vs. reduction); some templates reference `{money}` interpolation key without fallback; milestone templates duplicated |
| `notification_repository.dart` | Data layer | ⚠️ `markOpened()` uses title+time filter for history mirror — fragile, should use notification ID |
| `notification_provider.dart` | Riverpod providers | ⚠️ `NotificationPreferencesNotifier._update()` rebuilds entire schedule on every single preference toggle — expensive; `currentUserIdProvider` referenced but not defined in this file |
| `notifications_permissions_banner.dart` | UI banner | ⚠️ `_checkPermission()` calls `manager.hasPermissions()` which always returns `true` for iOS — banner never shows on iOS |
| `notifications_settings_screen.dart` | Settings UI | ⚠️ `DropdownButton` inside `ListTile` — overflow risk on small screens per SRS pitfall §13.4 Pitfall 1; `DropdownButtonFormField` does not use `initialValue` field correctly in Flutter 3.x |
| `notifications_history_screen.dart` | History UI | ✅ Functional, minor styling gaps |
| `notification_manager.dart` | Facade | ⚠️ `scheduleAll` cancels ALL pending platform notifications before rescheduling — cancels notifications for the same day already shown; should only cancel *future* notifications |
| `notification_scheduler_service.dart` | Scheduling engine | ⚠️ `_selectTypes()` casts `stats` as `dynamic` — type-unsafe; `_highRiskHours()` returns a `Future` inside a scheduled loop causing potential deadlock on cold start; milestone check `_isMilestoneDay()` queries `stats.currentStreak` which may not be loaded yet |
| `push_notification_service.dart` | Platform wrapper | ⚠️ `hasPermission()` returns `true` for iOS unconditionally; `_onBackgroundTap` stores nothing — background taps are silently dropped |

#### Craving Toolkit

| File | Role | Status |
|------|------|--------|
| `toolkit_models.dart` | Isar + enums | ⚠️ `BreathingPattern`, `GroundingExercise`, `CbtTechnique` enums exist but no `ToolkitExercise` or `ToolkitSession` Isar collection — usage data cannot be persisted |
| `craving_toolkit_screen.dart` | Main toolkit UI | ⚠️ No favorites section; no recent exercises; no mode filtering; no duration estimates; exercise list is hardcoded, not driven by repository |
| `breathing_exercise_screen.dart` | Breathing UI | ⚠️ `AnimationController` correctly uses `SingleTickerProviderStateMixin`; however animation ignores the 4-7-8 timing in `relaxing` pattern — all patterns use the same 4-4-4 timing |
| `grounding_exercise_screen.dart` | Grounding UI | ⚠️ `fiveSenses` exercise is static text — no step-by-step guided flow; no timer |
| `cbt_technique_screen.dart` | CBT UI | ⚠️ Static content only — no interactive prompts, no journaling integration |
| `distraction_exercise_screen.dart` | Distraction UI | ⚠️ File referenced in router but not visible in provided codebase — assumed stub |

### 2.2 Relapse Prevention — What Exists

| File | Role | Status |
|------|------|--------|
| `relapse_models.dart` | Isar collections | ⚠️ `PanicStep` is `@embedded` but has derived getter `displayOrder` which Isar cannot store as computed — must be a plain field (already is); `RelapsePlan.ensureThreePanicSteps()` mutates internal list without Isar transaction — data not persisted until `updatePlan` is explicitly called |
| `relapse_models.g.dart` | Generated | ✅ Generated correctly |
| `relapse_repository.dart` | Data layer | ⚠️ `getPlanFresh()` is separate from `getOrCreatePlan()` leading to double database reads on every provider load; `updatePanicSteps()` creates `new PanicStep` instances (correct workaround for Isar embedded mutation bug) but comment in code is the only documentation of why |
| `relapse_provider.dart` | Riverpod providers | ⚠️ `relapseNotifierProvider` uses `StateNotifierProvider` with inline `userIdAsync.when()` — returns a dead `RelapseNotifier(repository, '')` during loading, causing `_loadData()` to silently fail with empty userId; `relapsePlanProvider` is a `FutureProvider.autoDispose` but `relapseNotifierProvider` is `StateNotifierProvider.autoDispose` — they are not synchronized; invalidating one does not invalidate the other |
| `panic_mode_screen.dart` | Panic UI | ⚠️ Missing the "Take a breath" guided entry animation; `_callEmergencyContact()` with `contactId == null` opens a dialog — correct pattern, but contact list is loaded via `ref.read(contactsWithPhoneProvider.future)` inside a non-async method wrapper — potential unhandled Future |
| `panic_button.dart` | Floating button | ⚠️ `AnimationController` animation runs indefinitely even when screen is not visible — wastes battery; should use `WidgetsBindingObserver` to pause |
| `edit_panic_steps_screen.dart` | Step editor | ⚠️ `_loadSteps()` calls `ref.invalidate(relapsePlanProvider)` then immediately `ref.read(relapsePlanProvider.future)` — race condition; the invalidate triggers async rebuild but read may return stale cached data |
| `relapse_plan_screen.dart` | Plan UI | ⚠️ `_showEditCustomStepsDialog()` rebuilds the dialog by calling `Navigator.pop` + re-pushing — causes flicker and loses scroll position |
| `contact_card.dart` | Contact UI | ✅ Functionally correct |
| `panic_step_card.dart` | Panic step UI | ✅ Functionally correct |

### 2.3 Critical Violations Summary

| SRS Reference | Violation | Priority |
|---------------|-----------|----------|
| FR-T01 | Toolkit not accessible in under 2 taps from all screens | MUST fix |
| FR-T02 | Journaling and relapse-recovery planning exercises missing | MUST fix |
| FR-T03 | No mode-specific content filtering in toolkit | MUST fix |
| FR-T04 | No favorites or recents system | SHOULD fix |
| FR-T05 | Toolkit usage not recorded with timestamp + exerciseId | MUST fix |
| FR-T06 | No duration estimate visible before starting exercise | SHOULD fix |
| FR-T07 | Breathing animation timing incorrect for 4-7-8 pattern | MUST fix |
| FR-T08 | Journaling not wired to Isar storage | MUST fix |
| FR-N01 | Platform notifications only — PASS | ✅ |
| FR-N02 | Daily check-in, lapse recovery, streak celebration — partially missing | MUST fix |
| FR-N05 | Quiet hours not respected in scheduler (edge case) | MUST fix |
| FR-N07 | Permission requested at wrong lifecycle moment | MUST fix |
| FR-C09 | Help/Safety screen missing (offline crisis resources) | MUST fix |
| Section 15 | Help screen not accessible without authentication | MUST fix |
| BR-08 | Panic button animation wastes battery | SHOULD fix |
| BR-09 | Notification shame-language audit not implemented | MUST fix |
| NFR-04 | Toolkit must work fully offline — currently does, maintain this | ✅ |

---

## 3. SRS Compliance Gaps

### 3.1 Craving Toolkit Gaps

```
SRS §7.4 FR-T02 → Missing exercises:
                    - Delay-and-distract (currently a screen name but not a real implementation)
                    - Cognitive reframing (fully missing)
                    - Relapse-recovery planning (fully missing — separate from the panic flow)
                    - Journaling (UI stub exists, not wired to Isar)
                    Minimum required: 7 exercise types (currently 4 complete, 3 stubs)

SRS §7.4 FR-T03 → No mode-specific content:
                    - Smoking mode should show nicotine-withdrawal specific wording
                    - Reduction mode should show sexual-urge specific wording
                    - Urge surfing has single shared copy — must branch per mode

SRS §7.4 FR-T04 → Favorites:
                    - No heart/star icon on exercise cards
                    - No favorites section at top of toolkit list
                    - Not persisted across sessions

SRS §7.4 FR-T05 → Usage logging:
                    - No ToolkitSession or ToolkitUsage record written after exercise
                    - Weekly summary cannot reference "which exercises you used most"

SRS §7.4 FR-T06 → Duration estimates:
                    - Not visible on exercise cards before user taps in

SRS §7.4 FR-T07 → Breathing animation timing:
                    - relaxing pattern (4-7-8) uses wrong durations
                    - calm pattern uses wrong durations
                    - Visual label ("Hold" vs "Exhale") not synchronized with animation phase

SRS §7.4 FR-T08 → Journaling:
                    - JournalEntry Isar model is defined in isar_service.dart registration
                      but no JournalEntryModel class file exists in the codebase
                    - No journal list screen
                    - No mood tag support
```

### 3.2 Notification System Gaps

```
SRS §7.5 FR-N02 → Missing notification categories:
                    - Scheduled practice reminders (user-defined time)
                    - Lapse recovery prompt (scheduled 3h post-lapse) — defined in
                      notification_scheduler_service but never called from lapse flow
                    - Streak celebration — milestone notifications only fire on streak
                      milestone event hook; not called anywhere from tracking feature

SRS §7.5 FR-N03 → Smoking-specific gaps:
                    - Quit-date preparation (T-3 days, T-1 day) not implemented
                    - Pre-meal/post-meal reminders not implemented

SRS §7.5 FR-N04 → Reduction-specific gaps:
                    - Bedtime trigger-avoidance reminder not implemented
                    - Time-reclaimed feedback notification not implemented

SRS §7.5 FR-N05 → Quiet hours edge case:
                    - NotificationPreferences.isInQuietHours() inverts logic for
                      same-day ranges (e.g., 09:00–17:00 quiet hours)
                    - Overnight ranges (22:00–08:00) work correctly

SRS §7.5 FR-N06 → Shame-language audit:
                    - No automated content review mechanism
                    - notification_content.dart templates not audited against banned phrases

SRS §7.5 FR-N07 → Permission timing:
                    - Current banner shows on cold start if permission missing
                    - SRS requires: request after first log event or at day 2 opener
                    - iOS: requestPermissions called during app.dart bootstrap,
                      not after first user action
```

### 3.3 Relapse Prevention Gaps

```
SRS §8.4         → Lapse Recovery Flow:
                    - LapseRecoveryScreen does not exist as defined in tracking enhancement plan
                    - Current panic_mode_screen is an emergency tool, not the post-lapse flow
                    - SRS requires: "This is a data point, not a failure" message
                    - Three options: identify trigger → open toolkit → read recovery guide
                    - Streak handling: currentStreak → 0, longestStreak preserved,
                      recoveryCount +1 (these are in Statistics but not surfaced in UI)

SRS §15          → Help/Safety Screen:
                    - No dedicated Help/Safety screen exists
                    - Must be accessible without authentication (even if privacy lock active)
                    - Must contain: user-configurable local emergency contact,
                      international crisis helplines (static, offline), and disclaimer
                    - Cannot make network requests

SRS §7.4 FR-T02  → Relapse-recovery planning exercise:
                    - This is a TOOLKIT exercise distinct from the panic mode screen
                    - Should guide user through writing their personal recovery plan
                    - Offline static content + journaling integration

SRS §4.2 BR-08   → Gamification must not trivialize relapse events:
                    - Current panic button uses pulsing animation on home screen
                      which draws attention in a gamified way to relapse as "emergency"
                    - Must be reframed as calm, accessible support

SRS §4.2 BR-09   → Notification content review:
                    - All notification copy must be reviewed for shame-free language
                    - No automated enforcement mechanism exists
```

---

## 4. Craving Toolkit — Enhancement Plan

### 4.1 Architecture Redesign

The current toolkit uses hardcoded lists and has no persistence layer for exercises or usage. The redesigned architecture introduces:

```
Presentation Layer
├── CravingToolkitScreen         ← Entry point (full-screen modal, <1s open)
│   ├── FavoritesSection         ← Top section, populated from Isar
│   ├── RecentSection            ← Last 3 used exercises
│   └── ExerciseCatalogueSection ← Full list, mode-filtered, with duration chips
├── ExerciseDetailScreen         ← Base wrapper with duration + description
│   ├── BreathingExerciseScreen  ← AnimationController driven, offline
│   ├── GroundingExerciseScreen  ← Stepped guided flow
│   ├── UrgeSurfingScreen        ← Mode-specific wording
│   ├── CbtTechniqueScreen       ← Interactive prompt + optional journal
│   ├── DelayDistractScreen      ← Mode-specific suggestions list
│   ├── CognitiveReframingScreen ← Guided reframe worksheet
│   ├── RelapseRecoveryPlanScreen← Toolkit exercise (≠ panic mode)
│   └── JournalEntryScreen       ← Freeform text + mood tag + Isar write
└── PostExerciseFeedbackSheet    ← "Did this help?" bottom sheet

Domain Layer
├── ToolkitExercise              ← Pure Dart entity
├── ToolkitSession               ← Pure Dart entity
├── JournalEntry                 ← Pure Dart entity
├── IToolkitRepository           ← Abstract interface
└── IToolkitUseCases
    ├── GetExercisesForModeUseCase
    ├── ToggleFavoriteUseCase
    ├── RecordSessionUseCase
    └── GetRecentExercisesUseCase

Data Layer
├── ToolkitExerciseModel         ← Isar @collection
├── ToolkitSessionModel          ← Isar @collection (new)
├── JournalEntryModel            ← Isar @collection (new)
└── ToolkitRepositoryImpl
```

**Key design decisions:**

1. **Exercise catalogue is seeded on first run** from a static Dart constant list, written to Isar `ToolkitExercise` boxes. This allows future schema additions without migration complexity.
2. **`isFavorite` and `lastUsedAt`** are stored on the `ToolkitExercise` record — never on a separate join table. Toggle is a single `put()`.
3. **`ToolkitSession`** records are append-only. They capture: `exerciseId`, `startedAt`, `completedAt` (null if abandoned), `feedbackRating` (null until post-exercise sheet), `mode`, `userId`. This feeds the weekly summary.
4. **`JournalEntry`** is an independent collection — not embedded in `ToolkitSession`. A session can optionally reference a journalEntryId.

### 4.2 Exercise Data Model

**Domain Entity:**

```dart
// lib/features/craving_toolkit/domain/entities/toolkit_exercise.dart

class ToolkitExercise {
  final String id;               // UUID, stable across installs
  final String name;
  final ExerciseCategory category;
  final int durationEstimateSeconds;  // shown before starting
  final bool isSharedBothModes;
  final GoalType? modeFilter;    // null = shared; GoalType.quitSmoking or .reduceMasturbation
  final bool isFavorite;
  final DateTime? lastUsedAt;
  final String shortDescription;    // shown on card
  final String fullInstructions;    // shown in detail screen
  final String? modeSpecificNote;   // appended for mode-specific wording

  const ToolkitExercise({ ... });
}

enum ExerciseCategory {
  breathing,
  grounding,
  urgeSurfing,
  delayAndDistract,
  cognitiveReframing,
  journaling,
  relapseRecoveryPlanning,
}
```

**Isar Collection (`ToolkitExerciseModel`):**

All fields mapped 1-to-1 with domain entity. `modeFilter` stored as `String?` (enum name). `isFavorite` is a plain `bool` field updated via `put()` in a write transaction. The `@Index()` on `isFavorite` allows efficient query for favorites list. `@Index()` on `lastUsedAt` supports "last 3 used" query.

```dart
@collection
class ToolkitExerciseModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String exerciseId;        // stable UUID string

  late String name;
  late String category;          // ExerciseCategory.name

  @Index()
  late bool isFavorite;

  @Index()
  DateTime? lastUsedAt;

  late int durationEstimateSeconds;
  late bool isSharedBothModes;
  String? modeFilter;
  late String shortDescription;
  late String fullInstructions;
  String? modeSpecificNote;
}
```

### 4.3 Toolkit Screen Hierarchy

The `CravingToolkitScreen` must open in under 1 second from any screen (FR-T01). It is pushed as a full-screen `MaterialPageRoute`. It does NOT use a bottom sheet itself — exercises open as sub-routes.

**Navigation entry points:**
- Dashboard FAB "I need help now" → `CravingToolkitScreen`
- Log screen persistent button → `CravingToolkitScreen`
- Lapse recovery flow "Open the Craving Toolkit" option → `CravingToolkitScreen`
- Panic mode step with `PanicActionType.breathing/grounding/cbt` → respective exercise screen directly (skips toolkit home)

**`CravingToolkitScreen` layout:**

```
AppBar: "Craving Toolkit" | Back button
│
├── [IF favorites exist]
│   Section header: "Your Favorites"
│   HorizontalScrollRow of ExerciseChips (icon + name + duration)
│
├── [IF recents exist]
│   Section header: "Recently Used"
│   ExerciseCard ×3 max (compact, with "Repeat" button)
│
└── Section header: "All Exercises"
    ListView of ExerciseCards (mode-filtered)
    Each card shows:
      - Category icon
      - Name
      - Duration chip (e.g., "3 min")
      - Mode badge (optional — only if mode-exclusive)
      - Favorite toggle (heart icon, no confirmation needed)
```

**`ExerciseCard` tap → `ExerciseDetailScreen`:**

```
AppBar: Exercise name | Favorite toggle icon
│
├── Hero image / animated icon (SVG, no GIF/video)
├── Duration chip
├── Short description
├── Mode-specific note (if applicable)
└── "Start" button → exercise screen
```

This two-step entry (card → detail → exercise) is acceptable for deliberate browsing. The "Repeat" button on recent cards skips directly to the exercise screen.

### 4.4 Breathing Exercise Enhancement

**Current issue:** The `relaxing` (4-7-8) pattern uses the same 4-4-4 timing as `box`. The label is also wrong — it shows "Hold" when it should show "Exhale".

**Fix:** `BreathingPhase` enum drives phase label, duration, and color independently.

```dart
// lib/features/craving_toolkit/domain/entities/breathing_pattern.dart

enum BreathingPattern { box, relaxing, energizing, calm }

class BreathingPhase {
  final String label;          // "Inhale", "Hold", "Exhale", "Rest"
  final int durationSeconds;
  final Color color;           // accent color feedback during phase
}

const Map<BreathingPattern, List<BreathingPhase>> kBreathingPatterns = {
  BreathingPattern.box: [
    BreathingPhase(label: 'Inhale',  durationSeconds: 4,  color: Color(0xFF6C63FF)),
    BreathingPhase(label: 'Hold',    durationSeconds: 4,  color: Color(0xFF4CAF50)),
    BreathingPhase(label: 'Exhale',  durationSeconds: 4,  color: Color(0xFF5B8FD6)),
    BreathingPhase(label: 'Hold',    durationSeconds: 4,  color: Color(0xFF4FC28E)),
  ],
  BreathingPattern.relaxing: [
    BreathingPhase(label: 'Inhale',  durationSeconds: 4,  color: Color(0xFF6C63FF)),
    BreathingPhase(label: 'Hold',    durationSeconds: 7,  color: Color(0xFF4CAF50)),
    BreathingPhase(label: 'Exhale',  durationSeconds: 8,  color: Color(0xFF5B8FD6)),
  ],
  BreathingPattern.energizing: [
    BreathingPhase(label: 'Inhale',  durationSeconds: 6,  color: Color(0xFF6C63FF)),
    BreathingPhase(label: 'Exhale',  durationSeconds: 2,  color: Color(0xFF5B8FD6)),
  ],
  BreathingPattern.calm: [
    BreathingPhase(label: 'Inhale',  durationSeconds: 4,  color: Color(0xFF6C63FF)),
    BreathingPhase(label: 'Exhale',  durationSeconds: 6,  color: Color(0xFF5B8FD6)),
  ],
};
```

**Animation architecture:**

One `AnimationController` per phase, chained via `addStatusListener`. The outer widget uses `SingleTickerProviderStateMixin`. The circle grows on inhale, stays full on hold, shrinks on exhale. Color lerps between phase colors using a `ColorTween`.

```dart
class BreathingExerciseScreen extends StatefulWidget {
  final BreathingPattern pattern;
  final int cycles;  // default 4
  ...
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _phaseController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  int _currentPhaseIndex = 0;
  int _currentCycle = 0;
  List<BreathingPhase> get _phases => kBreathingPatterns[widget.pattern]!;

  @override
  void initState() {
    super.initState();
    _initPhase(0);
  }

  void _initPhase(int phaseIndex) {
    final phase = _phases[phaseIndex];
    _phaseController = AnimationController(
      vsync: this,
      duration: Duration(seconds: phase.durationSeconds),
    );
    // ... build sizeAnimation and colorAnimation
    _phaseController.addStatusListener(_onPhaseComplete);
    _phaseController.forward();
  }

  void _onPhaseComplete(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    _phaseController.dispose();

    final nextPhase = (_currentPhaseIndex + 1) % _phases.length;
    if (nextPhase == 0) {
      _currentCycle++;
      if (_currentCycle >= widget.cycles) {
        _onExerciseComplete();
        return;
      }
    }
    _currentPhaseIndex = nextPhase;
    setState(() {});
    _initPhase(_currentPhaseIndex);
  }

  @override
  void dispose() {
    _phaseController.dispose();   // SRS Pitfall 10
    super.dispose();
  }
}
```

**Phase label display:** Centered below the circle. Phase label updates via `setState` on phase transition. No `AnimatedSwitcher` needed — plain `Text` replacement.

**Cycle counter:** Small subtitle "Cycle 2 of 4" above the circle. No progress bar.

**Early exit button:** "Skip" in the top-right of the AppBar. Tapping marks the session as abandoned (no `completedAt`) and opens the `PostExerciseFeedbackSheet`.

### 4.5 Grounding Exercise Enhancement

The current implementation shows static text for the 5-4-3-2-1 exercise. The enhancement introduces a stepped guided flow.

**`GroundingExerciseScreen` state machine:**

```
GroundingExercise.fiveSenses:
  Step 0 (intro)  : "Let's anchor you to the present moment."
  Step 1          : "Name 5 things you can SEE right now." → TextField
  Step 2          : "Touch 4 things near you." → Tap-counter or TextField
  Step 3          : "Listen for 3 sounds." → TextField
  Step 4          : "Notice 2 things you can smell." → TextField
  Step 5          : "Find 1 thing you can taste." → TextField
  Step 6 (close)  : Completion screen with affirmation

GroundingExercise.bodyAwareness:
  Step 0 (intro)  : "We'll do a slow scan from head to toe."
  Steps 1–7       : Body region prompts ("Notice your feet. Are they warm?")
                    Each step has a 15-second timer, skippable.

GroundingExercise.objectFocus:
  Step 0 (intro)  : "Pick any object within arm's reach."
  Steps 1–5       : Sensory observation prompts (colour, weight, texture, temp, sound)

GroundingExercise.counting:
  Timer + prompt  : "Count backwards from 100 in steps of 7." Display running count.
  Stop button     : Finishes exercise.

GroundingExercise.coldWater:
  Instruction screen only (no timer). Prompts: splash, hold, breathe.
  "Done" button → completion.
```

**Implementation rules:**
- All text user enters in grounding steps is **NOT persisted** unless the user explicitly taps "Save to Journal" on the completion screen.
- `PageController` drives step navigation. `PageView` with `NeverScrollableScrollPhysics` (user cannot swipe — must tap Next).
- Each step has a "Next" button and a "Skip this step" text button.
- Progress indicator: `LinearProgressIndicator` at top (value = currentStep / totalSteps).

### 4.6 CBT Technique Enhancement

The current CBT screen is a static content display. The enhancement adds interactive prompts and optional journaling.

**Per-technique interactive structure:**

```
CbtTechnique.urgeSurfing:
  Screen 1: Instructions ("Urges are like waves. Let's ride it out.")
  Screen 2: Timer (5 min countdown, cancellable)
            Prompt: "Notice where you feel the urge in your body."
  Screen 3: Reflection prompt (optional)
            "Did the urge change during the exercise?"
            Options: [Got stronger] [Stayed same] [Got weaker] [Passed]
  Screen 4: Completion + optional "Write about it" → JournalEntryScreen

CbtTechnique.thoughtChallenge:
  Screen 1: Instruction + example
  Screen 2: Input prompt: "What thought are you having right now?"
            → TextField (saved only if user taps Save to Journal)
  Screen 3: Challenge prompt: "What's the evidence FOR this thought?"
            → TextField
  Screen 4: Challenge prompt: "What's a more balanced way to see this?"
            → TextField
  Screen 5: Completion + optional journal save

CbtTechnique.consequenceAnalysis:
  Screen 1: Instructions
  Screen 2: Short-term vs long-term comparison table (visual, editable)
  Screen 3: Completion

CbtTechnique.delayTactic:
  Screen 1: "Let's delay. Set a timer and then decide."
            Stepper: 5, 10, 15, 20 minutes
  Screen 2: Countdown timer with motivational message
  Screen 3: Completion check-in: "How do you feel now?"

CbtTechnique.alternativeBehavior:
  Screen 1: Mode-specific suggestion list
            → Smoking: "Chew gum, drink water, go for a walk, call a friend"
            → Reduction: "Go for a walk, call a friend, do 10 push-ups, read a book"
  Screen 2: Completion + optional log
```

**State management:** Each CBT technique uses local `StatefulWidget` state for step index and text controller values. No Riverpod needed until journal save — at that point, the `JournalNotifier` is called once.

### 4.7 Journaling Feature

The journal is a first-class feature. It must have:
- A dedicated list screen accessible from Progress tab and Toolkit
- A create/edit screen with freeform text and mood tag
- Isar persistence with AES encryption (via existing `IsarService` encrypted box)
- Read from toolkit exercises ("Save to Journal" CTA)

**`JournalEntry` domain entity:**

```dart
class JournalEntry {
  final String id;            // UUID
  final String userId;
  final DateTime createdAt;   // UTC
  final DateTime? updatedAt;
  final String content;
  final MoodTag? moodTag;
  final String? sourceExerciseId;  // if created from toolkit
  final String? sourceExerciseName;
}

enum MoodTag {
  calm,
  anxious,
  hopeful,
  struggling,
  proud,
  neutral;

  String get label => switch (this) {
    MoodTag.calm       => 'Calm',
    MoodTag.anxious    => 'Anxious',
    MoodTag.hopeful    => 'Hopeful',
    MoodTag.struggling => 'Struggling',
    MoodTag.proud      => 'Proud',
    MoodTag.neutral    => 'Neutral',
  };

  String get emoji => switch (this) {
    MoodTag.calm       => '😌',
    MoodTag.anxious    => '😟',
    MoodTag.hopeful    => '🌱',
    MoodTag.struggling => '😓',
    MoodTag.proud      => '🌟',
    MoodTag.neutral    => '😐',
  };
}
```

**`JournalEntryScreen` UX:**
- Full-screen route pushed from either Toolkit or Progress tab
- `TextField` with `maxLines: null` (expands), `resizeToAvoidBottomInset: true`, `SingleChildScrollView` wrapper (SRS Pitfall 8)
- Mood tag row: horizontal `Wrap` of `FilterChip` widgets (select one)
- Save button: top-right AppBar action — writes to Isar and pops
- Auto-save every 30 seconds via `Timer.periodic` to prevent data loss

**Journal list screen:**
- `ListView.builder` (not `Column` with `map`) for performance (SRS Pitfall 11)
- Filter by mood tag via `FilterChip` row at top
- Tap to edit
- Long-press → delete confirmation dialog

### 4.8 Urge Surfing Exercise

This exercise has mode-specific wording. It must be implemented as a dedicated screen.

**Structure:**

```
Title: "Urge Surfing"
Mode badge: "For [Smoking / Habit Reduction]"
Duration: "5–10 min"

Introduction:
  [Smoking]   "Nicotine cravings typically peak within 3–5 minutes.
               You don't need to fight it — just observe it."
  [Reduction] "Urges follow the same wave pattern. They rise, peak,
               and fall. You are not the urge."

Timer: Large countdown (user-set: 3, 5, or 10 minutes)

Prompts (shown at 33%, 66%, 100% of timer):
  33%: "Where do you feel the urge in your body? Just notice."
  66%: "The wave is peaking. You're still here. You're in control."
  100%: "Well done. The wave has passed."

Completion screen:
  "Did the urge pass?"
  → [Yes, completely] [Reduced] [Still present] [I gave in — log it]
  The "I gave in" option opens the lapse logging flow.
```

### 4.9 Mode-Specific Content Filtering

**Filter logic** lives in the domain layer, not the UI:

```dart
// lib/features/craving_toolkit/domain/usecases/get_exercises_for_mode_usecase.dart

class GetExercisesForModeUseCase {
  final IToolkitRepository _repository;

  Future<List<ToolkitExercise>> execute(GoalType mode) async {
    final all = await _repository.getAllExercises();
    return all.where((e) {
      // Include if shared, OR if mode-specific for this mode
      return e.isSharedBothModes || e.modeFilter == mode;
    }).toList();
  }
}
```

**Catalogue seeding** on first run maps each exercise to its mode filter:

| Exercise | Shared | Smoking-only | Reduction-only |
|----------|--------|--------------|----------------|
| Box Breathing | ✅ | | |
| 4-7-8 Relaxing | ✅ | | |
| 5-4-3-2-1 Grounding | ✅ | | |
| Urge Surfing (smoking wording) | | ✅ | |
| Urge Surfing (reduction wording) | | | ✅ |
| Delay & Distract (oral substitutes) | | ✅ | |
| Delay & Distract (physical activity) | | | ✅ |
| Cognitive Reframing (smoke-free identity) | | ✅ | |
| Cognitive Reframing (self-control + values) | | | ✅ |
| Journaling | ✅ | | |
| Relapse Recovery Planning | ✅ | | |
| Nicotine Withdrawal Education | | ✅ | |
| Stimulus Control (smoke-free home) | | ✅ | |
| Stimulus Control (device-free bedroom) | | | ✅ |
| Shame-Neutral Recommitment | ✅ | | |
| Body Scan Grounding | ✅ | | |

### 4.10 Favorites & Recents System

**Favorites:**
- `isFavorite` stored on `ToolkitExerciseModel`
- Toggle calls `ToolkitRepositoryImpl.toggleFavorite(exerciseId)` → `isar.writeTxn(() => isar.toolkitExerciseModels.put(model..isFavorite = !model.isFavorite))`
- `CravingToolkitScreen` watches `favoritesProvider = StreamProvider` that queries `isar.toolkitExerciseModels.filter().isFavoriteEqualTo(true).watch()`
- **No confirmation dialog** on toggle — instant, reversible

**Recents:**
- `lastUsedAt` field updated when a session is started (not completed — to handle abandoned exercises)
- `recentsProvider` queries `isar.toolkitExerciseModels.filter().lastUsedAtIsNotNull().sortByLastUsedAtDesc().limit(3).findAll()`
- "Repeat" button on recent card calls `_navigateToExercise(exercise)` — skips detail screen

### 4.11 Post-Exercise Feedback Loop

After every completed exercise (and on early exit), a bottom sheet appears:

```dart
class PostExerciseFeedbackSheet extends StatelessWidget {
  final String exerciseId;
  final bool wasCompleted;  // false = abandoned

  // Shows:
  //   Title: "Did this help?" (completed) or "How was that?" (abandoned)
  //   Three options:
  //     [Yes, it helped 😊]
  //     [Somewhat 🤷]
  //     [Not really 😕]
  //   Subtext: "Your feedback helps personalize your toolkit."
  //   Dismiss: "Skip" text button
}
```

**Data flow:**
1. User taps option → `ToolkitNotifier.recordFeedback(sessionId, rating)`
2. `ToolkitRepositoryImpl` updates `ToolkitSessionModel.feedbackRating` field
3. Bottom sheet pops
4. If `wasCompleted == false` AND user said "Not really" → offer "Try a different exercise?" CTA

**Storage:**

```
FeedbackRating enum { helped, somewhat, notReally }
// Stored as int (0, 1, 2) on ToolkitSessionModel
```

### 4.12 Toolkit Usage Tracking

Every exercise start writes a `ToolkitSessionModel` record:

```dart
// Called at: exercise screen initState
await toolkitRepository.startSession(
  exerciseId: exercise.id,
  userId: userId,
  mode: currentMode,
);
```

Every exercise complete/abandon writes `completedAt`:

```dart
// Called at: completion screen or early exit
await toolkitRepository.endSession(
  sessionId: session.id,
  completedAt: DateTime.now().toUtc(),
  wasCompleted: true,
);
```

**Weekly summary integration:** `StatisticsCalculator` queries `ToolkitSessionModel` for the past 7 days and returns:
- `mostUsedExercise: String` (exercise name)
- `totalSessionsThisWeek: int`
- `averageSessionDurationSeconds: int`
- `exercisesUsed: List<String>` (unique exercise names)

This data surfaces in the weekly review screen and in the `progressUpdate` notification template.

---

## 5. Notification System — Enhancement Plan

### 5.1 Architecture Overview

The existing notification architecture is largely correct in structure but has several bugs and gaps. The enhancements focus on:

1. **Bug fixes** in scheduling, permission, and quiet hours logic
2. **New notification types** for smoking/reduction mode specifics
3. **Permission timing** aligned with SRS FR-N07
4. **Content validation** mechanism

The layered architecture is retained:

```
Presentation:  NotificationSettingsScreen · NotificationPermissionBanner
                └── NotificationPreferencesNotifier (AsyncNotifier)
Domain:        NotificationSchedulerService (enhanced)
               NotificationManager (facade, minimal changes)
Data:          NotificationRepository · PushNotificationService
               NotificationContent (static templates, expanded)
               NotificationPreferences (Isar, revised defaults)
```

### 5.2 Permission Flow Redesign

**Current problem:** iOS calls `requestPermissions()` during `app.dart` `_initNotifications()` bootstrap — this fires on every cold start, even if the user already denied. Android banner shows on startup instead of post-first-log.

**SRS requirement (FR-N07):** Request notification permission at an appropriate moment post-onboarding — after first log event or at day 2 opener. Not on first launch.

**Revised flow:**

```
App cold start
    ├── (first launch) → Onboarding flow → Dashboard
    │   ├── No permission banner shown
    │   ├── No permission request attempted
    │   └── After first LogEntry write → trigger permission request
    │       └── TrackingNotifier.logEvent() 
    │               calls NotificationManager.requestPermissionsIfAppropriate()
    │
    └── (subsequent launch, onboarded)
        ├── Day 1: No banner (user is new, don't overwhelm)
        └── Day 2+: NotificationPermissionBanner shown IF not already granted
```

**`requestPermissionsIfAppropriate()` logic:**

```dart
Future<void> requestPermissionsIfAppropriate(String userId) async {
  // Do not request if already granted
  if (await _push.hasPermission()) return;

  // Do not request if already denied and user dismissed
  final prefs = await _repo.getPreferences(userId);
  if (prefs.permissionDeniedAt != null) return;

  // Request
  final granted = await _push.requestPermissions();
  if (!granted) {
    // Record denial time so we don't ask again immediately
    prefs.permissionDeniedAt = DateTime.now().toUtc();
    await _repo.savePreferences(prefs);
  } else {
    await scheduleAll(userId);
  }
}
```

**`NotificationPreferences` new field:** `DateTime? permissionDeniedAt` — stored in Isar; if non-null and less than 7 days ago, do not show banner.

**iOS `PushNotificationService` fix:**

```dart
Future<bool> hasPermission() async {
  // Android
  final android = _plugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>();
  if (android != null) {
    return await android.areNotificationsEnabled() ?? false;
  }
  
  // iOS — use actual platform check, not unconditional true
  final ios = _plugin.resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>();
  if (ios != null) {
    // flutter_local_notifications does not expose iOS permission status check
    // directly. Use permission_handler package as supplement.
    // Return true as safe default only if no way to check.
    return true; // TODO: integrate permission_handler for accurate iOS check
  }
  return true;
}
```

> **Implementation note:** The accurate iOS permission check requires the `permission_handler` package (`^11.x`). Add to `pubspec.yaml` and use `Permission.notification.status` to check. This is the only accurate cross-platform approach until flutter_local_notifications exposes a check API.

### 5.3 Notification Scheduling Logic

**Bug: `cancelAll()` before reschedule cancels today's already-delivered notifications.**

The current `scheduleForNextDays()` calls `_push.cancelAll()` which cancels ALL platform pending notifications, including ones scheduled for today that haven't fired yet. The fix: cancel only notifications scheduled for tomorrow and beyond.

```dart
Future<void> _cancelFuture(String userId) async {
  final tomorrow = DateTime.now().add(const Duration(days: 1));
  final startOfTomorrow = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);

  final pending = await _repo.getPending(userId);
  final futureIds = pending
      .where((n) => n.scheduledTime.isAfter(startOfTomorrow))
      .map((n) => n.id)
      .toList();

  for (final id in futureIds) {
    await _push.cancel(id);
    await _repo.delete(id);
  }
}
```

Replace the `_push.cancelAll()` call in `scheduleForNextDays()` with `_cancelFuture(userId)`.

**Bug: `_highRiskHours()` is a Future called inside synchronous loop.**

The current code calls `await _highRiskHours(userId)` inside `schedulePreventive()` — this is fine as-is since `schedulePreventive` is itself async. However, it is called from `app.dart` without awaiting, so exceptions are swallowed. Fix: wrap in `try/catch` in the caller.

**Bug: `_isMilestoneDay()` reads `stats.currentStreak` as dynamic.**

Replace dynamic cast with typed parameter:

```dart
// Change signature from:
bool _isMilestoneDay(dynamic stats)

// To:
bool _isMilestoneDay(Statistics stats) =>
    _milestones.contains(stats.currentStreak);
```

The `StatisticsCalculator` return type must be the typed `Statistics` model from the tracking feature, not `dynamic`.

**Bug: Quiet hours `isInQuietHours()` inverted for same-day ranges.**

```dart
// Current (WRONG for same-day ranges like 09:00–17:00):
return quietHoursStart < quietHoursEnd
    ? h >= quietHoursStart && h < quietHoursEnd   // ← This is the ACTIVE hours range, not quiet
    : h >= quietHoursStart || h < quietHoursEnd;

// Correct:
bool isInQuietHours(DateTime time) {
  if (!quietHoursEnabled) return false;
  final h = time.hour;
  if (quietHoursStart == quietHoursEnd) return false; // no quiet hours
  if (quietHoursStart < quietHoursEnd) {
    // Quiet window within a single day (e.g., 22:00–22:00 edge case handled above)
    // e.g., quietHoursStart=22, quietHoursEnd=8 → overnight → this branch is NOT used
    // e.g., quietHoursStart=9, quietHoursEnd=17 → quiet during day
    return h >= quietHoursStart && h < quietHoursEnd;
  } else {
    // Overnight quiet window (e.g., start=22, end=8)
    return h >= quietHoursStart || h < quietHoursEnd;
  }
}
```

> **Clarification:** The common use case is overnight quiet hours (22:00–08:00 = "do not disturb at night"). The SRS default is `quietHoursStart = 22, quietHoursEnd = 8`. The existing code handles this correctly. The bug manifests only when a user sets an unusual same-day quiet range like 09:00–17:00.

### 5.4 Adaptive Notification Engine

**New notification types to add:**

**Smoking mode — Quit-date preparation (FR-N03):**

```dart
// Called from OnboardingNotifier when quitDate is set
Future<void> scheduleQuitDatePrep(String userId, DateTime quitDate) async {
  final prefs = await _repo.getPreferences(userId);
  if (!prefs.notificationsEnabled || !prefs.milestoneEnabled) return;

  final threeDaysBefore = quitDate.subtract(const Duration(days: 3));
  final oneDayBefore    = quitDate.subtract(const Duration(days: 1));

  if (threeDaysBefore.isAfter(DateTime.now())) {
    await _schedulePrep(userId, threeDaysBefore,
      title: '3 days until your quit date 🗓️',
      body:  'Getting ready? Remove cigarettes, tell a friend, prep your toolkit.',
      payload: 'type=quit_prep&days=3',
    );
  }

  if (oneDayBefore.isAfter(DateTime.now())) {
    await _schedulePrep(userId, oneDayBefore,
      title: 'Tomorrow is your quit day 🌟',
      body:  "You've got everything you need. We'll be here with you.",
      payload: 'type=quit_prep&days=1',
    );
  }
}
```

**Reduction mode — Bedtime trigger reminder (FR-N04):**

```dart
// Called from OnboardingNotifier when user reports bedtime as high-risk window
Future<void> scheduleBedtimeReminder(String userId, int bedtimeHour) async {
  // Schedule daily notification 30 min before bedtime
  final reminderHour = (bedtimeHour - 1).clamp(0, 23);
  // ... schedule as daily repeating notification
}
```

**Time-reclaimed feedback (FR-N04 for reduction):**

```dart
// New template in NotificationContent
static const NotificationTemplate _timeReclaimedFeedback = NotificationTemplate(
  type: NotificationType.progressUpdate,
  title: 'Time reclaimed this week ⏱️',
  body: "You've reclaimed approximately {hours} hours this week. That time is yours.",
  requiresUserData: true,
);
```

**`NotificationContent` additions:**

Add mode-specific template pools:

```dart
static const _smokingSpecific = [
  NotificationTemplate(
    type: NotificationType.healthFact,
    title: 'Your lungs are healing 🫁',
    body: 'Cilia in your airways are regrowing, clearing out toxins more effectively.',
  ),
  NotificationTemplate(
    type: NotificationType.cravingTip,
    title: 'Nicotine tip 💡',
    body: 'Nicotine withdrawal peaks at 48–72 hours. The hardest part may already be behind you.',
  ),
];

static const _reductionSpecific = [
  NotificationTemplate(
    type: NotificationType.encouragement,
    title: 'You chose your values today',
    body: 'Every moment of self-control is a vote for the person you want to be.',
  ),
  NotificationTemplate(
    type: NotificationType.cravingTip,
    title: 'Urge surfing reminder 🌊',
    body: 'Urges peak and pass within minutes. Open the toolkit for a guided exercise.',
  ),
];
```

**Adaptive type selection update:**

```dart
List<NotificationType> _selectTypes(
  NotificationPreferences prefs,
  Statistics stats,
  int count,
  GoalType mode,  // ← new parameter
) {
  // ... existing logic ...
  // Add mode-specific boost
  if (mode == GoalType.quitSmoking && prefs.healthFactsEnabled) {
    pool.add(NotificationType.healthFact);
    pool.add(NotificationType.healthFact); // higher weight for smoking
  }
  if (mode == GoalType.reduceMasturbation && prefs.encouragementEnabled) {
    pool.add(NotificationType.encouragement);
    pool.add(NotificationType.encouragement); // higher weight for reduction
  }
  // ...
}
```

### 5.5 Notification Content Audit

The SRS (BR-09, FR-N06, Section 15) requires all notification copy to be shame-free. Implement a static audit utility:

```dart
// lib/features/interventions/domain/services/content_audit_service.dart

class ContentAuditService {
  // Phrases that MUST NOT appear in any notification copy
  static const _bannedPhrases = [
    'failed',
    'failure',
    'weak',
    'pathetic',
    'addict',
    'disgusting',
    'shameful',
    'give up',
    'loser',
    'worthless',
    'you should be',
    'you must',
    'sin',
    'immoral',
    'dirty',
    'filthy',
    'wrong',
    'bad person',
    'broken',
    'relapsed again',
  ];

  /// Returns all violations found. Empty list = PASS.
  static List<ContentViolation> audit(List<NotificationTemplate> templates) {
    final violations = <ContentViolation>[];
    for (final template in templates) {
      for (final phrase in _bannedPhrases) {
        final lowerTitle = template.title.toLowerCase();
        final lowerBody  = template.body.toLowerCase();
        if (lowerTitle.contains(phrase)) {
          violations.add(ContentViolation(
            templateType: template.type,
            field: 'title',
            phrase: phrase,
            snippet: template.title,
          ));
        }
        if (lowerBody.contains(phrase)) {
          violations.add(ContentViolation(
            templateType: template.type,
            field: 'body',
            phrase: phrase,
            snippet: template.body,
          ));
        }
      }
    }
    return violations;
  }
}

class ContentViolation {
  final NotificationType templateType;
  final String field;
  final String phrase;
  final String snippet;
}
```

**Unit test (required as QA gate):**

```dart
// test/features/interventions/content_audit_test.dart

void main() {
  group('ContentAuditService', () {
    test('all notification templates pass shame-language audit', () {
      final allTemplates = [
        ...NotificationContent.allDailyCheckIns,
        ...NotificationContent.allEncouragement,
        ...NotificationContent.allMilestones,
        // ... all pools
      ];
      final violations = ContentAuditService.audit(allTemplates);
      expect(violations, isEmpty,
        reason: violations.map((v) => '${v.templateType}: "${v.phrase}" in ${v.field}').join('\n'));
    });
  });
}
```

This test is a **release gate** — CI must fail if violations exist.

### 5.6 Settings Integration

**`NotificationSettingsScreen` bug fixes:**

1. Replace `DropdownButton` inside `ListTile` with `ListTile` trailing `Text` + tap to open `showModalBottomSheet` with options. This avoids overflow issues on narrow screens.

2. Replace `_HourDropdown` implementation with a `showTimePicker` dialog:

```dart
// Replace _HourDropdown with:
Future<void> _pickHour(BuildContext context, int current, ValueChanged<int> onChanged) async {
  final picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: current, minute: 0),
    builder: (context, child) => MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
      child: child!,
    ),
  );
  if (picked != null) onChanged(picked.hour);
}
```

3. `NotificationPreferencesNotifier` must debounce the `scheduleAll` call. Currently, every single toggle triggers a full reschedule. Add a 2-second debounce:

```dart
Timer? _rescheduleDebounce;

Future<void> _update(void Function(NotificationPreferences) mutate) async {
  // ... mutate and update state ...
  
  _rescheduleDebounce?.cancel();
  _rescheduleDebounce = Timer(const Duration(seconds: 2), () async {
    final manager = await ref.read(notificationManagerProvider.future);
    await manager.savePreferences(current);
  });
}
```

---

## 6. Relapse Prevention — Enhancement Plan

### 6.1 Architecture Redesign

The current relapse prevention feature has correct models and repository but significant provider bugs and missing SRS-required screens.

**Revised feature structure:**

```
Presentation Layer
├── RelapsePlanScreen          ← Existing, refactored (TabBarView: Plan | Contacts)
├── PanicModeScreen            ← Existing, enhanced (calming entry animation)
├── EditPanicStepsScreen       ← Existing, race condition fixed
├── LapseRecoveryScreen        ← NEW — multi-step post-lapse flow (SRS §8.4)
├── HelpSafetyScreen           ← NEW — always accessible, no auth required (SRS §15)
├── RecoveryGuideScreen        ← NEW — mode-specific recovery article
└── Widgets:
    ├── PanicButton            ← Fix battery drain from continuous animation
    ├── PanicStepCard          ← Existing, minor fixes
    ├── ContactCard            ← Existing, functional
    └── LapseRecoveryOption    ← NEW — option card for lapse flow

Domain Layer
├── RelapsePlan                ← Existing entity
├── RelapseContact             ← Existing entity
├── LapseRecoverySession       ← NEW — tracks a single lapse recovery flow completion
├── IRelapseRepository         ← NEW — abstract interface
└── UseCases:
    ├── GetOrCreatePlanUseCase
    ├── UpdatePanicStepsUseCase
    ├── AddContactUseCase
    └── StartLapseRecoveryUseCase ← NEW

Data Layer
├── RelapsePlanModel           ← Existing Isar collection (minor additions)
├── RelapseContactModel        ← Existing Isar collection
├── LapseRecoverySessionModel  ← NEW Isar collection
└── RelapseRepositoryImpl      ← Existing, refactored
```

### 6.2 Relapse Plan Data Model

**Additions to `RelapsePlan` Isar model:**

The existing model is largely correct. Add one field:

```dart
@collection
class RelapsePlan {
  // ... all existing fields ...

  // NEW: user-written personal recovery guide (optional)
  String? personalRecoveryNote;

  // NEW: timestamp of last plan review
  DateTime? lastReviewedAt;
}
```

**New Isar model — `LapseRecoverySessionModel`:**

```dart
@collection
class LapseRecoverySessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  late DateTime startedAt;        // UTC
  DateTime? completedAt;          // null if abandoned mid-flow

  // Which step did user choose?
  @Enumerated(EnumType.name)
  late LapseRecoveryAction chosenAction;

  // Trigger selected (if any)
  List<String> selectedTriggers = [];

  // Did user open toolkit from this flow?
  bool openedToolkit = false;

  // Did user read the recovery guide?
  bool readRecoveryGuide = false;

  // Optional note logged during recovery
  String? recoveryNote;

  // Mode at time of lapse
  @Enumerated(EnumType.name)
  late GoalType mode;
}

enum LapseRecoveryAction {
  identifiedTrigger,
  openedToolkit,
  readRecoveryGuide,
  skipped,
}
```

### 6.3 Lapse Recovery Flow (Multi-Step)

This is a **new screen** required by SRS §8.4. It is NOT a replacement for panic mode. It appears after the user logs a lapse event.

**Trigger:** In `QuickLogSheet` (from the tracking enhancement), logging a `LogType.cigaretteSmoked` or `LogType.urgeEpisode` event pushes `LapseRecoveryScreen` as a full-screen route.

**Three-step state machine:**

```
Step 0 — Acknowledgment
  ─────────────────────────────
  Large centered message:
    "This is a data point, not a failure."
    "You noticed. That's the first step."

  Subtext:
    [Smoking]:   "Every smoke-free stretch you've had was real.
                  Let's use this moment to learn and move forward."
    [Reduction]: "Your goal is self-control, not self-punishment.
                  Let's take this one step at a time."

  Button: "I'm ready — what's next?" → Step 1
  Dismiss: "I need a moment" → closes screen (logs session as skipped)

Step 1 — Trigger Identification (optional)
  ─────────────────────────────────────────
  Title: "What triggered this?"
  Subtitle: "Understanding triggers helps prevent the next one."

  MultiSelectChipGroup:
    [Smoking mode]:   Stress | After a meal | Social situation |
                      Morning routine | Boredom | Alcohol/drinks |
                      Difficult emotion | Automatic habit | Other
    [Reduction mode]: Stress | Boredom | Bedtime | Solitude |
                      Phone / screen | Difficult emotion |
                      Fatigue | Other

  Skip button: "Skip — I'm not sure"
  Next button: "Save & Continue" → Step 2

Step 2 — Choose Next Action
  ──────────────────────────
  Title: "What would help right now?"

  Three option cards (full-width, tappable):
  ┌──────────────────────────────────────────────┐
  │ 🧰  Open the Craving Toolkit                 │
  │     Use a breathing or grounding exercise    │
  └──────────────────────────────────────────────┘
  ┌──────────────────────────────────────────────┐
  │ 📖  Read the Recovery Guide                  │
  │     Short, compassionate next-step guide     │
  └──────────────────────────────────────────────┘
  ┌──────────────────────────────────────────────┐
  │ ✓   I'm okay — close                         │
  │     Just acknowledge and move on             │
  └──────────────────────────────────────────────┘

  Tapping Toolkit → navigates to CravingToolkitScreen
                     (marks session.openedToolkit = true)
  Tapping Guide   → navigates to RecoveryGuideScreen
                     (marks session.readRecoveryGuide = true)
  Tapping Close   → saves session and pops
```

**`LapseRecoveryNotifier`:**

```dart
class LapseRecoveryState {
  final int currentStep;          // 0, 1, 2
  final List<String> selectedTriggers;
  final bool isLoading;
  final String? errorMessage;

  const LapseRecoveryState({
    this.currentStep = 0,
    this.selectedTriggers = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  LapseRecoveryState copyWith({...}) => ...;
}

class LapseRecoveryNotifier extends StateNotifier<LapseRecoveryState> {
  final RelapseRepository _relapseRepo;
  final String _userId;
  final GoalType _mode;
  String? _sessionId;

  LapseRecoveryNotifier({
    required RelapseRepository relapseRepo,
    required String userId,
    required GoalType mode,
  }) : _relapseRepo = relapseRepo,
       _userId = userId,
       _mode = mode,
       super(const LapseRecoveryState());

  Future<void> startSession() async {
    _sessionId = await _relapseRepo.createRecoverySession(
      userId: _userId,
      mode: _mode,
    );
  }

  void advanceToStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  void toggleTrigger(String trigger) {
    final current = List<String>.from(state.selectedTriggers);
    current.contains(trigger) ? current.remove(trigger) : current.add(trigger);
    state = state.copyWith(selectedTriggers: current);
  }

  Future<void> saveTriggers() async {
    if (_sessionId == null) return;
    await _relapseRepo.updateRecoverySessionTriggers(
      sessionId: _sessionId!,
      triggers: state.selectedTriggers,
    );
  }

  Future<void> completeSession({required LapseRecoveryAction action}) async {
    if (_sessionId == null) return;
    await _relapseRepo.completeRecoverySession(
      sessionId: _sessionId!,
      action: action,
    );
  }
}
```

**Provider:**

```dart
// Scoped to screen — auto-disposed when screen closes
final lapseRecoveryProvider = StateNotifierProvider.autoDispose
    .family<LapseRecoveryNotifier, LapseRecoveryState, GoalType>(
  (ref, mode) {
    final userId = ref.watch(currentUserIdProvider).valueOrNull ?? '';
    return LapseRecoveryNotifier(
      relapseRepo: ref.watch(relapseRepositoryProvider),
      userId: userId,
      mode: mode,
    );
  },
);
```

**Post-lapse notification:** After `completeSession()`, call:

```dart
await ref.read(notificationManagerProvider.future).then(
  (manager) => manager.onCravingLogged(_userId),
);
```

This schedules the 3-hour supportive follow-up notification (already implemented in scheduler).

### 6.4 Panic Mode Redesign

**Bug fix: Battery drain from continuous animation in `PanicButton`.**

The `AnimationController` in `panic_button.dart` repeats forever even when the button is off-screen. Fix:

```dart
class _PanicButtonState extends State<PanicButton>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(...)..repeat(reverse: true);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _controller.stop();
    } else if (state == AppLifecycleState.resumed) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }
}
```

Additionally, the panic button should only be visible when the user is on the Dashboard or Log tab, not on every screen. The `DashboardScreen` will pass the `floatingActionButton` to the `Scaffold` — it should NOT be a global overlay.

**`PanicModeScreen` calming entry animation:**

Add a 500ms fade-in for the page content when the screen opens. Use `AnimationController` in `initState` that drives an `FadeTransition`:

```dart
class _PanicModeScreenState extends ConsumerState<PanicModeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}
```

**`EditPanicStepsScreen` race condition fix:**

Replace the `ref.invalidate()` + immediate `ref.read().future` pattern:

```dart
// BEFORE (race condition):
Future<void> _loadSteps() async {
  ref.invalidate(relapsePlanProvider);
  final plan = await ref.read(relapsePlanProvider.future);  // may return stale cache
  ...
}

// AFTER (correct):
Future<void> _loadSteps() async {
  // Use the repository directly — bypass the cached FutureProvider
  final repo = ref.read(relapseRepositoryProvider);
  final userId = await ref.read(secureStorageProvider).getUserId();
  if (userId == null) return;
  
  final plan = await repo.getPlanFresh(userId);
  if (plan == null) return;
  
  setState(() {
    _steps = plan.panicSteps.map((s) => PanicStep()
      ..title       = s.title
      ..description = s.description
      ..icon        = s.icon
      ..actionType  = s.actionType
      ..contactId   = s.contactId
      ..actionData  = s.actionData
      ..displayOrder= s.displayOrder,
    ).toList();
    _isLoading = false;
  });
}
```

### 6.5 Emergency Contacts Enhancement

The existing `ContactCard` and `RelapseContact` model are functionally correct. Enhancements:

**1. Contact count validation:**

The SRS specifies a maximum of 10 contacts (`AppConstants.maxEmergencyContacts`). The `addContact` method in the repository must enforce this:

```dart
Future<RelapseContact> addContact(RelapseContact contact) async {
  final currentCount = await getContactCount(contact.userId);
  if (currentCount >= AppConstants.maxEmergencyContacts) {
    throw Exception('Maximum of ${AppConstants.maxEmergencyContacts} contacts allowed.');
  }
  // ... existing add logic
}
```

Surface this limit gracefully in the UI:

```dart
// In RelapsePlanScreen._buildContactsTab():
if (state.contacts.length >= AppConstants.maxEmergencyContacts) {
  return Column(children: [
    Banner('Maximum contacts reached (10). Remove one to add another.'),
    ...contactList,
  ]);
}
```

**2. Phone number validation:**

Add basic phone validation in the add/edit dialog:

```dart
String? _validatePhone(String? value) {
  if (value == null || value.isEmpty) return null; // optional field
  final cleaned = value.replaceAll(RegExp(r'[\s\-\(\)\+]'), '');
  if (!RegExp(r'^\d{7,15}$').hasMatch(cleaned)) {
    return 'Please enter a valid phone number';
  }
  return null;
}
```

**3. First contact in panic step:**

When the user has exactly one contact with a phone number, the "Call Support" default panic step should automatically pre-fill `contactId`. Add this wiring in `getOrCreatePlan()`:

```dart
// In RelapseRepository.getOrCreatePlan():
final contacts = await getContactsWithPhone(userId);
if (contacts.length == 1) {
  // Pre-fill the contact step
  final contactStep = plan.panicSteps.firstWhere(
    (s) => s.actionType == PanicActionType.contact,
    orElse: () => plan.panicSteps[2],
  );
  contactStep.contactId = contacts.first.id;
  // This is done in memory — the caller must call updatePlan() to persist
}
```

**4. `relapsePlanProvider` / `relapseNotifierProvider` synchronization bug fix:**

The core problem is that `relapseNotifierProvider` uses `StateNotifierProvider` with an inline `userIdAsync.when()` that returns a dead `RelapseNotifier('', ...)` during loading. Fix by separating concerns:

```dart
// Step 1: userId provider (always exists)
final relapseUserIdProvider = FutureProvider.autoDispose<String>((ref) async {
  final storage = ref.watch(secureStorageProvider);
  final id = await storage.getUserId();
  if (id == null || id.isEmpty) throw Exception('No user ID');
  return id;
});

// Step 2: Notifier depends on userId being resolved
final relapseNotifierProvider = AsyncNotifierProvider.autoDispose<
    RelapseNotifier, RelapseState>(RelapseNotifier.new);

class RelapseNotifier extends AutoDisposeAsyncNotifier<RelapseState> {
  @override
  Future<RelapseState> build() async {
    // This correctly suspends until userId is available
    final userId = await ref.watch(relapseUserIdProvider.future);
    final repo   = ref.watch(relapseRepositoryProvider);

    final plan     = await repo.getOrCreatePlan(userId);
    final contacts = await repo.getContacts(userId);

    return RelapseState(
      plan: plan,
      contacts: contacts,
    );
  }

  Future<void> addContact(RelapseContact contact) async {
    final userId = await ref.read(relapseUserIdProvider.future);
    contact.userId = userId;
    final repo = ref.read(relapseRepositoryProvider);
    await repo.addContact(contact);
    ref.invalidateSelf();
  }

  // ... other mutating methods all call ref.invalidateSelf() to trigger rebuild
}
```

**Why `AsyncNotifier` instead of `StateNotifier`:** `AsyncNotifier` (`AsyncNotifierProvider`) properly handles the async `build()` method, exposing loading/error states automatically. It removes the need for the `RelapseState.isLoading` field entirely, since the `AsyncValue` wrapper in the provider already carries that state.

### 6.6 Help & Safety Screen

This screen is **required by SRS §15** and currently does not exist. It must be:
- Accessible without authentication (even if privacy lock is active)
- No network requests
- Always available from Settings > Help / Safety and from the bottom navigation "Help Now" button

**`HelpSafetyScreen` structure:**

```
AppBar: "Help & Safety" (no back button override — always swipe-back)

Section 1 — Emergency Contacts (user-configured)
  ─────────────────────────────────────────────
  Shows the user's own RelapseContact list (with phone numbers)
  "Call [Name]" button for each
  If empty: "Add emergency contacts in your Relapse Plan"

Section 2 — Crisis Helplines (static, offline)
  ─────────────────────────────────────────────
  These are hardcoded strings — no API calls.
  Displayed as a list of tappable `tel:` links.

  International:
  ├── WHO Mental Health (helpline directory): who.int/mental_health (display only)
  ├── International Association for Suicide Prevention: iasp.info/resources/Crisis_Centres/

  By region (static list, user's locale is NOT used — show all):
  ├── 🇺🇸 USA: SAMHSA Helpline 1-800-662-4357
  ├── 🇺🇸 USA: Crisis Text Line — Text HOME to 741741
  ├── 🇬🇧 UK: Samaritans 116 123
  ├── 🇦🇺 AU: Lifeline 13 11 14
  ├── 🇨🇦 CA: Crisis Services Canada 1-833-456-4566
  ├── 🇩🇪 DE: Telefonseelsorge 0800 111 0 111
  ├── 🇫🇷 FR: SOS Amitié 09 72 39 40 50
  ├── 🇳🇱 NL: 113 Zelfmoordpreventie 0800-0113
  └── 🌍 More: findahelpline.com (display only)

Section 3 — App Disclaimer
  ─────────────────────────────────────────────
  "QuitMate is not a substitute for professional medical or
   psychiatric support. If you are in crisis, please contact
   emergency services or a crisis helpline."

  "In an emergency, call [112 / 911 / 999] (varies by region)."
```

**Authentication bypass:** The Help screen is added to the router as an un-guarded route. In `app.dart`, the `_navigatorKey` allows navigation to it from outside the authenticated widget tree. Add a globally accessible static method:

```dart
// lib/core/navigation/help_navigation.dart

class HelpNavigation {
  static void openHelpScreen(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => const HelpSafetyScreen(),
        fullscreenDialog: true,
      ),
    );
  }
}
```

The privacy lock `LocalAuthScreen` must include a "Get Help" button that calls `HelpNavigation.openHelpScreen(context)` — bypassing authentication.

**Static crisis data:** Stored as a `const List<CrisisHelpline>` in:

```
lib/features/relapse_prevention/data/static/crisis_helplines.dart
```

No Isar model needed — purely static, never changes without a code release.

```dart
class CrisisHelpline {
  final String countryFlag;
  final String countryCode;
  final String organizationName;
  final String phoneNumber;      // null if web-only
  final String? websiteUrl;      // display only, no in-app browser
  final bool isSmsLine;

  const CrisisHelpline({...});
}
```

### 6.7 Custom Relapse Plan Builder

**Current issue:** `_showEditCustomStepsDialog()` in `RelapsePlanScreen` is implemented as a dialog that calls `Navigator.pop` + re-push to add/remove items — causing flicker.

**Fix:** Convert to a dedicated `EditCustomStepsScreen` with `ReorderableListView.builder`:

```dart
class EditCustomStepsScreen extends ConsumerStatefulWidget {
  final List<String> initialSteps;
  ...
}

class _EditCustomStepsScreenState extends ConsumerState<EditCustomStepsScreen> {
  late List<TextEditingController> _controllers;

  // No dialog — inline editing in ReorderableListView
  // Add step: add new TextEditingController to list + setState
  // Delete step: remove controller + setState
  // Reorder: swap controllers in onReorder
  // Save: extract text from controllers → call notifier.updateCustomSteps()

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();  // prevent memory leak
    super.dispose();
  }
}
```

**Recovery Guide Screen (`RecoveryGuideScreen`):**

```dart
// lib/features/relapse_prevention/presentation/screens/recovery_guide_screen.dart

class RecoveryGuideScreen extends StatelessWidget {
  final GoalType mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recovery Guide')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('This is a data point, not a failure.',
              mode == GoalType.quitSmoking
                ? 'Every person who has ever quit smoking has had moments like this. ...'
                : 'Compulsive patterns are challenging precisely because they feel ...',
            ),
            _buildSection('What to do in the next 10 minutes', ...),
            _buildSection('What to do today', ...),
            _buildSection('What to do this week', ...),
            _buildSection('Remember your reasons', ...),
          ],
        ),
      ),
    );
  }
}
```

Content is **static Dart strings** — not fetched from any API. Two versions: one for `GoalType.quitSmoking`, one for `GoalType.reduceMasturbation`. Both follow the SRS language guidelines (distress/impairment framing, no shame).

### 6.8 Recovery Statistics

The `RelapseNotifier` must expose recovery statistics for the Statistics/Progress tab:

```dart
// Add to Statistics model (from tracking feature):
class Statistics {
  // ... existing fields ...
  final int recoveryCount;          // total lapse recovery flows completed
  final int totalLapses;            // total lapse events logged
  final double recoveryRate;        // recoveryCount / totalLapses (if > 0)
  final List<String> commonTriggers;// top 3 triggers from LapseRecoverySession
}
```

**Display in StreakCard (from tracking enhancement):**

```dart
// Already planned in predecessor document — confirm implementation:
Text(
  'You have recovered ${stats.recoveryCount} time${stats.recoveryCount == 1 ? '' : 's'}.',
  style: textTheme.bodyMedium,
)
```

**Progress tab "Recovery" section:**

Add a collapsible card on the Progress screen:

```
Recovery Journey
  Total recoveries: [N]
  Most common trigger: [Stress]
  Average time to recovery flow: [2h 14m]
  Longest streak after a recovery: [12 days]
```

---

## 7. Data Model Revisions

### 7.1 ToolkitExercise Isar Model

**File:** `lib/features/craving_toolkit/data/models/toolkit_exercise_model.dart` *(new)*

```dart
import 'package:isar/isar.dart';

part 'toolkit_exercise_model.g.dart';

@collection
class ToolkitExerciseModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String exerciseId;         // stable UUID, seeded from static catalogue

  late String name;
  late String category;           // ExerciseCategory.name

  @Index()
  late bool isFavorite;

  @Index()
  DateTime? lastUsedAt;

  late int durationEstimateSeconds;
  late bool isSharedBothModes;
  String? modeFilter;             // GoalType.name or null
  late String shortDescription;
  late String fullInstructions;
  String? modeSpecificNote;
  late DateTime seededAt;         // when this record was first written
}
```

**Seeding logic:**

```dart
// lib/features/craving_toolkit/data/datasources/toolkit_seed_service.dart

class ToolkitSeedService {
  final Isar _isar;

  Future<void> seedIfNeeded() async {
    final count = await _isar.toolkitExerciseModels.count();
    if (count >= _catalogue.length) return; // already seeded

    await _isar.writeTxn(() async {
      for (final exercise in _catalogue) {
        final existing = await _isar.toolkitExerciseModels
            .filter()
            .exerciseIdEqualTo(exercise.exerciseId)
            .findFirst();
        if (existing == null) {
          await _isar.toolkitExerciseModels.put(
            ToolkitExerciseModel()
              ..exerciseId            = exercise.exerciseId
              ..name                  = exercise.name
              ..category              = exercise.category.name
              ..isFavorite            = false
              ..lastUsedAt            = null
              ..durationEstimateSeconds = exercise.durationEstimateSeconds
              ..isSharedBothModes     = exercise.isSharedBothModes
              ..modeFilter            = exercise.modeFilter?.name
              ..shortDescription      = exercise.shortDescription
              ..fullInstructions      = exercise.fullInstructions
              ..modeSpecificNote      = exercise.modeSpecificNote
              ..seededAt              = DateTime.now().toUtc(),
          );
        }
      }
    });
  }

  static const _catalogue = [...]; // 16 exercises from §4.9 matrix
}
```

**Call `seedIfNeeded()` from `main.dart` after `IsarService.instance` resolves.**

### 7.2 ToolkitSession Isar Model

**File:** `lib/features/craving_toolkit/data/models/toolkit_session_model.dart` *(new)*

```dart
@collection
class ToolkitSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Index()
  late String exerciseId;

  late String exerciseName;    // denormalized for export/display without join
  late String exerciseCategory;

  @Index()
  late DateTime startedAt;     // UTC

  DateTime? completedAt;       // null = abandoned

  bool get wasCompleted => completedAt != null;

  // 0=helped, 1=somewhat, 2=notReally, null=no feedback given
  int? feedbackRating;

  late String mode;            // GoalType.name

  String? linkedJournalEntryId;  // optional link to a JournalEntryModel
}
```

### 7.3 JournalEntry Isar Model

**File:** `lib/features/craving_toolkit/data/models/journal_entry_model.dart` *(new)*

```dart
@collection
class JournalEntryModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String entryId;          // UUID

  @Index()
  late String userId;

  @Index()
  late DateTime createdAt;      // UTC

  DateTime? updatedAt;

  late String content;          // freeform text, encrypted at Isar box level

  String? moodTag;              // MoodTag.name or null

  String? sourceExerciseId;     // toolkit exercise that triggered this entry
  String? sourceExerciseName;   // denormalized
}
```

**Register in `IsarService.instance`:**

```dart
// In isar_service.dart, add to the Isar.open() schemas list:
ToolkitExerciseModelSchema,
ToolkitSessionModelSchema,
JournalEntryModelSchema,
LapseRecoverySessionModelSchema,
```

### 7.4 RelapsePlan Isar Model Revision

**File:** `lib/features/relapse_prevention/data/models/relapse_models.dart`

Add two fields to `RelapsePlan`:

```dart
// NEW fields — append after existing fields to avoid breaking Isar field indices
String? personalRecoveryNote;   // HiveField-equivalent: new index at end
DateTime? lastReviewedAt;
```

Add new collection:

```dart
@collection
class LapseRecoverySessionModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String sessionId;        // UUID

  @Index()
  late String userId;

  late DateTime startedAt;      // UTC
  DateTime? completedAt;

  @Enumerated(EnumType.name)
  LapseRecoveryAction? chosenAction;

  List<String> selectedTriggers = [];

  bool openedToolkit  = false;
  bool readRecoveryGuide = false;

  String? recoveryNote;

  late String mode;             // GoalType.name
}
```

**Regenerate `relapse_models.g.dart` after these additions.**

### 7.5 NotificationPreferences Isar Model Revision

**File:** `lib/features/interventions/data/models/notification_models.dart`

Add to `NotificationPreferences`:

```dart
// Permission tracking
DateTime? permissionDeniedAt;   // null = never denied or was granted

// Quit-date prep notifications (smoking mode only)
bool quitDatePrepEnabled = true;

// Mode (for type-adaptive scheduling)
String? userMode;               // GoalType.name — set during onboarding completion
```

Change default value:

```dart
// BEFORE:
NotificationFrequency frequency = NotificationFrequency.low;

// AFTER (SRS default = medium):
NotificationFrequency frequency = NotificationFrequency.medium;
```

**Regenerate `notification_models.g.dart` after these additions.**

---

## 8. State Management Revisions

### 8.1 ToolkitProvider Architecture

**File:** `lib/features/craving_toolkit/presentation/providers/toolkit_provider.dart` *(new)*

```dart
// ─── Exercise list (mode-filtered) ───────────────────────────────────────────

final toolkitExercisesProvider = FutureProvider.autoDispose
    .family<List<ToolkitExercise>, GoalType>((ref, mode) async {
  final repo = ref.watch(toolkitRepositoryProvider);
  return repo.getExercisesForMode(mode);
});

// ─── Favorites (stream — live updates on toggle) ──────────────────────────────

final favoriteExercisesProvider = StreamProvider.autoDispose
    .family<List<ToolkitExercise>, GoalType>((ref, mode) {
  final repo = ref.watch(toolkitRepositoryProvider);
  return repo.watchFavorites(mode);
});

// ─── Recents (last 3, any mode) ───────────────────────────────────────────────

final recentExercisesProvider = FutureProvider.autoDispose<List<ToolkitExercise>>(
  (ref) async {
    final repo = ref.watch(toolkitRepositoryProvider);
    return repo.getRecentExercises(limit: 3);
  },
);

// ─── Active session ───────────────────────────────────────────────────────────

class ToolkitSessionNotifier extends AutoDisposeNotifier<ToolkitSessionState> {
  @override
  ToolkitSessionState build() => const ToolkitSessionState();

  Future<void> startSession(ToolkitExercise exercise, String userId, GoalType mode) async {
    final repo = ref.read(toolkitRepositoryProvider);
    final sessionId = await repo.startSession(
      exerciseId: exercise.id,
      userId: userId,
      mode: mode,
    );
    // Update lastUsedAt on the exercise record
    await repo.markExerciseUsed(exercise.id);
    // Invalidate recents provider
    ref.invalidate(recentExercisesProvider);

    state = state.copyWith(
      activeSession: ToolkitSession(
        id: sessionId,
        exerciseId: exercise.id,
        exerciseName: exercise.name,
        startedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> endSession({required bool completed}) async {
    final session = state.activeSession;
    if (session == null) return;
    final repo = ref.read(toolkitRepositoryProvider);
    await repo.endSession(sessionId: session.id, completed: completed);
    state = state.copyWith(activeSession: null, lastCompletedSession: session);
  }

  Future<void> recordFeedback(int rating) async {
    final session = state.lastCompletedSession;
    if (session == null) return;
    await ref.read(toolkitRepositoryProvider).recordFeedback(
      sessionId: session.id,
      rating: rating,
    );
  }

  Future<void> toggleFavorite(String exerciseId) async {
    await ref.read(toolkitRepositoryProvider).toggleFavorite(exerciseId);
    // favoriteExercisesProvider is a StreamProvider — updates automatically
  }
}

final toolkitSessionProvider =
    NotifierProvider.autoDispose<ToolkitSessionNotifier, ToolkitSessionState>(
  ToolkitSessionNotifier.new,
);
```

### 8.2 JournalProvider Architecture

**File:** `lib/features/craving_toolkit/presentation/providers/journal_provider.dart` *(new)*

```dart
// ─── Journal list ─────────────────────────────────────────────────────────────

final journalEntriesProvider = FutureProvider.autoDispose
    .family<List<JournalEntry>, MoodTag?>((ref, filterMood) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];
  final repo = ref.watch(journalRepositoryProvider);
  return repo.getEntries(userId: userId, moodFilter: filterMood);
});

// ─── Journal notifier ─────────────────────────────────────────────────────────

class JournalNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<String> createEntry({
    required String content,
    MoodTag? moodTag,
    String? sourceExerciseId,
    String? sourceExerciseName,
  }) async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) throw Exception('No user ID');
    final repo = ref.read(journalRepositoryProvider);
    final entryId = await repo.createEntry(
      userId: userId,
      content: content,
      moodTag: moodTag,
      sourceExerciseId: sourceExerciseId,
      sourceExerciseName: sourceExerciseName,
    );
    ref.invalidate(journalEntriesProvider);
    return entryId;
  }

  Future<void> updateEntry(String entryId, String content, MoodTag? moodTag) async {
    await ref.read(journalRepositoryProvider).updateEntry(
      entryId: entryId,
      content: content,
      moodTag: moodTag,
    );
    ref.invalidate(journalEntriesProvider);
  }

  Future<void> deleteEntry(String entryId) async {
    await ref.read(journalRepositoryProvider).deleteEntry(entryId);
    ref.invalidate(journalEntriesProvider);
  }
}

final journalNotifierProvider =
    AsyncNotifierProvider.autoDispose<JournalNotifier, void>(JournalNotifier.new);
```

### 8.3 RelapsePlanProvider Revision

**File:** `lib/features/relapse_prevention/presentation/providers/relapse_provider.dart`

Full rewrite from `StateNotifier` to `AsyncNotifier` (see §6.5 for rationale and code skeleton).

**Key changes:**
- `RelapseNotifier` extends `AutoDisposeAsyncNotifier<RelapseState>` instead of `StateNotifier<RelapseState>`
- `build()` is async and suspends until `userId` is available
- All mutation methods call `ref.invalidateSelf()` to trigger a full re-fetch
- Remove `isLoading` from `RelapseState` — the `AsyncValue` wrapper carries this
- Remove `RelapseState.error` — `AsyncValue.error` carries this
- `relapseNotifierProvider` becomes `AsyncNotifierProvider.autoDispose<RelapseNotifier, RelapseState>`

**Updated `RelapseState`:**

```dart
class RelapseState {
  final RelapsePlan? plan;
  final List<RelapseContact> contacts;

  // Note: NO isLoading, NO error — AsyncValue in the provider handles this
  const RelapseState({
    this.plan,
    this.contacts = const [],
  });

  RelapseState copyWith({
    RelapsePlan? plan,
    List<RelapseContact>? contacts,
  }) => RelapseState(
    plan: plan ?? this.plan,
    contacts: contacts ?? this.contacts,
  );
}
```

### 8.4 NotificationPreferencesProvider Revision

**File:** `lib/features/interventions/presentation/providers/notification_provider.dart`

Convert `NotificationPreferencesNotifier` from `AutoDisposeAsyncNotifier` to `AsyncNotifierProvider` with a debounced save:

```dart
class NotificationPreferencesNotifier
    extends AutoDisposeAsyncNotifier<NotificationPreferences> {

  Timer? _saveDebounce;

  @override
  Future<NotificationPreferences> build() async {
    final manager = await ref.watch(notificationManagerProvider.future);
    final userId = await ref.watch(currentUserIdProvider.future);
    if (userId == null || userId.isEmpty) {
      return NotificationPreferences()..userId = '';
    }
    return manager.getPreferences(userId);
  }

  Future<void> _update(void Function(NotificationPreferences) mutate) async {
    final current = state.valueOrNull;
    if (current == null) return;
    mutate(current);
    state = AsyncData(current);       // optimistic update

    _saveDebounce?.cancel();
    _saveDebounce = Timer(const Duration(seconds: 2), () async {
      try {
        final manager = await ref.read(notificationManagerProvider.future);
        await manager.savePreferences(current);
      } catch (e, s) {
        state = AsyncError(e, s);
      }
    });
  }

  // ... all setters unchanged, call _update()
}
```

### 8.5 HelpSafetyProvider

**File:** `lib/features/relapse_prevention/presentation/providers/help_safety_provider.dart` *(new)*

```dart
// Emergency contacts from relapse plan (for Help screen)
final helpSafetyContactsProvider = FutureProvider.autoDispose<List<RelapseContact>>(
  (ref) async {
    // This provider must NOT throw if user is not logged in
    // Help screen must always be accessible
    try {
      final storage = ref.watch(secureStorageProvider);
      final userId = await storage.getUserId();
      if (userId == null) return [];
      return ref.watch(relapseRepositoryProvider).getContactsWithPhone(userId);
    } catch (_) {
      return [];
    }
  },
);

// Static crisis helplines — no Isar, no network
final crisisHelplinesProvider = Provider<List<CrisisHelpline>>((ref) {
  return kCrisisHelplines; // const from crisis_helplines.dart
});
```

---

## 9. UI/UX Specification

### 9.1 Craving Toolkit Screen Map

```
CRAVING TOOLKIT (full-screen modal route)
├── CravingToolkitScreen              S50
│   ├── AppBar: "Craving Toolkit" + close icon
│   ├── FavoritesSection              (hidden if no favorites)
│   │   └── ExerciseChip ×N          (icon + name + duration)
│   ├── RecentsSection                (hidden if no sessions yet)
│   │   └── ExerciseCard (compact) ×3
│   │       └── "Repeat" button
│   └── AllExercisesSection           (mode-filtered)
│       └── ExerciseCard ×N
│           ├── Category icon
│           ├── Name + short description
│           ├── Duration chip
│           ├── Mode badge (if mode-exclusive)
│           └── Favorite toggle (heart)
│
├── ExerciseDetailScreen              S51
│   ├── AppBar: exercise name + favorite toggle
│   ├── Large category icon / illustration
│   ├── Duration chip ("~3 min")
│   ├── Short description
│   ├── Mode-specific note (if applicable)
│   └── "Start" ElevatedButton
│
├── BreathingExerciseScreen           S51a
│   ├── AppBar: pattern name + "Skip" action
│   ├── Phase label (Inhale / Hold / Exhale)
│   ├── Animated circle (size + color)
│   ├── Cycle counter ("Cycle 2 of 4")
│   └── PostExerciseFeedbackSheet     (after complete or skip)
│
├── GroundingExerciseScreen           S51b
│   ├── AppBar: exercise name + "Exit"
│   ├── LinearProgressIndicator
│   ├── Step prompt (full-width text)
│   ├── Optional TextField
│   ├── "Next" / "Skip this step" buttons
│   └── CompletionScreen → PostExerciseFeedbackSheet
│
├── UrgeSurfingScreen                 S51c
│   ├── AppBar: "Urge Surfing" + mode badge
│   ├── Timer selector (3 / 5 / 10 min)
│   ├── Countdown + phase prompts
│   └── PostExerciseFeedbackSheet
│       └── "I gave in" → lapse log flow
│
├── CbtTechniqueScreen                S51d
│   ├── AppBar: technique name
│   ├── Multi-step PageView
│   │   ├── Instruction screen
│   │   ├── Interactive prompt screens (TextField / timer)
│   │   └── Completion + optional journal CTA
│   └── PostExerciseFeedbackSheet
│
├── DelayDistractScreen               S51e
│   ├── AppBar: "Delay & Distract"
│   ├── Timer selector
│   ├── Mode-specific activity suggestions
│   └── PostExerciseFeedbackSheet
│
├── CognitiveReframingScreen          S51f
│   ├── AppBar: "Cognitive Reframing"
│   ├── Multi-step guided worksheet
│   └── PostExerciseFeedbackSheet + optional journal save
│
├── RelapseRecoveryPlanScreen         S51g  ← Toolkit exercise (NOT panic mode)
│   ├── AppBar: "Recovery Plan Exercise"
│   ├── Guided prompts for writing personal plan
│   └── Save to JournalEntryScreen
│
└── JournalEntryScreen                S80
    ├── AppBar: "Journal" + Save action
    ├── MoodTag chip row
    ├── Expandable TextField
    └── Auto-save every 30s
```

### 9.2 Relapse Prevention Screen Map

```
RELAPSE PREVENTION
├── RelapsePlanScreen                 (existing, refactored)
│   ├── Tab 1: "My Plan"
│   │   ├── PanicModeSection (edit CTA → EditPanicStepsScreen)
│   │   ├── CustomStepsSection (edit CTA → EditCustomStepsScreen)
│   │   └── PersonalRecoveryNoteSection
│   └── Tab 2: "Contacts"
│       ├── ContactCard ×N
│       └── FAB: Add Contact
│
├── EditPanicStepsScreen              (existing, race condition fixed)
│   └── ReorderableListView of PanicStepCards
│
├── EditCustomStepsScreen             (NEW — replaces dialog)
│   ├── AppBar: "My Relapse Plan Steps" + Save
│   └── ReorderableListView of TextFields
│
├── PanicModeScreen                   (existing, enhanced)
│   ├── Fade-in entry animation
│   ├── Calming header
│   └── PanicStepCard ×3 → exercise screens
│
├── LapseRecoveryScreen               (NEW — SRS §8.4)
│   ├── Step 0: Acknowledgment
│   ├── Step 1: Trigger Selection (MultiSelectChipGroup)
│   └── Step 2: Next Action Options
│       ├── → CravingToolkitScreen
│       ├── → RecoveryGuideScreen
│       └── → Close (complete session)
│
├── RecoveryGuideScreen               (NEW)
│   └── Static scrollable article (mode-specific)
│
└── HelpSafetyScreen                  (NEW — SRS §15)
    ├── Emergency Contacts section (user's contacts)
    ├── Crisis Helplines section (static list with tel: links)
    └── App Disclaimer
```

### 9.3 Component Library Additions

**New widgets to create:**

| Widget | Location | Purpose |
|--------|----------|---------|
| `ExerciseCard` | `craving_toolkit/presentation/widgets/` | Toolkit list item |
| `ExerciseChip` | `craving_toolkit/presentation/widgets/` | Compact horizontal favorites chip |
| `DurationChip` | `craving_toolkit/presentation/widgets/` | "~3 min" chip |
| `ModeBadge` | `craving_toolkit/presentation/widgets/` | "Smoking" / "Habit Reduction" badge |
| `FavoriteButton` | `craving_toolkit/presentation/widgets/` | Heart icon toggle, no confirmation |
| `PostExerciseFeedbackSheet` | `craving_toolkit/presentation/widgets/` | Bottom sheet with 3 rating options |
| `BreathingCircle` | `craving_toolkit/presentation/widgets/` | Animated grow/shrink circle |
| `GroundingStepPrompt` | `craving_toolkit/presentation/widgets/` | Step card with text area |
| `MultiSelectChipGroup` | `core/widgets/` | Reusable for trigger selection |
| `LapseRecoveryOptionCard` | `relapse_prevention/presentation/widgets/` | Option card in recovery flow step 2 |
| `CrisisHelplineCard` | `relapse_prevention/presentation/widgets/` | Helpline display with tel: tap |
| `RecoveryStatsCard` | `relapse_prevention/presentation/widgets/` | Progress tab recovery stats |

**Design token compliance:**

All new widgets must use design tokens from `AppTheme`:

- Cards: `cornerRadius = 12dp`, `elevationCard = 2dp` (light) / border (dark)
- Primary: `colorPrimary = #1B3A6B` (light) / `#5B8FD6` (dark)
- Secondary: `colorSecondary = #2D9B6F` (light) / `#4FC28E` (dark)
- Body text: `fontSizeBody = 14sp`, scaling with user font size
- Display: `fontSizeDisplay = 32sp` (streak counter, breathing circle label)
- Never hardcode pixel widths for text containers (SRS Pitfall 1)

### 9.4 Accessibility Requirements

Per SRS NFR-08 and NFR-09:

- All `ExerciseCard` widgets must have `Semantics` label: `"${exercise.name}, ${exercise.durationEstimateSeconds ~/ 60} minutes, ${isFavorite ? 'favorited' : 'not favorited'}"`
- `FavoriteButton` must have `Semantics(label: 'Toggle favorite for ${exercise.name}', button: true)`
- `BreathingCircle` must have `Semantics(label: phaseLabel, liveRegion: true)` — `liveRegion` announces phase changes to screen readers
- `PostExerciseFeedbackSheet` buttons must have explicit semantic labels
- `CrisisHelplineCard` phone button: `Semantics(label: 'Call ${helpline.organizationName} at ${helpline.phoneNumber}', button: true)`
- All interactive elements in `LapseRecoveryScreen` must have `Semantics` wrapper
- `HelpSafetyScreen` must have `Semantics(header: true)` on section headers

---

## 10. Implementation Sequence

Implement in this strict order to minimize merge conflicts and allow incremental testing:

### Phase 1 — Foundation & Bug Fixes (no new screens yet)

**Estimated effort: 3–4 days**

1. **Fix `GoalType` references** in `notification_scheduler_service.dart` — replace `dynamic stats` cast with typed `Statistics`
2. **Fix `isInQuietHours()`** in `notification_models.dart` — same-day range bug
3. **Fix `hasPermission()`** in `push_notification_service.dart` — iOS unconditional `true`
4. **Fix `cancelAll()` bug** in `notification_scheduler_service.dart` — only cancel future notifications
5. **Fix `RelapsePlan` provider** — rewrite `relapseNotifierProvider` as `AsyncNotifier` (§6.5)
6. **Fix `EditPanicStepsScreen` race condition** — use direct repository read (§6.4)
7. **Fix `PanicButton` battery drain** — add `WidgetsBindingObserver` (§6.4)
8. **Add debounce** to `NotificationPreferencesNotifier._update()` (§5.6)
9. **Fix `NotificationPreferences.frequency` default** — change `low` → `medium`
10. **Add `permissionDeniedAt` field** to `NotificationPreferences` → regenerate `.g.dart`

### Phase 2 — Data Models & Repositories

**Estimated effort: 2–3 days**

11. Create `ToolkitExerciseModel` Isar collection + `.g.dart`
12. Create `ToolkitSessionModel` Isar collection + `.g.dart`
13. Create `JournalEntryModel` Isar collection + `.g.dart`
14. Create `LapseRecoverySessionModel` Isar collection + `.g.dart`
15. Add new fields to `RelapsePlan` → regenerate `relapse_models.g.dart`
16. Register all new schemas in `IsarService.instance`
17. Create `IToolkitRepository` interface (domain layer)
18. Create `ToolkitRepositoryImpl` (data layer)
19. Create `IJournalRepository` interface + `JournalRepositoryImpl`
20. Create `IRelapseRepository` interface (extract from existing impl)
21. Add `createRecoverySession`, `updateRecoverySessionTriggers`, `completeRecoverySession` to `RelapseRepository`
22. Add static `crisis_helplines.dart` file

### Phase 3 — Domain Layer & Seeding

**Estimated effort: 1–2 days**

23. Create `ToolkitExercise` and `ToolkitSession` domain entities
24. Create `JournalEntry` domain entity with `MoodTag` enum
25. Create use cases: `GetExercisesForModeUseCase`, `ToggleFavoriteUseCase`, `RecordSessionUseCase`, `GetRecentExercisesUseCase`
26. Create `ToolkitSeedService` with full 16-exercise catalogue (§4.9)
27. Wire `ToolkitSeedService.seedIfNeeded()` in `main.dart` after `IsarService`
28. Create `ContentAuditService` + write unit test (release gate)
29. Expand `NotificationContent` with mode-specific template pools and new smoking/reduction templates

### Phase 4 — Notification System

**Estimated effort: 2–3 days**

30. Implement `requestPermissionsIfAppropriate()` in `NotificationManager`
31. Revise `PushNotificationService.hasPermission()` — integrate `permission_handler`
32. Wire permission request to `TrackingNotifier.logEvent()` post-first-log hook
33. Implement `scheduleQuitDatePrep()` in `NotificationSchedulerService`
34. Implement `scheduleBedtimeReminder()` in `NotificationSchedulerService`
35. Update `_selectTypes()` to accept typed `Statistics` and `GoalType`
36. Fix `_cancelFuture()` (replace `cancelAll()` in `scheduleForNextDays()`)
37. Fix `NotificationSettingsScreen` — replace `DropdownButton` with `showTimePicker`
38. Add `userMode` field to `NotificationPreferences` + wire to onboarding completion
39. Run `ContentAuditService` tests — fix any violations in `notification_content.dart`

### Phase 5 — Craving Toolkit Rebuild

**Estimated effort: 4–5 days**

40. Create `ToolkitProvider`, `JournalProvider` (§8.1, §8.2)
41. Refactor `CravingToolkitScreen` — wire to repository; add Favorites, Recents sections
42. Create `ExerciseCard`, `ExerciseChip`, `DurationChip`, `ModeBadge`, `FavoriteButton` widgets
43. Fix `BreathingExerciseScreen` — implement correct per-pattern phase timing
44. Create `BreathingCircle` animated widget
45. Fix `GroundingExerciseScreen` — stepped PageView flow for all 5 exercise types
46. Fix `CbtTechniqueScreen` — interactive multi-step flow for all 5 techniques
47. Create `UrgeSurfingScreen` with mode-specific wording and timer
48. Create `DelayDistractScreen` with mode-specific suggestions
49. Create `CognitiveReframingScreen` with guided worksheet
50. Create `RelapseRecoveryPlanScreen` (toolkit exercise — distinct from panic mode)
51. Create `JournalEntryScreen` with auto-save and mood tags
52. Create `PostExerciseFeedbackSheet`
53. Wire `ToolkitSessionNotifier.startSession()` on every exercise screen `initState`
54. Wire `ToolkitSessionNotifier.endSession()` on every exercise screen completion and exit
55. Add `Semantics` to all new widgets (§9.4 accessibility requirements)

### Phase 6 — Relapse Prevention Rebuild

**Estimated effort: 3–4 days**

56. Create `LapseRecoveryNotifier` + `lapseRecoveryProvider` (§6.3)
57. Create `LapseRecoveryScreen` (3-step flow)
58. Create `MultiSelectChipGroup` widget (reusable)
59. Create `LapseRecoveryOptionCard` widget
60. Wire `LapseRecoveryScreen` push from `QuickLogSheet` lapse log actions
61. Create `RecoveryGuideScreen` with mode-specific static content
62. Create `EditCustomStepsScreen` (replace dialog pattern)
63. Create `HelpSafetyProvider`
64. Create `HelpSafetyScreen` with static crisis helplines
65. Add `HelpSafetyScreen` as un-guarded route accessible from Settings and privacy lock screen
66. Wire `CrisisHelplineCard` widgets with `tel:` URL launcher
67. Add `RecoveryStatsCard` to Progress tab
68. Update `RelapsePlanScreen` — add personal recovery note section, "Last reviewed" display

### Phase 7 — Integration & QA

**Estimated effort: 2–3 days**

69. Integration test: onboarding → dashboard → toolkit → exercise → feedback recorded
70. Integration test: log lapse → `LapseRecoveryScreen` → choose toolkit → toolkit opens
71. Integration test: complete panic mode step (breathing) → correct `BreathingExerciseScreen` opens
72. Unit test: `ContentAuditService` (release gate)
73. Unit test: `ToolkitSeedService` — verify all 16 exercises seeded, no duplicates
74. Unit test: `isInQuietHours()` — both same-day and overnight ranges
75. Unit test: `_cancelFuture()` — only future notifications cancelled
76. Widget test: `CravingToolkitScreen` — opens in <1s, all 7 categories visible
77. Widget test: `BreathingExerciseScreen` — correct phase durations for all 4 patterns
78. Widget test: `LapseRecoveryScreen` — zero shame language, correct step sequence
79. Widget test: `HelpSafetyScreen` — accessible without auth, contains phone numbers
80. Performance test: `CravingToolkitScreen` cold open ≤ 1000ms (Flutter DevTools Timeline)

---

## 11. File-Level Change Matrix

### New Files to Create

| File | Type | Feature |
|------|------|---------|
| `craving_toolkit/data/models/toolkit_exercise_model.dart` | Isar model | Toolkit |
| `craving_toolkit/data/models/toolkit_exercise_model.g.dart` | Generated | Toolkit |
| `craving_toolkit/data/models/toolkit_session_model.dart` | Isar model | Toolkit |
| `craving_toolkit/data/models/toolkit_session_model.g.dart` | Generated | Toolkit |
| `craving_toolkit/data/models/journal_entry_model.dart` | Isar model | Journal |
| `craving_toolkit/data/models/journal_entry_model.g.dart` | Generated | Journal |
| `craving_toolkit/data/datasources/toolkit_seed_service.dart` | Service | Toolkit |
| `craving_toolkit/data/repositories/toolkit_repository_impl.dart` | Repo impl | Toolkit |
| `craving_toolkit/data/repositories/journal_repository_impl.dart` | Repo impl | Journal |
| `craving_toolkit/domain/entities/toolkit_exercise.dart` | Entity | Toolkit |
| `craving_toolkit/domain/entities/toolkit_session.dart` | Entity | Toolkit |
| `craving_toolkit/domain/entities/journal_entry.dart` | Entity | Journal |
| `craving_toolkit/domain/entities/mood_tag.dart` | Enum | Journal |
| `craving_toolkit/domain/entities/breathing_pattern.dart` | Entity | Toolkit |
| `craving_toolkit/domain/repositories/i_toolkit_repository.dart` | Interface | Toolkit |
| `craving_toolkit/domain/repositories/i_journal_repository.dart` | Interface | Journal |
| `craving_toolkit/domain/usecases/get_exercises_for_mode_usecase.dart` | Use case | Toolkit |
| `craving_toolkit/domain/usecases/toggle_favorite_usecase.dart` | Use case | Toolkit |
| `craving_toolkit/domain/usecases/record_session_usecase.dart` | Use case | Toolkit |
| `craving_toolkit/domain/usecases/get_recent_exercises_usecase.dart` | Use case | Toolkit |
| `craving_toolkit/domain/services/toolkit_catalogue.dart` | Static data | Toolkit |
| `craving_toolkit/presentation/providers/toolkit_provider.dart` | Providers | Toolkit |
| `craving_toolkit/presentation/providers/journal_provider.dart` | Providers | Journal |
| `craving_toolkit/presentation/screens/urge_surfing_screen.dart` | Screen | Toolkit |
| `craving_toolkit/presentation/screens/delay_distract_screen.dart` | Screen | Toolkit |
| `craving_toolkit/presentation/screens/cognitive_reframing_screen.dart` | Screen | Toolkit |
| `craving_toolkit/presentation/screens/relapse_recovery_plan_screen.dart` | Screen | Toolkit |
| `craving_toolkit/presentation/screens/journal_entry_screen.dart` | Screen | Journal |
| `craving_toolkit/presentation/screens/journal_list_screen.dart` | Screen | Journal |
| `craving_toolkit/presentation/widgets/exercise_card.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/exercise_chip.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/duration_chip.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/mode_badge.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/favorite_button.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/breathing_circle.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/post_exercise_feedback_sheet.dart` | Widget | Toolkit |
| `craving_toolkit/presentation/widgets/grounding_step_prompt.dart` | Widget | Toolkit |
| `core/widgets/multi_select_chip_group.dart` | Widget | Shared |
| `relapse_prevention/data/models/lapse_recovery_session_model.dart` | Isar model | Relapse |
| `relapse_prevention/data/models/lapse_recovery_session_model.g.dart` | Generated | Relapse |
| `relapse_prevention/data/static/crisis_helplines.dart` | Static data | Help |
| `relapse_prevention/domain/entities/lapse_recovery_session.dart` | Entity | Relapse |
| `relapse_prevention/domain/entities/lapse_recovery_action.dart` | Enum | Relapse |
| `relapse_prevention/domain/entities/crisis_helpline.dart` | Entity | Help |
| `relapse_prevention/domain/repositories/i_relapse_repository.dart` | Interface | Relapse |
| `relapse_prevention/presentation/providers/help_safety_provider.dart` | Providers | Help |
| `relapse_prevention/presentation/screens/lapse_recovery_screen.dart` | Screen | Relapse |
| `relapse_prevention/presentation/screens/recovery_guide_screen.dart` | Screen | Relapse |
| `relapse_prevention/presentation/screens/help_safety_screen.dart` | Screen | Help |
| `relapse_prevention/presentation/screens/edit_custom_steps_screen.dart` | Screen | Relapse |
| `relapse_prevention/presentation/widgets/lapse_recovery_option_card.dart` | Widget | Relapse |
| `relapse_prevention/presentation/widgets/crisis_helpline_card.dart` | Widget | Help |
| `relapse_prevention/presentation/widgets/recovery_stats_card.dart` | Widget | Relapse |
| `interventions/domain/services/content_audit_service.dart` | Service | Notifications |
| `core/navigation/help_navigation.dart` | Navigation | Help |

### Files to Modify

| File | Changes |
|------|---------|
| `craving_toolkit/data/models/toolkit_models.dart` | Add `ExerciseCategory` enum; keep `BreathingPattern`, `GroundingExercise`, `CbtTechnique` |
| `craving_toolkit/presentation/screens/breathing_exercise_screen.dart` | Fix per-pattern phase timing; add `BreathingCircle`; wire session recording |
| `craving_toolkit/presentation/screens/grounding_exercise_screen.dart` | Replace static content with stepped PageView flow |
| `craving_toolkit/presentation/screens/cbt_technique_screen.dart` | Add interactive prompts; wire journal CTA; wire session recording |
| `craving_toolkit/presentation/screens/craving_toolkit_screen.dart` | Wire to repository; add Favorites, Recents, mode filter; add duration estimates |
| `interventions/data/models/notification_models.dart` | Add `permissionDeniedAt`, `quitDatePrepEnabled`, `userMode` fields; fix default frequency |
| `interventions/data/models/notification_models.g.dart` | Regenerate |
| `interventions/data/notification_content.dart` | Add mode-specific pools; expose all pools as public lists for audit |
| `interventions/data/repositories/notification_repository.dart` | Fix `markOpened()` — use ID not title+time filter |
| `interventions/presentation/providers/notification_provider.dart` | Add debounce to `_update()`; fix `currentUserIdProvider` import |
| `interventions/presentation/screens/notifications_settings_screen.dart` | Replace `DropdownButton` with `showTimePicker`; fix `DropdownButtonFormField` |
| `interventions/presentation/screens/notifications_permissions_banner.dart` | Fix iOS permission check |
| `interventions/services/notification_manager.dart` | Add `requestPermissionsIfAppropriate()`; add `scheduleQuitDatePrep()`; add `scheduleBedtimeReminder()` |
| `interventions/services/notification_scheduler_service.dart` | Fix `cancelAll` → `_cancelFuture`; fix `isInQuietHours`; fix dynamic cast; add mode param to `_selectTypes` |
| `interventions/services/push_notification_service.dart` | Fix `hasPermission()` iOS branch |
| `relapse_prevention/data/models/relapse_models.dart` | Add `personalRecoveryNote`, `lastReviewedAt` to `RelapsePlan`; add `LapseRecoverySessionModel` |
| `relapse_prevention/data/models/relapse_models.g.dart` | Regenerate |
| `relapse_prevention/data/repositories/relapse_repository.dart` | Add recovery session CRUD; add contact count validation; add `personalRecoveryNote` update |
| `relapse_prevention/presentation/providers/relapse_provider.dart` | Full rewrite as `AsyncNotifier` |
| `relapse_prevention/presentation/screens/edit_panic_steps_screen.dart` | Fix race condition in `_loadSteps()` |
| `relapse_prevention/presentation/screens/panic_mode_screen.dart` | Add fade-in animation; fix `_callEmergencyContact` async pattern |
| `relapse_prevention/presentation/screens/relapse_plan_screen.dart` | Replace dialog with `EditCustomStepsScreen`; add personal note section |
| `relapse_prevention/presentation/widgets/panic_button.dart` | Add `WidgetsBindingObserver` for battery fix |
| `core/services/database/isar_service.dart` | Register new Isar schemas |
| `main.dart` | Wire `ToolkitSeedService.seedIfNeeded()` |
| `app.dart` | Fix permission bootstrap — do not call `requestPermissions()` on startup |

---

## 12. Acceptance Criteria Checklist

### Craving Toolkit

- [ ] `CravingToolkitScreen` opens from dashboard FAB in < 1 second (FR-T01)
- [ ] Toolkit contains at minimum 7 complete exercise types: breathing, grounding, urge surfing, delay-and-distract, cognitive reframing, journaling, relapse recovery planning (FR-T02)
- [ ] Smoking mode shows only smoking-relevant exercises; reduction mode shows only reduction-relevant exercises (FR-T03)
- [ ] Mode-specific wording applied to urge surfing, delay-and-distract, and cognitive reframing (FR-T03)
- [ ] Favorite toggle (heart icon) visible on each exercise card (FR-T04)
- [ ] Favorites section visible at top of toolkit when any exercise is favorited (FR-T04)
- [ ] Favorited state persisted across app restarts (FR-T04)
- [ ] "Repeat" button on recent exercises skips detail screen (FR-T04)
- [ ] Every exercise session records a `ToolkitSessionModel` with `startedAt`, `exerciseId`, `userId`, `mode` (FR-T05)
- [ ] Session `completedAt` set on completion; null if abandoned (FR-T05)
- [ ] Duration estimate chip visible on exercise cards before tapping in (FR-T06)
- [ ] `BreathingExerciseScreen` uses correct phase durations per pattern (FR-T07):
  - Box: 4-4-4-4
  - Relaxing: 4-7-8
  - Energizing: 6-2
  - Calm: 4-6
- [ ] Phase label changes synchronously with animation phase (FR-T07)
- [ ] `AnimationController` disposed in `dispose()` with no memory leak (SRS Pitfall 10)
- [ ] Journal entries written to Isar `JournalEntryModel`, encrypted at box level (FR-T08)
- [ ] Mood tag selection persisted with journal entry (FR-T08)
- [ ] `PostExerciseFeedbackSheet` appears after every exercise completion (FR-T04)
- [ ] Feedback rating persisted in `ToolkitSessionModel.feedbackRating` (FR-T05)
- [ ] Urge surfing has "I gave in" option that opens lapse log flow
- [ ] `ContentAuditService` unit test passes with zero violations (BR-09)
- [ ] All toolkit screens work fully offline with zero network requests (NFR-04)

### Notification System

- [ ] Permission NOT requested on first launch cold start (FR-N07)
- [ ] Permission requested after first `LogEntry` write (FR-N07)
- [ ] iOS `hasPermission()` returns accurate result (not unconditional `true`)
- [ ] `NotificationPreferences.frequency` defaults to `medium` (SRS default)
- [ ] `isInQuietHours()` correct for both same-day and overnight ranges (FR-N05)
- [ ] Scheduling does NOT cancel today's already-pending notifications
- [ ] Quit-date prep notifications scheduled at T-3 and T-1 days (smoking mode, FR-N03)
- [ ] Bedtime trigger-avoidance notification scheduled for reduction mode (FR-N04)
- [ ] Lapse recovery follow-up notification scheduled 3h after lapse event (FR-N02)
- [ ] Milestone notifications fired via `onStreakMilestone()` — connected to tracking feature
- [ ] `NotificationSettingsScreen` quiet hours use `showTimePicker` (no overflow risk)
- [ ] Preference changes debounced — schedule not rebuilt on every single toggle
- [ ] All notification templates pass `ContentAuditService.audit()` (FR-N06)
- [ ] Notifications cancelled on "Delete All Data" action (NFR-13)

### Relapse Prevention

- [ ] Logging a lapse event pushes `LapseRecoveryScreen` (SRS §8.4, FR-C07)
- [ ] `LapseRecoveryScreen` Step 0 shows "This is a data point, not a failure." (SRS §8.4)
- [ ] Zero shame language in all three steps of `LapseRecoveryScreen` (BR-09)
- [ ] Trigger selection in Step 1 is optional — Skip button visible (SRS §8.4)
- [ ] Step 2 shows three option cards: Toolkit / Recovery Guide / Close (SRS §8.4)
- [ ] Choosing "Open Toolkit" from recovery flow correctly navigates to `CravingToolkitScreen`
- [ ] `LapseRecoverySession` persisted with `userId`, `mode`, `triggers`, `chosenAction` (FR-T05)
- [ ] `HelpSafetyScreen` accessible without authentication / privacy lock bypass (SRS §15)
- [ ] `HelpSafetyScreen` shows user's emergency contacts with `tel:` call button (SRS §15)
- [ ] `HelpSafetyScreen` shows at minimum 8 static crisis helplines (SRS §15)
- [ ] `HelpSafetyScreen` makes zero network requests (NFR-04, SRS §15)
- [ ] App disclaimer present on `HelpSafetyScreen` (SRS §15, BR-07)
- [ ] `RecoveryGuideScreen` content is mode-specific and shame-free (BR-06, BR-09)
- [ ] `PanicButton` animation pauses when app is backgrounded (battery fix, BR-08)
- [ ] `EditPanicStepsScreen` loads correctly without race condition
- [ ] `EditCustomStepsScreen` is a dedicated route (no dialog-push-dialog pattern)
- [ ] Maximum 10 emergency contacts enforced with graceful UI message (AppConstants)
- [ ] Phone number validation in contact add/edit dialog
- [ ] `relapseNotifierProvider` correctly awaits `userId` before `_loadData()` (no empty-string calls)
- [ ] `RelapsePlan` personal recovery note field persisted and displayed
- [ ] Recovery statistics (recoveryCount, commonTriggers) surfaced on Progress tab
- [ ] `PanicModeScreen` fade-in animation plays on open
- [ ] Panic mode step navigation correctly routes to correct exercise screen per `actionType` and `actionData`
- [ ] `ContentAuditService.audit()` run against `RecoveryGuideScreen` static content

---

*End of Interventions & Relapse Prevention Enhancement Plan v2.0*

**Stack confirmation:** Flutter · Isar · Riverpod (AsyncNotifier / StateNotifier / FutureProvider / StreamProvider) · Clean Architecture  
**Next document:** `QUITMATE_GAMIFICATION_SETTINGS_PLAN.md` — covering achievement system, badge gallery, weekly review screen, data export, and settings screen enhancements.
