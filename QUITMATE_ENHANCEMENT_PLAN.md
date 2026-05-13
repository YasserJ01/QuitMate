# QuitMate — Onboarding & Tracking Enhancement Plan
**Document Version:** 1.0  
**Status:** Ready for Implementation  
**Stack:** Flutter · Isar · Riverpod · Clean Architecture  
**Scope:** Onboarding Feature · Tracking Feature

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Current State Analysis](#current-state-analysis)
3. [SRS Compliance Gaps](#srs-compliance-gaps)
4. [Onboarding Feature — Enhancement Plan](#onboarding-feature--enhancement-plan)
5. [Tracking Feature — Enhancement Plan](#tracking-feature--enhancement-plan)
6. [Optional Profile Logic — Cross-Feature Design](#optional-profile-logic--cross-feature-design)
7. [Data Model Revisions](#data-model-revisions)
8. [State Management Revisions](#state-management-revisions)
9. [Implementation Sequence](#implementation-sequence)
10. [File-Level Change Matrix](#file-level-change-matrix)
11. [Acceptance Criteria Checklist](#acceptance-criteria-checklist)

---

## 1. Executive Summary

The current codebase delivers a functional skeleton for QuitMate but diverges from the SRS v2.0 spec in several critical ways. This document defines a precise, developer-ready enhancement plan covering two feature areas:

- **Onboarding** — expanded mode-specific profile forms, optional field handling with personalization hooks, correct mode isolation, and a values-clarification step for reduction mode.
- **Tracking / Dashboard** — mode-aware dashboard metrics, lapse handling without streak reset, streak logic aligned with SRS definitions, and the craving toolkit integration trigger.

All changes retain **Isar** as the local database and **Riverpod** (StateNotifier + FutureProvider) as the state management layer. No Hive, no BLoC.

---

## 2. Current State Analysis

### 2.1 Onboarding — What Exists

| File | Role | Status |
|------|------|--------|
| `welcome_screen.dart` | Entry point, feature highlights | ✅ Functional, minor copy gaps |
| `goal_selection_screen.dart` | Mode selection UI | ⚠️ Allows `GoalType.both` — violates BR-01 |
| `baseline_screen.dart` | Single combined profile form | ⚠️ Missing mode-specific fields per SRS §7.1–7.2 |
| `quit_date_screen.dart` | Quit date picker | ⚠️ Missing gradual reduction plan option (FR-S07) |
| `onboarding_provider.dart` | State notifier | ⚠️ Missing extended profile fields; no optional-field tracking |
| `user_profile.dart` (Isar) | Data model | ⚠️ Missing SmokeProfile and ReductionProfile embedded objects |
| `goal_type.dart` | Enums | ⚠️ `GoalType.both` must be removed per SRS BR-01 |

### 2.2 Tracking — What Exists

| File | Role | Status |
|------|------|--------|
| `dashboard_screen.dart` | Main dashboard | ⚠️ Not mode-aware; no lapse recovery flow |
| `statistics_calculator.dart` | Core streak/stats logic | ⚠️ Streak resets on lapse (should only pause current streak) |
| `statistics_provider.dart` | Stats state | ⚠️ No weekly review, no milestone notification trigger |
| `log_entry.dart` | Log model | ⚠️ Missing event types from SRS §9.2 |
| `quick_log_sheet.dart` | Quick log UX | ⚠️ `GoalType.both` references; missing lapse recovery step |
| `streak_card.dart` | Streak widget | ⚠️ No recovery count display |

### 2.3 Key Violations Summary

| SRS Rule | Violation | Priority |
|----------|-----------|----------|
| BR-01 | `GoalType.both` allowed | MUST fix |
| BR-02 | Mode not locked after onboarding | MUST fix |
| BR-08 | Lapse resets streak (game-over pattern) | MUST fix |
| FR-S01 | Missing TTFC, HSI fields, years smoking | MUST fix |
| FR-M01 | Missing distress scale, sleep/focus effect | MUST fix |
| FR-C07 | No lapse recovery flow | MUST fix |
| US-DB-02 | Money saved formula not wired to profile | MUST fix |
| US-DB-03 | Time reclaimed metric missing | MUST fix |

---

## 3. SRS Compliance Gaps

### 3.1 Onboarding Gaps

```
SRS §7.2 FR-S01 → Smoking form missing: TTFC, years smoking, previous quit attempts,
                   previous aids, smoking windows, confidence level (1–10)

SRS §7.3 FR-M01 → Reduction form missing: time-of-day patterns, pornography involvement
                   (optional), distress level (1–10 scale), sleep/focus effect ratings,
                   previous reduction attempts, confidence level

SRS §6.1         → Values clarification step (optional, skippable) missing for
                   reduction mode

SRS §6.2 US-ON02 → 'Skip' option on each field must be visible; currently form blocks 
                   on empty required fields
                   
SRS §6.2 US-ON03 → Personalization explanation line missing above form

SRS §4.2 BR-03   → No explanation text conveying that completing profile improves
                   personalization quality

SRS §7.1 FR-C04  → Profile encrypted in Isar — encryption key must be stored in
                   flutter_secure_storage (partially done via isar_service.dart
                   but encryption is commented out)
```

### 3.2 Tracking Gaps

```
SRS §8.4         → Lapse recovery flow entirely missing (multi-step bottom sheet)

SRS §9.2         → LogType enum missing: CRAVING_DELAYED, REPLACEMENT_ACTION,
                   URGE_EPISODE, PORN_EXPOSURE, COPING_ACTION, LAPSE_RECOVERY,
                   DAILY_CHECKIN, JOURNAL_ENTRY

SRS §13.6        → Streak resets on LAPSE; SRS requires: current streak → 0,
                   longestStreak preserved, recoveryCount + 1

SRS §7.2 FR-S08  → Health milestone timeline computed but not linked to quit date
                   timestamps correctly

SRS §8.1 US-DB-03 → Time reclaimed metric for reduction mode not computed

SRS §7.6 FR-P04  → recoveryCount stat not displayed anywhere

SRS §10.4        → Reduction dashboard uses same layout as smoking dashboard;
                   should show: distress trend sparkline, urges resisted, values anchor
```

---

## 4. Onboarding Feature — Enhancement Plan

### 4.1 Architecture Changes

The onboarding flow must split into two mode-specific branches after `GoalSelectionScreen`. No shared profile form. The state machine becomes:

```
WelcomeScreen
    └─► GoalSelectionScreen (2 options only: Quit Smoking | Reduce Masturbation)
            ├─► SmokingProfileFormScreen  (multi-step, all optional)
            │       Step 1: Baseline habits (CPD, TTFC, years, pack cost)
            │       Step 2: Triggers & windows
            │       Step 3: History (attempts, aids, confidence)
            │       └─► QuitDateScreen (quit date OR gradual reduction plan)
            │
            └─► ReductionProfileFormScreen  (multi-step, all optional)
                    Step 1: Frequency & time-of-day patterns
                    Step 2: Triggers & context (porn involvement — optional)
                    Step 3: Impact & history (distress, sleep, focus, confidence)
                    Step 4: Values Clarification (skippable)
                    └─► GoalSettingScreen (abstinence OR frequency reduction target)
```

### 4.2 GoalType Enum — Fix

**File:** `lib/features/onboarding/domain/entities/goal_type.dart`

Remove `GoalType.both`. Update all downstream references.

```dart
// BEFORE
enum GoalType { quitSmoking, reduceMasturbation, both }

// AFTER
enum GoalType { quitSmoking, reduceMasturbation }
```

**Rationale:** SRS BR-01 states "The user must choose either smoking or masturbation reduction — never both in the same profile." This is a hard business rule.

**Affected files to update:**
- `goal_selection_screen.dart` — remove third card
- `baseline_screen.dart` — remove `both` branching
- `quick_log_sheet.dart` — remove `GoalType.both` references
- `user_profile.g.dart` — regenerate after model change
- All `switch` statements on `GoalType`

### 4.3 GoalSelectionScreen — Revisions

**File:** `lib/features/onboarding/presentation/screens/goal_selection_screen.dart`

Changes required:
- Remove the `GoalType.both` card entirely
- Add a brief description paragraph below each goal card that expands on first tap (pre-confirm UX from US-ON01)
- Add personalization explanation line: `"Your answers help personalize your dashboard and recommendations. All data stays on your device."`
- Mode selection must not have a pre-selected default (US-ON01 acceptance criterion)

### 4.4 New: SmokingProfileFormScreen

**File:** `lib/features/onboarding/presentation/screens/smoking_profile_form_screen.dart` *(new)*

This replaces the smoking section of `baseline_screen.dart`. Implement as a `PageView` with 3 steps. Every field has a visible **Skip** button that stores `null` in state without blocking progression.

**Step 1 — Baseline Habits**

| Field | Widget | Validation | SRS Ref |
|-------|--------|------------|---------|
| Cigarettes per day (CPD) | `Slider` (1–60) + text display | Optional | FR-S01 |
| Time to first cigarette (TTFC) | `DropdownButtonFormField` (≤5 min, 6–30 min, 31–60 min, >60 min) | Optional | FR-S01 |
| Years smoking | `Slider` (1–50) | Optional | FR-S01 |
| Cost per pack | `TextFormField` (decimal) | Optional | FR-S09 |
| Cigarettes per pack | `TextFormField` (integer, default 20) | Optional | FR-S09 |

**Step 2 — Triggers & Windows**

| Field | Widget | SRS Ref |
|-------|--------|---------|
| Common triggers | `Wrap` of `FilterChip` (multi-select) | FR-S01 |
| Daily smoking windows | Multi-select chips: Morning, After meals, Social, Stress, Evening, Driving | FR-S01 |

**Step 3 — History & Confidence**

| Field | Widget | SRS Ref |
|-------|--------|---------|
| Previous quit attempts | `DropdownButtonFormField` (0, 1, 2, 3, 4+) | FR-S01 |
| Previous aids used | Multi-select chips: NRT, Medication, App, Counseling, Cold turkey, Other | FR-S01 |
| Confidence to quit | `Slider` (1–10) with emoji feedback | FR-S01 |

**Provider state additions** (see §8 below):
```dart
// SmokingProfile fields to add to OnboardingState
int? ttfc;                        // minutes index
int? yearsSmoking;
List<String> smokingWindows;
int? previousQuitAttempts;
List<String> previousAids;
int? confidenceToQuit;            // 1–10
```

### 4.5 New: ReductionProfileFormScreen

**File:** `lib/features/onboarding/presentation/screens/reduction_profile_form_screen.dart` *(new)*

4-step `PageView`. Every field skippable.

**Step 1 — Frequency & Patterns**

| Field | Widget | SRS Ref |
|-------|--------|---------|
| Episodes per week | `Slider` (1–21+) | FR-M01 |
| Time-of-day pattern | Multi-select chips: Morning, Afternoon, Evening, Night, Bedtime | FR-M01 |

**Step 2 — Triggers & Context**

| Field | Widget | SRS Ref |
|-------|--------|---------|
| Common triggers | `Wrap` of `FilterChip` | FR-M01 |
| Pornography involvement | `SwitchListTile` (optional, neutral label: "Does pornography play a role?") | FR-M01 |

> **Language note (SRS BR-06, FR-M02):** The porn involvement field label must use neutral clinical framing. Never moral framing.

**Step 3 — Impact & History**

| Field | Widget | SRS Ref |
|-------|--------|---------|
| Distress level | `Slider` (1–10) | FR-M01 |
| Effect on sleep | `DropdownButtonFormField` (Not affected, Slightly, Moderately, Severely) | FR-M01 |
| Effect on focus | Same dropdown options | FR-M01 |
| Effect on relationships | Same dropdown options | FR-M01 |
| Previous reduction attempts | `DropdownButtonFormField` (0, 1, 2, 3+) | FR-M01 |
| Confidence to reduce | `Slider` (1–10) | FR-M01 |

**Step 4 — Values Clarification (skippable)**

| Field | Widget | SRS Ref |
|-------|--------|---------|
| Personal values (multi-select) | Chips: Focus, Sleep, Relationships, Spiritual goals, Emotional regulation, Energy, Self-control | FR-M07 |
| Custom reason (text) | `TextFormField`, optional free text | FR-M07 |

> This step has a prominent "Skip for now" button. Values entered here populate the **Values Anchor Card** on the reduction dashboard (SRS §10.4).

### 4.6 Revised: QuitDateScreen / GoalSettingScreen

**Smoking path** — `QuitDateScreen` gains a toggle:
- **Quit on a specific date** (current behavior)
- **Gradual reduction plan** — exposes a schedule: reduce by X cigarettes per week over Y weeks. Stores `reductionPlan` struct in `SmokingProfile`. (FR-S07)

**Reduction path** — New `GoalSettingScreen`:
- Option A: **Full abstinence goal** (streak counts all episodes)
- Option B: **Frequency target** — user sets a numeric target (e.g., reduce from 7× to 3× per week). Stores `frequencyTarget` in `ReductionProfile`. (FR-M08)

### 4.7 Optional Field Logic & Personalization Hooks

This is a cross-cutting concern. The rule is: **every optional field that is filled enriches some downstream feature.** This table maps each optional field to the feature it unlocks:

| Optional Field | Feature Unlocked |
|----------------|-----------------|
| CPD | Money saved calc, cigarettes avoided, health milestones |
| TTFC | Heaviness of Smoking Index score, high-risk window notification |
| Pack cost | Money saved stat |
| Smoking windows | High-risk time notifications (FR-N03) |
| Triggers | Trigger analysis chart, personalized toolkit suggestions |
| Previous attempts | Personalized encouragement copy ("You've done this before…") |
| Confidence (1–10) | Motivational tone calibration in dashboard copy |
| Distress level | Distress trend chart baseline, crisis resource thresholds |
| Sleep/focus effects | Recovery metrics shown on dashboard |
| Values | Values Anchor Card on dashboard (FR-P09) |
| Frequency target | Reduction goal progress bar |

**Implementation pattern:**

Create a `ProfileCompletenessService` (pure Dart, in domain layer) that exposes a computed `ProfileCompleteness` object:

```dart
// lib/features/onboarding/domain/services/profile_completeness_service.dart

class ProfileCompleteness {
  final bool hasMoneySavingsData;   // CPD + packCost filled
  final bool hasHighRiskWindowData; // smokingWindows or timeOfDay filled
  final bool hasTriggerData;        // triggers.isNotEmpty
  final bool hasValuesData;         // values.isNotEmpty
  final bool hasDistressBaseline;   // distressLevel != null
  final bool hasHealthMilestoneData;// quitDate + CPD filled
  final double fillPercentage;      // 0.0–1.0 for progress indicator

  const ProfileCompleteness({...});
}

class ProfileCompletenessService {
  ProfileCompleteness evaluate(UserProfile profile) { ... }
}
```

Providers that need this (dashboard, notifications, toolkit) call:
```dart
final completenessProvider = Provider<ProfileCompleteness>((ref) {
  final profile = ref.watch(userProfileProvider).value;
  if (profile == null) return ProfileCompleteness.empty();
  return ProfileCompletenessService().evaluate(profile);
});
```

Dashboard widgets gate their rendering on `completeness.hasMoneySavingsData`, etc., and show a gentle "Complete your profile" nudge card when key fields are missing.

### 4.8 Mode Lock After Onboarding

**File:** `lib/core/services/storage/secure_storage_service.dart`

Add:
```dart
static const _modeLockedKey = 'mode_locked';

Future<bool> isModeLocked() async { ... }
Future<void> lockMode() async { ... }  // called at end of onboarding
```

**File:** `lib/features/onboarding/presentation/providers/onboarding_provider.dart`

Call `_secureStorage.lockMode()` inside `completeOnboarding()` after saving profile.

**Settings — Reset Profile:** `Settings > Reset Profile` must call `_secureStorage.deleteAll()` and navigate back to `WelcomeScreen`. This is the **only** path to unlock mode selection (BR-02).

### 4.9 Onboarding Completion & Navigation

After `completeOnboarding()` succeeds:
1. Mark `has_completed_onboarding = true`
2. Lock mode
3. Navigate with `pushAndRemoveUntil` to `DashboardScreen`
4. `DashboardScreen` reads mode from Isar profile and renders the correct dashboard variant

---

## 5. Tracking Feature — Enhancement Plan

### 5.1 LogType Enum — Expand

**File:** `lib/features/tracking/data/models/log_entry.dart`

The current `LogType` enum is too coarse. Align with SRS §9.2 event types:

```dart
enum LogType {
  // Shared
  cravingLogged,       // was: craving
  cravingDelayed,      // NEW — user delayed acting on craving
  lapse,               // was: relapse — rename for clinical neutrality
  triggerObserved,     // NEW
  copingAction,        // NEW — toolkit exercise used
  lapseRecovery,       // NEW — user entered recovery flow
  dailyCheckin,        // NEW
  journalEntry,        // NEW

  // Smoking-specific
  cigaretteSmoked,     // was: cigarette
  replacementAction,   // NEW — oral substitute used

  // Reduction-specific
  urgeEpisode,         // was: episode — rename for clarity
  pornExposure,        // NEW — optional, neutral label
}
```

> **Migration note:** Existing records using old enum names (`cigarette`, `episode`, `craving`, `relapse`) must be handled via Isar migration or enum value mapping during read. Add a `_legacyMap` in the repository layer.

### 5.2 Lapse Recovery Flow — New Feature

**File:** `lib/features/tracking/presentation/screens/lapse_recovery_screen.dart` *(new)*

This is a multi-step `DraggableScrollableSheet` or full-screen modal triggered immediately after a `lapse` event is logged. Per SRS §8.4:

**Step 1 — Acknowledgment**
- Display: `"This is a data point, not a failure. Let's keep going."`
- Never show a red cross, failure icon, or "streak broken" language

**Step 2 — Trigger Identification (optional)**
- Trigger picker (same chips as log sheet)
- "Skip this step" button

**Step 3 — Next Action**
Three tappable cards:
1. `"Open the Craving Toolkit"` → navigates to `CravingToolkitScreen`
2. `"Read the Recovery Guide"` → navigates to mode-specific static article
3. `"I'm ready to continue"` → dismisses, returns to dashboard

**Streak State After Lapse (StatisticsCalculator fix):**
```
currentStreak     → reset to 0
longestStreak     → preserved (never decremented)
recoveryCount     → incremented by 1
lapseDate         → stored in UserProfile for notification scheduling
```

**Post-lapse notification** (FR-N02): Schedule a 3-hour delayed local notification:
`"How are you feeling? Open QuitMate anytime — your journey continues."`

### 5.3 Mode-Aware Dashboard

**File:** `lib/features/tracking/presentation/screens/dashboard_screen.dart`

Replace the current monolithic dashboard with a factory pattern:

```dart
// dashboard_screen.dart
Widget _buildDashboardBody(UserProfile profile) {
  return switch (profile.goalType) {
    GoalType.quitSmoking    => SmokingDashboard(profile: profile),
    GoalType.reduceMasturbation => ReductionDashboard(profile: profile),
  };
}
```

#### 5.3.1 SmokingDashboard Widget

**File:** `lib/features/tracking/presentation/widgets/smoking_dashboard.dart` *(new)*

Component list per SRS §10.4:

1. **AppBar** — "QuitMate" + mode chip "Quit Smoking" + settings icon
2. **Hero Streak Section** — large counter (days + hours), animated flame icon, milestone label
3. **Stats Row** (horizontal scroll):
   - Money Saved card (shown only if `completeness.hasMoneySavingsData`)
   - Cigarettes Avoided card
   - Health Milestone card
4. **Craving Status Chip** — "Craving level today: Low/Medium/High" (updates after check-in)
5. **Quick Actions Row** — [Log Event] [Open Toolkit] [Read Today's Tip]
6. **Health Milestone Progress Bar** — "Next: Improved lung function in 12 days"
7. **Daily Check-In Banner** (dismissible) — "How are you doing today?"
8. **Profile Completion Nudge Card** (conditional) — shown if `fillPercentage < 0.5`

#### 5.3.2 ReductionDashboard Widget

**File:** `lib/features/tracking/presentation/widgets/reduction_dashboard.dart` *(new)*

Component list per SRS §10.4:

1. **AppBar** — "QuitMate" + mode chip "My Focus Journey" + settings icon
2. **Hero Streak Section** — streak counter + calm leaf/shield icon (not flame), urges resisted today
3. **Stats Row**:
   - Time Reclaimed card (shown only if `episodeDuration` set in profile)
   - Urges Resisted card
   - Distress Trend card (sparkline, requires ≥3 data points per FR-P03)
4. **Values Anchor Card** — "Your reasons: [Focus] [Sleep] [Relationships]" — tap to edit (shown if `completeness.hasValuesData`)
5. **Quick Actions Row** — [Log Urge] [Open Toolkit] [Journal Entry]
6. **Distress Trend Chart** — 7-day line chart, distress self-rating 1–10
7. **Daily Check-In Banner** (dismissible)

> **Money saved is NOT shown** in reduction mode by default (SRS FR-M03). User can enable "time savings" framing in Settings.

### 5.4 Streak Calculation Fixes

**File:** `lib/features/tracking/services/statistics_calculator.dart`

The existing streak logic iterates day-by-day from `quitDate` which is largely correct but has these bugs:

**Bug 1: Streak reset on lapse.** Currently `currentStreak` goes to 0 and `longestStreak` is also affected. Fix:
```dart
// In _calculateStreakData:
// When a relapse day is found:
if (tempStreak > longestStreak) longestStreak = tempStreak;
tempStreak = 0;
// DO NOT update longestStreak after assignment above
```

**Bug 2: Recovery count not returned.** Add `recoveryCount` to the return map:
```dart
return {
  'currentStreak': currentStreak,
  'longestStreak': longestStreak,
  'recoveryCount': relapseCount,  // NEW
  ...
};
```

**Bug 3: Hours display for <1 day streaks.** When `currentStreak == 0` (quit date is today), display hours and minutes since quit time, not "0 Days":
```dart
// In StreakCard widget
String _formatStreakDisplay(int days, DateTime? quitDate) {
  if (days == 0 && quitDate != null) {
    final hours = DateTime.now().difference(quitDate).inHours;
    final minutes = DateTime.now().difference(quitDate).inMinutes % 60;
    return '${hours}h ${minutes}m';
  }
  return '$days ${days == 1 ? "Day" : "Days"}';
}
```

**Bug 4: Timezone.** All datetimes must be stored in UTC. Add `.toUtc()` on all `DateTime.now()` calls in Isar writes and `.toLocal()` on all display calls. (SRS §13.6)

### 5.5 Money Saved — Wire to Profile

**File:** `lib/features/tracking/services/statistics_calculator.dart`

Current logic in `_calculateMoneySaved` correctly uses `profile.dailySmokingCost` but `dailySmokingCost` is a computed getter that requires `costPerPack`, `cigarettesPerPack`, and `cigarettesPerDay` to all be non-null. If any field is null (user skipped), it returns null and the card disappears — which is correct per the optional field logic.

Additional requirement: gate the `SavingsCard` and `HealthMetricsCard` widgets on `completeness.hasMoneySavingsData`. This removes the silent "0" display issue when the user skipped cost fields.

### 5.6 Time Reclaimed Metric — Reduction Mode

**File:** `lib/features/tracking/services/statistics_calculator.dart`

Add new calculation method:

```dart
static Map<String, dynamic> _calculateTimeReclaimed(
  List<LogEntry> logs,
  ReductionProfile? profile,
) {
  // episodeDuration: user-set estimate in minutes (stored in ReductionProfile)
  // Episodes avoided = (baselineEpisodesPerWeek / 7 * daysTracking) - actualEpisodes
  if (profile?.episodeDuration == null || profile?.baselineFrequencyPerWeek == null) {
    return {'timeReclaimedMinutes': null, 'episodesAvoided': null};
  }
  
  final daysSinceStart = ...;
  final baselineEpisodes = (profile!.baselineFrequencyPerWeek! / 7) * daysSinceStart;
  final actualEpisodes = logs.where((l) => l.type == LogType.urgeEpisode).length;
  final episodesAvoided = (baselineEpisodes - actualEpisodes).clamp(0, double.infinity).toInt();
  final timeReclaimedMinutes = episodesAvoided * profile.episodeDuration!;
  
  return {
    'timeReclaimedMinutes': timeReclaimedMinutes,
    'episodesAvoided': episodesAvoided,
  };
}
```

**Display:** `TimeReclaimedCard` widget formats output as "Xh Ym" or "Xm" and only renders when `timeReclaimedMinutes != null`.

### 5.7 Recovery Count Display

**File:** `lib/features/tracking/presentation/widgets/streak_card.dart`

Add a secondary row below the streak counter:

```dart
if (statistics.recoveryCount > 0)
  Text(
    'You have recovered ${statistics.recoveryCount} ${statistics.recoveryCount == 1 ? "time" : "times"}.',
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
  ),
```

Per SRS §8.4: "recovery count" is framed positively as resilience, never as failure count.

### 5.8 Quick Log Sheet — Mode-Aware

**File:** `lib/features/tracking/presentation/widgets/quick_log_sheet.dart`

Replace `GoalType.both` handling with a clean switch:

```dart
switch (profile.goalType) {
  case GoalType.quitSmoking:
    return [_cigaretteSmoked, _cravingLogged, _cravingDelayed];
  case GoalType.reduceMasturbation:
    return [_urgeEpisode, _cravingLogged, _urgeResisted];
}
```

After logging a `lapse` type event, immediately navigate to `LapseRecoveryScreen` instead of showing a SnackBar.

---

## 6. Optional Profile Logic — Cross-Feature Design

### 6.1 Philosophy

Optional fields are **never required** to use the app but each one unlocks a concrete, visible feature. The user sees the benefit immediately — this drives voluntary completion without coercion.

### 6.2 Profile Completeness Provider

```dart
// lib/features/onboarding/presentation/providers/profile_completeness_provider.dart

final profileCompletenessProvider = FutureProvider<ProfileCompleteness>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) return ProfileCompleteness.empty();
  final profile = await ref.read(profileRepositoryProvider).getProfile(userId);
  if (profile == null) return ProfileCompleteness.empty();
  return ProfileCompletenessService().evaluate(profile);
});
```

### 6.3 Feature Gate Pattern

Any widget that depends on an optional profile field follows this pattern:

```dart
// Example: SavingsCard
final completeness = ref.watch(profileCompletenessProvider);

return completeness.when(
  data: (c) => c.hasMoneySavingsData
      ? SavingsCard(statistics: stats)
      : ProfileNudgeCard(
          message: 'Add your cigarette cost to see money saved',
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => const EditProfileScreen(section: ProfileSection.smokingCosts),
          )),
        ),
  loading: () => const SizedBox.shrink(),
  error: (_, __) => const SizedBox.shrink(),
);
```

### 6.4 Edit Profile Screen

**File:** `lib/features/onboarding/presentation/screens/edit_profile_screen.dart` *(new)*

Accessible from:
- Settings → Edit Profile
- Dashboard nudge cards (deep-linked to specific section)

This screen renders the relevant profile form section (smoking or reduction) in edit mode, pre-populated with existing values. On save, calls `profileRepository.updateProfile(...)` and invalidates `profileCompletenessProvider`.

### 6.5 Personalization Copy Rules

When optional fields are filled, dashboard and notification copy adapts:

| Condition | Copy Variation |
|-----------|---------------|
| `confidence ≤ 4` | More frequent encouragement nudges, offer toolkit proactively |
| `confidence ≥ 8` | Less frequent check-ins, milestone framing emphasised |
| `triggers.isNotEmpty` | Weekly summary calls out top trigger: "Stress was your main trigger this week" |
| `smokingWindows.contains('morning')` | Morning check-in notification offered |
| `values.isNotEmpty` | Values Anchor Card shown; values referenced in lapse recovery copy |
| `previousAttempts > 0` | Encouragement: "You've built experience from past attempts" |

---

## 7. Data Model Revisions

### 7.1 UserProfile — Isar Model

**File:** `lib/features/onboarding/data/models/user_profile.dart`

The flat `UserProfile` model must be extended. Because Isar does not support nested embedded objects in the same way as documented in SRS (which was written for Hive), we use a JSON-serialized string approach for the sub-profiles, consistent with the existing `smokingProfileJson` / `reductionProfileJson` field names in `isar_service.dart`.

**New fields to add:**

```dart
@collection
class UserProfile {
  // Existing fields (keep as-is)
  Id id = Isar.autoIncrement;
  @Index(unique: true) late String userId;
  String? nickname;
  @Enumerated(EnumType.name) late GoalType goalType;
  late DateTime createdAt;
  DateTime? updatedAt;

  // Mode lock flag
  bool modeLocked = false;

  // Streak data (denormalized for fast reads — SRS §13.6)
  int longestStreakDays = 0;
  int recoveryCount = 0;
  DateTime? lastLapseAt;           // UTC — for post-lapse notification scheduling

  // Smoking profile (nullable — only set if goalType == quitSmoking)
  int? cigarettesPerDay;
  int? cigarettesPerPack;
  double? costPerPack;
  int? ttfcMinutesIndex;           // NEW: 0=≤5min, 1=6-30min, 2=31-60min, 3=>60min
  int? yearsSmoking;               // NEW
  String? reductionPlanJson;       // NEW: gradual reduction schedule as JSON string
  int? previousQuitAttempts;       // NEW
  List<String> previousAids = [];  // NEW
  int? confidenceToQuit;           // NEW: 1–10
  List<String> smokingWindows = []; // NEW: time-of-day risk windows

  // Reduction profile (nullable — only set if goalType == reduceMasturbation)
  int? episodesPerWeek;
  int? episodeDurationMinutes;     // NEW: user estimate for time reclaimed calc
  bool? pornInvolvementFlag;       // NEW: optional, user-volunteered
  int? distressLevel;              // NEW: 1–10
  int? sleepEffectIndex;           // NEW: 0=None, 1=Slight, 2=Moderate, 3=Severe
  int? focusEffectIndex;           // NEW
  int? relationshipEffectIndex;    // NEW
  int? previousReductionAttempts;  // NEW
  int? confidenceToReduce;         // NEW: 1–10
  int? frequencyTarget;            // NEW: episodes/week goal
  List<String> timeOfDayPatterns = []; // NEW: morning, evening, bedtime, etc.
  List<String> values = [];        // NEW: personal motivation values

  // Shared
  List<String> triggers = [];      // already exists — keep

  // Quit/start date
  DateTime? quitDate;              // already exists — keep (UTC)
}
```

> **Isar schema note:** After any field addition, append at the highest index. Never reuse or reorder indices. Regenerate `user_profile.g.dart` with `flutter pub run build_runner build`.

### 7.2 Statistics Model

**File:** `lib/features/tracking/data/models/statistics.dart`

Add missing fields:

```dart
class Statistics {
  // ... existing fields ...

  // NEW fields
  final int recoveryCount;
  final int? timeReclaimedMinutes;   // null when profile data insufficient
  final int? episodesAvoided;        // null when profile data insufficient
  final List<double> distressTrend;  // last 7 daily distress ratings, empty if none
}
```

### 7.3 ReductionProfile Distress Log

Distress ratings are logged as part of the daily check-in, not stored in `UserProfile`. A `DAILY_CHECKIN` log event should carry a `distressRating` (1–10) field. Add `int? distressRating` to `LogEntry`:

```dart
// lib/features/tracking/data/models/log_entry.dart
int? distressRating;  // NEW: 1–10 scale for daily check-in events
```

---

## 8. State Management Revisions

### 8.1 OnboardingState — Extended

**File:** `lib/features/onboarding/presentation/providers/onboarding_provider.dart`

```dart
class OnboardingState {
  // Existing
  final String userId;
  final String? nickname;
  final GoalType? goalType;
  final DateTime? quitDate;
  final int currentStep;
  final bool isLoading;
  final String? error;

  // Smoking profile fields
  final int? cigarettesPerDay;
  final double? costPerPack;
  final int? cigarettesPerPack;
  final int? ttfcMinutesIndex;
  final int? yearsSmoking;
  final List<String> smokingWindows;
  final int? previousQuitAttempts;
  final List<String> previousAids;
  final int? confidenceToQuit;
  final bool isGradualReduction;
  final String? reductionPlanJson;

  // Reduction profile fields
  final int? episodesPerWeek;
  final int? episodeDurationMinutes;
  final bool? pornInvolvementFlag;
  final int? distressLevel;
  final int? sleepEffectIndex;
  final int? focusEffectIndex;
  final int? relationshipEffectIndex;
  final int? previousReductionAttempts;
  final int? confidenceToReduce;
  final int? frequencyTarget;
  final List<String> timeOfDayPatterns;
  final List<String> values;

  // Shared
  final List<TriggerType> triggers;  // already exists
}
```

Add corresponding setters in `OnboardingNotifier`. All setters are simple `state = state.copyWith(...)` calls.

### 8.2 DashboardProvider — Mode-Aware

**File:** `lib/features/tracking/presentation/providers/dashboard_provider.dart` *(new)*

```dart
// Unified provider that returns the correct dashboard data based on mode
final dashboardDataProvider = FutureProvider.autoDispose<DashboardData>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  final profile = await ref.read(profileRepositoryProvider).getProfile(userId!);
  final completeness = ProfileCompletenessService().evaluate(profile!);
  final stats = ref.read(statisticsProvider).statistics;

  return DashboardData(
    profile: profile,
    statistics: stats,
    completeness: completeness,
  );
});
```

This single provider feeds both `SmokingDashboard` and `ReductionDashboard`, keeping them dumb display widgets.

### 8.3 LapseRecoveryProvider

**File:** `lib/features/tracking/presentation/providers/lapse_recovery_provider.dart` *(new)*

```dart
class LapseRecoveryState {
  final LapseRecoveryStep step;      // enum: acknowledgment, triggerSelect, nextAction
  final List<String> selectedTriggers;
  final bool isCompleted;
}

class LapseRecoveryNotifier extends StateNotifier<LapseRecoveryState> {
  Future<void> logLapseWithRecovery({
    required String userId,
    required LogType lapseType,         // cigaretteSmoked or urgeEpisode
    List<String> triggers = const [],
  }) async {
    // 1. Write lapse LogEntry
    // 2. Update UserProfile: longestStreak unchanged, currentStreak reset, recoveryCount++
    // 3. Store lastLapseAt = DateTime.now().toUtc()
    // 4. Schedule 3-hour delayed local notification
    // 5. Invalidate statisticsProvider
  }
}
```

---

## 9. Implementation Sequence

Implement in this order to minimise merge conflicts and allow incremental testing:

### Phase 1 — Foundation (no UI changes yet)
1. Remove `GoalType.both` from enum and fix all references
2. Extend `UserProfile` Isar model with new fields; regenerate `.g.dart`
3. Extend `LogType` enum; add migration mapping in repository
4. Add `distressRating` to `LogEntry`; regenerate `.g.dart`
5. Update `Statistics` model with new fields
6. Create `ProfileCompletenessService` (pure Dart, unit-testable)
7. Fix `StatisticsCalculator` streak logic (lapse = pause not reset)
8. Add `recoveryCount` to Statistics and StreakCard

### Phase 2 — Onboarding Rebuild
9. Create `SmokingProfileFormScreen` (3-step PageView)
10. Create `ReductionProfileFormScreen` (4-step PageView)
11. Update `GoalSelectionScreen` (2 options, no pre-selection, description text)
12. Update `OnboardingState` and `OnboardingNotifier` with all new fields
13. Update `QuitDateScreen` with gradual reduction toggle
14. Create `GoalSettingScreen` for reduction path
15. Implement mode lock in `SecureStorageService` and `OnboardingNotifier`
16. Implement `EditProfileScreen` with deep-link support

### Phase 3 — Dashboard Rebuild
17. Create `SmokingDashboard` widget
18. Create `ReductionDashboard` widget
19. Refactor `DashboardScreen` to use mode factory
20. Implement `TimeReclaimedCard` widget
21. Wire `ProfileNudgeCard` with completion provider
22. Create `DashboardDataProvider`

### Phase 4 — Lapse Recovery
23. Create `LapseRecoveryScreen` (multi-step bottom sheet)
24. Create `LapseRecoveryProvider` and `LapseRecoveryNotifier`
25. Wire lapse log actions in `QuickLogSheet` to open `LapseRecoveryScreen`
26. Wire post-lapse 3-hour notification scheduling
27. Update `StreakCard` to show recovery count

### Phase 5 — Validation & QA
28. Write unit tests for `StatisticsCalculator` (streak, money saved, time reclaimed)
29. Write unit tests for `ProfileCompletenessService`
30. Widget tests for `GoalSelectionScreen` (no pre-selection, 2 options only)
31. Widget tests for `LapseRecoveryScreen` (no failure language check)
32. Integration test: complete onboarding → verify mode locked in secure storage

---

## 10. File-Level Change Matrix

| File | Action | Changes |
|------|--------|---------|
| `goal_type.dart` | Modify | Remove `GoalType.both` |
| `user_profile.dart` | Modify | Add 20+ new optional fields |
| `user_profile.g.dart` | Regenerate | Auto-generated |
| `log_entry.dart` | Modify | Expand `LogType` enum; add `distressRating` field |
| `log_entry.g.dart` | Regenerate | Auto-generated |
| `statistics.dart` | Modify | Add `recoveryCount`, `timeReclaimedMinutes`, `distressTrend` |
| `statistics_calculator.dart` | Modify | Fix streak logic; add `_calculateTimeReclaimed` |
| `onboarding_provider.dart` | Modify | Extend `OnboardingState` with all new fields and setters |
| `goal_selection_screen.dart` | Modify | Remove third card; add description text; no pre-selection |
| `baseline_screen.dart` | Delete | Replaced by mode-specific screens |
| `smoking_profile_form_screen.dart` | **Create** | 3-step PageView |
| `reduction_profile_form_screen.dart` | **Create** | 4-step PageView |
| `quit_date_screen.dart` | Modify | Add gradual reduction toggle |
| `goal_setting_screen.dart` | **Create** | Reduction mode goal selection |
| `edit_profile_screen.dart` | **Create** | Post-onboarding profile editing |
| `profile_completeness_service.dart` | **Create** | Domain service |
| `profile_completeness_provider.dart` | **Create** | Riverpod provider |
| `dashboard_screen.dart` | Modify | Mode factory pattern |
| `smoking_dashboard.dart` | **Create** | Smoking-specific dashboard |
| `reduction_dashboard.dart` | **Create** | Reduction-specific dashboard |
| `dashboard_provider.dart` | **Create** | Unified dashboard data provider |
| `lapse_recovery_screen.dart` | **Create** | Multi-step lapse recovery flow |
| `lapse_recovery_provider.dart` | **Create** | Lapse state management |
| `quick_log_sheet.dart` | Modify | Mode-aware actions; lapse → recovery screen |
| `streak_card.dart` | Modify | Add recovery count; fix hours display |
| `savings_card.dart` | Modify | Gate on completeness provider |
| `secure_storage_service.dart` | Modify | Add mode lock methods |
| `time_reclaimed_card.dart` | **Create** | New widget for reduction dashboard |
| `profile_nudge_card.dart` | **Create** | Contextual completion prompts |

---

## 11. Acceptance Criteria Checklist

### Onboarding

- [ ] `GoalType.both` does not exist anywhere in the codebase
- [ ] Goal selection screen shows exactly 2 options with no pre-selection
- [ ] Tapping a mode shows a description before confirming (US-ON01)
- [ ] Every form field has a visible Skip option (US-ON02)
- [ ] Personalization explanation line appears above each profile form (US-ON03)
- [ ] `SmokingProfileFormScreen` collects: CPD, TTFC, years smoking, pack cost, smoking windows, triggers, previous attempts, previous aids, confidence
- [ ] `ReductionProfileFormScreen` collects: frequency, time-of-day, triggers, porn involvement (optional), distress, sleep/focus/relationship effects, attempts, confidence, values
- [ ] Values clarification step is skippable without penalty
- [ ] Gradual reduction plan option exists on `QuitDateScreen` for smoking mode
- [ ] Frequency target goal option exists on `GoalSettingScreen` for reduction mode
- [ ] Mode is locked in `flutter_secure_storage` after `completeOnboarding()` completes
- [ ] Reset Profile wipes all data and returns to mode selection (BR-02)
- [ ] `ProfileCompletenessService.evaluate()` returns correct booleans for all field combinations

### Tracking

- [ ] Logging a lapse event opens `LapseRecoveryScreen` (not a SnackBar)
- [ ] `LapseRecoveryScreen` contains zero shame-language (automated content audit)
- [ ] After lapse: `currentStreak` = 0, `longestStreak` unchanged, `recoveryCount` +1
- [ ] `recoveryCount` displayed positively on `StreakCard`
- [ ] `SmokingDashboard` displays: streak, money saved (if profile complete), cigarettes avoided, health milestone
- [ ] `ReductionDashboard` displays: streak, time reclaimed (if profile complete), urges resisted, distress trend (if ≥3 points)
- [ ] Money saved card is hidden when `costPerPack`/`CPD` are null
- [ ] Time reclaimed card is hidden when `episodeDuration` is null
- [ ] Values anchor card shown on reduction dashboard when values are set
- [ ] Streak displays hours/minutes when `currentStreak == 0` and quit date is today
- [ ] All datetimes stored as UTC, displayed as local
- [ ] Post-lapse notification scheduled 3 hours after lapse event

---

*End of Enhancement Plan v1.0*

**Next document:** `QUITMATE_TOOLKIT_NOTIFICATIONS_PLAN.md` — covering craving toolkit, gamification, and local notifications features.
