# QuitMate — Gamification, Settings & Final Polish Plan

**Document Version:** 1.0  
**Status:** Ready for Implementation  
**Stack:** Flutter · Isar · Riverpod · Clean Architecture  
**Scope:** Achievement System · Badge Gallery · Weekly Review · Progress Tab · Data Export · Settings Screen · Accessibility & Polish  
**Predecessor Documents:**
- `QUITMATE_ENHANCEMENT_PLAN.md` — Onboarding & Tracking (Implemented)
- `QUITMATE_INTERVENTIONS_RELAPSE_PLAN.md` — Interventions & Relapse Prevention (Implemented)
- `QUITMATE_CRAVING_TOOLKIT_ENHANCEMENT_PLAN.md` — Craving Toolkit (Implemented)

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Current State Analysis](#2-current-state-analysis)
   - 2.1 [What Is Implemented](#21-what-is-implemented)
   - 2.2 [What Remains — Full Gap Analysis](#22-what-remains--full-gap-analysis)
   - 2.3 [SRS Violations Still Open](#23-srs-violations-still-open)
3. [SRS Compliance Requirements](#3-srs-compliance-requirements)
   - 3.1 [Achievement & Gamification Requirements](#31-achievement--gamification-requirements)
   - 3.2 [Progress & Statistics Requirements](#32-progress--statistics-requirements)
   - 3.3 [Settings & Data Management Requirements](#33-settings--data-management-requirements)
   - 3.4 [Non-Functional Requirements Still Open](#34-non-functional-requirements-still-open)
4. [Achievement & Gamification System](#4-achievement--gamification-system)
   - 4.1 [Achievement Domain Entity](#41-achievement-domain-entity)
   - 4.2 [Achievement Isar Model](#42-achievement-isar-model)
   - 4.3 [Achievement Engine — Evaluation Logic](#43-achievement-engine--evaluation-logic)
   - 4.4 [Achievement Definitions — Smoking Mode](#44-achievement-definitions--smoking-mode)
   - 4.5 [Achievement Definitions — Reduction Mode](#45-achievement-definitions--reduction-mode)
   - 4.6 [Achievement Definitions — Shared](#46-achievement-definitions--shared)
   - 4.7 [Achievement Unlock Animation](#47-achievement-unlock-animation)
   - 4.8 [Badge Gallery Screen](#48-badge-gallery-screen)
   - 4.9 [Reasons Wall Feature](#49-reasons-wall-feature)
   - 4.10 [Streak Flame Visual Enhancement](#410-streak-flame-visual-enhancement)
5. [Progress Tab — Full Implementation](#5-progress-tab--full-implementation)
   - 5.1 [Progress Tab Architecture](#51-progress-tab-architecture)
   - 5.2 [Weekly Review Screen](#52-weekly-review-screen)
   - 5.3 [Health Milestone Timeline — Smoking Mode](#53-health-milestone-timeline--smoking-mode)
   - 5.4 [Distress Trend Chart — Reduction Mode](#54-distress-trend-chart--reduction-mode)
   - 5.5 [Statistics Motivational Summary](#55-statistics-motivational-summary)
   - 5.6 [Log History Timeline Screen](#56-log-history-timeline-screen)
   - 5.7 [Toolkit History Screen](#57-toolkit-history-screen)
   - 5.8 [Recovery Statistics Section](#58-recovery-statistics-section)
6. [Settings Screen — Full Implementation](#6-settings-screen--full-implementation)
   - 6.1 [Settings Screen Architecture](#61-settings-screen-architecture)
   - 6.2 [Notification Settings Sub-Screen](#62-notification-settings-sub-screen)
   - 6.3 [Privacy & Security Sub-Screen](#63-privacy--security-sub-screen)
   - 6.4 [Theme & Display Sub-Screen](#64-theme--display-sub-screen)
   - 6.5 [Export Data Sub-Screen](#65-export-data-sub-screen)
   - 6.6 [Delete All Data Sub-Screen](#66-delete-all-data-sub-screen)
   - 6.7 [Reset Profile Sub-Screen](#67-reset-profile-sub-screen)
   - 6.8 [About / Version Sub-Screen](#68-about--version-sub-screen)
   - 6.9 [Edit Profile Sub-Screen](#69-edit-profile-sub-screen)
7. [Data Export — Full Implementation](#7-data-export--full-implementation)
   - 7.1 [Export Domain Service](#71-export-domain-service)
   - 7.2 [JSON Export Format](#72-json-export-format)
   - 7.3 [CSV Export Format](#73-csv-export-format)
   - 7.4 [Export File Sharing](#74-export-file-sharing)
   - 7.5 [Delete All Data Logic](#75-delete-all-data-logic)
8. [Privacy Lock — Full Implementation](#8-privacy-lock--full-implementation)
   - 8.1 [Local Authentication Flow](#81-local-authentication-flow)
   - 8.2 [Lock Screen Widget](#82-lock-screen-widget)
   - 8.3 [Graceful Degradation](#83-graceful-degradation)
9. [Daily Check-In Feature](#9-daily-check-in-feature)
   - 9.1 [Check-In Banner Widget](#91-check-in-banner-widget)
   - 9.2 [Check-In Flow](#92-check-in-flow)
   - 9.3 [Check-In Data Logging](#93-check-in-data-logging)
10. [Motivational Summary Engine](#10-motivational-summary-engine)
    - 10.1 [Template System](#101-template-system)
    - 10.2 [Personalization Hooks](#102-personalization-hooks)
11. [Non-Functional Requirements — Final Pass](#11-non-functional-requirements--final-pass)
    - 11.1 [Performance Targets](#111-performance-targets)
    - 11.2 [Accessibility Audit](#112-accessibility-audit)
    - 11.3 [Localization](#113-localization)
    - 11.4 [App Size & Assets](#114-app-size--assets)
    - 11.5 [Security Verification Checklist](#115-security-verification-checklist)
12. [Data Model Revisions](#12-data-model-revisions)
    - 12.1 [AchievementModel Isar Collection](#121-achievementmodel-isar-collection)
    - 12.2 [WeeklyReviewModel Isar Collection](#122-weeklyreviewmodel-isar-collection)
    - 12.3 [CheckInModel Isar Collection](#123-checkinmodel-isar-collection)
    - 12.4 [ReasonsWallModel Isar Collection](#124-reasonswallmodel-isar-collection)
    - 12.5 [Isar Registration — Final Checklist](#125-isar-registration--final-checklist)
13. [State Management Revisions](#13-state-management-revisions)
    - 13.1 [AchievementProvider Architecture](#131-achievementprovider-architecture)
    - 13.2 [ProgressProvider Architecture](#132-progressprovider-architecture)
    - 13.3 [SettingsProvider Architecture](#131-settingsprovider-architecture)
    - 13.4 [ExportProvider Architecture](#134-exportprovider-architecture)
    - 13.5 [CheckInProvider Architecture](#135-checkinprovider-architecture)
14. [Screen Inventory — Final State](#14-screen-inventory--final-state)
15. [Implementation Sequence](#15-implementation-sequence)
16. [File-Level Change Matrix](#16-file-level-change-matrix)
17. [Acceptance Criteria Checklist](#17-acceptance-criteria-checklist)
18. [QA Traceability Matrix](#18-qa-traceability-matrix)
19. [Release Gate Checklist](#19-release-gate-checklist)

---

## 1. Executive Summary

At this point in development, the four core feature areas — Onboarding, Tracking/Dashboard, Relapse Prevention/Interventions, and Craving Toolkit — are fully implemented and compliant with SRS v2.0. This document covers the final implementation phase required to ship a complete, polished, SRS-compliant baseline release.

This phase covers six functional areas:

- **Achievement & Gamification** — The complete badge system with an evaluation engine, per-mode milestone definitions, an unlock animation, the Badge Gallery screen, the Reasons Wall, and the streak flame visual intensity scaling. All grounded in the research evidence cited in SRS §3.3.
- **Progress Tab** — The full Progress/Statistics tab including the Weekly Review screen, health milestone timeline (smoking), distress trend chart (reduction), motivational summary, log history timeline, and toolkit history.
- **Settings Screen** — All settings sub-screens with fully wired actions: notification preferences, privacy lock, theme, language, export, delete, reset, and profile editing.
- **Data Export & Delete** — JSON and CSV export of all user data, share sheet integration, and the two-step delete-all-data flow that wipes every Isar box and every secure storage key.
- **Privacy Lock** — The biometric/PIN lock screen, graceful degradation path, and the authentication bypass for the Help/Safety screen.
- **Daily Check-In & Motivational Summary** — The once-per-day in-app check-in banner, the check-in flow, and the templated motivational summary generator.

Additionally, this document defines the **final NFR pass**: cold-start performance verification, accessibility audit, localization enforcement, app size measurement, and the security verification checklist that constitutes the release gate.

**Architectural constraints remain unchanged:**
- Database: **Isar** (no Hive, no SQLite)
- State management: **Riverpod** (`AsyncNotifier`, `StateNotifier`, `FutureProvider`, `StreamProvider`)
- Architecture: **Clean Architecture** — Domain has zero Flutter dependencies
- Offline-only: zero outbound network requests (NFR-01)

---

## 2. Current State Analysis

### 2.1 What Is Implemented

Based on the predecessor documents and implementation notes, the following are confirmed implemented and working:

| Feature Area | Status |
|---|---|
| Onboarding (goal selection, profile forms, mode lock) | ✅ Implemented |
| Smoking dashboard (streak, money saved, cigarettes avoided, health milestones) | ✅ Implemented |
| Reduction dashboard (streak, urges resisted, distress trend, values anchor) | ✅ Implemented |
| Log event flow (quick log sheet, all event types, lapse → recovery) | ✅ Implemented |
| Streak calculation (lapse = pause, longestStreak preserved, recoveryCount) | ✅ Implemented |
| Craving toolkit (breathing, grounding, urge surfing, CBT, delay-distract, cognitive reframing, journaling, recovery plan) | ✅ Implemented |
| Favorites & recents system in toolkit | ✅ Implemented |
| Post-exercise feedback | ✅ Implemented |
| Toolkit session tracking | ✅ Implemented |
| Lapse recovery screen (3-step flow) | ✅ Implemented |
| Panic mode screen | ✅ Implemented |
| Relapse plan builder | ✅ Implemented |
| Emergency contacts | ✅ Implemented |
| Help & Safety screen | ✅ Implemented |
| Local notifications (all types, scheduling, quiet hours) | ✅ Implemented |
| Notification settings screen | ✅ Implemented |
| Journal feature (create, edit, list, mood tags) | ✅ Implemented |

### 2.2 What Remains — Full Gap Analysis

| Feature | SRS Reference | Status |
|---|---|---|
| Achievement engine + badge definitions | FR-P06, FR-P07 | ❌ Not implemented |
| Badge Gallery screen | FR-P07 | ❌ Not implemented |
| Reasons Wall (dashboard motivational anchor) | FR-P09 | ❌ Not implemented |
| Streak flame visual intensity scaling | FR-P08 | ❌ Not implemented |
| Achievement unlock animation | FR-P06 | ❌ Not implemented |
| Weekly Review screen | FR-C16 | ❌ Not implemented |
| Log history timeline screen (full, with filters) | US-LG-05 | ❌ Not implemented |
| Toolkit history screen (session history) | FR-T05 | ❌ Not implemented |
| Motivational summary engine (templated, 3–5 sentences) | FR-P05 | ❌ Not implemented |
| Progress tab — full layout | FR-P01–FR-P09 | ❌ Stub only |
| Settings screen — all sub-screens | FR-D01–FR-D05 | ❌ Partially implemented |
| Export data (JSON + CSV, share sheet) | FR-C10, FR-D02 | ❌ Not implemented |
| Delete all data (two-step, wipe Isar + secure storage) | FR-C11, FR-D03 | ❌ Not implemented |
| Reset profile (wipe + return to mode selection) | US-ON05 | ❌ Not implemented |
| Privacy lock toggle in settings | FR-C08, FR-D01 | ❌ Not implemented |
| Privacy lock screen (biometric/PIN) | FR-C08 | ❌ Not implemented |
| Dark/light theme toggle | FR-D04 | ❌ Not implemented |
| Language selection | FR-C12 | ❌ Not implemented |
| About / version screen | FR-D05 | ❌ Not implemented |
| Daily check-in banner + flow | FR-C15 | ❌ Not implemented |
| Consistency score metric | FR-P04 | ❌ Not implemented |
| Money saved stat (fully wired) | FR-S09, US-DB-02 | ⚠️ Partial |
| Health milestone progress bar on dashboard | US-DB-05 | ⚠️ Partial |
| Cold start ≤ 2s verification | NFR-05 | ❌ Not verified |
| Dashboard render ≤ 500ms | NFR-06 | ❌ Not verified |
| WCAG 2.1 AA accessibility audit | NFR-08, NFR-09 | ❌ Not audited |
| Localization (ARB files enforced, no hardcoded strings) | FR-C12, NFR-14 | ❌ Not enforced |
| App size ≤ 30MB | NFR-15 | ❌ Not verified |
| Security audit (no plaintext in storage) | BR-04, NFR-02 | ❌ Not verified |
| Content audit (no shame language) | BR-09, NFR-10 | ❌ Not fully automated |
| Unit test coverage ≥ 80% for business logic | NFR-12 | ❌ Not verified |

### 2.3 SRS Violations Still Open

| Rule | Description | Priority |
|---|---|---|
| FR-P06 | No badge system — gamification research evidence not applied | MUST |
| FR-P07 | No Achievement Gallery screen | MUST |
| FR-C15 | No daily check-in prompt | MUST |
| FR-D01 | Settings screen incomplete — missing export, delete, privacy lock, theme | MUST |
| FR-C10 | Export data feature absent | MUST |
| FR-C11 | Delete all data feature absent | MUST |
| FR-C08 | Privacy lock toggle exists but lock screen not implemented | MUST |
| FR-C12 | Hardcoded strings present (not localized) | MUST |
| FR-P05 | No motivational summary generator | SHOULD |
| FR-P08 | Streak flame static, doesn't intensify at milestones | COULD |
| FR-P09 | Reasons Wall not wired to dashboard | SHOULD |
| NFR-05 | Cold start not performance-tested | MUST verify |
| NFR-12 | Test coverage not measured | MUST verify |

---

## 3. SRS Compliance Requirements

### 3.1 Achievement & Gamification Requirements

| FR ID | Requirement | Priority |
|---|---|---|
| FR-P06 | App shall display a badge/achievement system. Achievements awarded locally, stored in encrypted profile. | SHOULD |
| FR-P07 | App shall allow user to view all earned and locked badges in an Achievement Gallery screen. Locked badges shown with progress indicator. | SHOULD |
| FR-P08 | App shall support a visual streak flame/icon that intensifies at milestones (day 7, 30, 90). | COULD |
| FR-P09 | App shall provide a 'Reasons Wall' — user-editable list of personal motivations anchored to the dashboard. | SHOULD |
| FR-S10 | Smoking mode: badges for first day, first week, first month, 90 days, 6 months, 1 year smoke-free. | SHOULD |
| FR-M09 | Reduction mode: badges for first 3 days, first week, first 30 days, consecutive urge-delay events. Achievement copy is values-affirming, never moralistic. | SHOULD |

**Research basis (SRS §3.3):** Badges, streak tracking, and milestone recognition align with Goal-Setting Theory and reduce psychological distance to long-term goals. Earning badges was associated with increases in self-efficacy and motivation to quit smoking (Rajani et al., JMIR 2023).

### 3.2 Progress & Statistics Requirements

| FR ID | Requirement | Priority |
|---|---|---|
| FR-P01 | Mode-specific motivational statistics derived from goal and logged data. | MUST |
| FR-P02 | Smoking stats: money saved, cigarettes avoided, smoke-free time, health milestones. | MUST |
| FR-P03 | Reduction stats: time reclaimed, urges resisted, fewer compulsive cycles, better focus/sleep, lower distress trend. Distress trend requires ≥3 data points. | MUST |
| FR-P04 | Shared stats: streak duration, successful recoveries after lapse, consistency of use (% of days with ≥1 check-in). | MUST |
| FR-P05 | Motivational summary (3–5 sentences) from stats, once per day or week per user preference. Templated from local data — no LLM. | SHOULD |
| FR-C15 | Daily check-in prompt (dismissible) once per calendar day. | SHOULD |
| FR-C16 | Weekly review screen summarizing key metrics for past 7 days. Auto-generated from local log data. | SHOULD |
| US-LG-05 | Log history timeline with filters (event type, date range). Tap to expand detail. | SHOULD |

### 3.3 Settings & Data Management Requirements

| FR ID | Requirement | Priority |
|---|---|---|
| FR-D01 | Settings screen shall provide: notification configuration, privacy lock toggle, theme (light/dark), language selection, export data, delete data, reset profile, about/version info. | MUST |
| FR-D02 | Export shall produce JSON (profile + all log events + toolkit usage) and CSV (log events). | MUST |
| FR-D03 | Delete All Data: two-step confirmation, wipe all Hive boxes and secure storage keys. Action is irreversible. | MUST |
| FR-D04 | Dark mode: system dark mode + manual toggle. Uses `MediaQuery.platformBrightness`. | MUST |
| FR-D05 | About screen: current app version, offline changelog. No network call. | SHOULD |
| FR-C08 | Privacy lock using biometric/PIN. Must degrade gracefully if hardware unavailable. | SHOULD |
| FR-C10 | Local export in JSON and CSV formats. User-initiated from Settings. | MUST |
| FR-C11 | Permanently delete all local data from Settings. Two-step confirmation. | MUST |
| FR-C12 | All user-facing text localizable using Flutter's `l10n`/`intl` framework. ARB files per locale. No hardcoded strings. | MUST |
| US-ON05 | Reset profile: Settings → Reset Profile → confirmation dialog → all data wiped → mode selection screen. | MUST |

### 3.4 Non-Functional Requirements Still Open

| NFR ID | Requirement | Measurable Threshold |
|---|---|---|
| NFR-01 | Zero outbound network requests | Verified by network monitoring in QA |
| NFR-02 | AES-256 encryption. Key never in SharedPreferences or plaintext. | Security audit |
| NFR-05 | Cold start ≤ 2 seconds on 2GB RAM Android | Flutter DevTools Timeline, release mode |
| NFR-06 | Dashboard render ≤ 500ms after cold start | First meaningful paint measurement |
| NFR-07 | Primary log action ≤ 3 taps from home | UX walkthrough test |
| NFR-08 | Large text up to 200%, screen readers, WCAG 2.1 AA contrast | Flutter Accessibility Scanner + manual VoiceOver/TalkBack |
| NFR-09 | All interactive elements have semantic labels | Automated accessibility tree check |
| NFR-10 | No shame-based language in any user-facing string | Content audit grep on all ARB files |
| NFR-12 | Unit test coverage ≥ 80% for business logic layer | CI coverage report |
| NFR-13 | Export produces valid JSON/CSV. Delete verified to remove all data. | Integration test |
| NFR-14 | All user-facing text localizable. Hardcoded strings are a build error. | ARB enforcement in CI |
| NFR-15 | Install size ≤ 30 MB (Android APK split by ABI) | Release build measurement |

---

## 4. Achievement & Gamification System

### 4.1 Achievement Domain Entity

**File:** `lib/features/achievements/domain/entities/achievement.dart`

```dart
/// A badge or milestone achievement that a user can earn.
///
/// Achievements are computed on app open from LogEvent history.
/// They are never deducted — once earned, always shown as earned.
class Achievement {
  final String id;                      // stable UUID string, never reused
  final String name;                    // short display name
  final String description;             // one-sentence description
  final String iconEmoji;               // single emoji for the badge icon
  final AchievementCategory category;
  final GoalType? modeFilter;           // null = shared; GoalType.x = mode-specific
  final int progressValue;              // current progress toward this badge
  final int progressMax;                // target value (e.g. 7 for "7 days smoke-free")
  final bool isUnlocked;
  final DateTime? unlockedAt;           // UTC, null if not yet earned

  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.iconEmoji,
    required this.category,
    this.modeFilter,
    required this.progressValue,
    required this.progressMax,
    required this.isUnlocked,
    this.unlockedAt,
  });

  double get progressPercent =>
      progressMax > 0 ? (progressValue / progressMax).clamp(0.0, 1.0) : 0.0;

  bool get isInProgress => !isUnlocked && progressValue > 0;
}

enum AchievementCategory {
  streak,           // time-based streaks
  milestone,        // health or habit milestones
  resilience,       // recovery and lapse events handled well
  engagement,       // consistent check-ins, toolkit usage
  craving,          // cravings resisted
}
```

### 4.2 Achievement Isar Model

**File:** `lib/features/achievements/data/models/achievement_model.dart`

```dart
@collection
class AchievementModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String achievementId;        // stable string UUID from catalogue

  late String name;
  late String description;
  late String iconEmoji;
  late String category;             // AchievementCategory.name
  String? modeFilter;               // GoalType.name or null
  late int progressValue;
  late int progressMax;
  late bool isUnlocked;
  DateTime? unlockedAt;             // UTC

  @Index()
  late String userId;               // owner of this achievement record
}
```

**Seeding:** On first run (and after `seedIfNeeded()` count check), all achievement definitions for the user's mode are written to Isar with `isUnlocked = false` and `progressValue = 0`. The engine then immediately evaluates and updates them.

### 4.3 Achievement Engine — Evaluation Logic

**File:** `lib/features/achievements/domain/services/achievement_engine.dart`

The engine is a pure Dart class with zero Flutter dependencies. It accepts current `Statistics`, `List<LogEntry>`, and `List<Achievement>` and returns a list of `AchievementUpdate` objects indicating which achievements changed state.

```dart
class AchievementEngine {

  /// Evaluate all achievements against current statistics.
  ///
  /// Returns updates only for achievements whose [progressValue]
  /// or [isUnlocked] changed. Caller persists changes to Isar.
  List<AchievementUpdate> evaluate({
    required List<Achievement> existing,
    required Statistics statistics,
    required List<LogEntry> recentLogs,
    required GoalType mode,
  }) {
    final updates = <AchievementUpdate>[];

    for (final achievement in existing) {
      if (achievement.modeFilter != null && achievement.modeFilter != mode) {
        continue; // skip achievements from the other mode
      }

      final newProgress = _computeProgress(achievement, statistics, recentLogs);
      final newUnlocked = newProgress >= achievement.progressMax;
      final justUnlocked = newUnlocked && !achievement.isUnlocked;

      if (newProgress != achievement.progressValue ||
          newUnlocked != achievement.isUnlocked) {
        updates.add(AchievementUpdate(
          achievementId: achievement.id,
          progressValue: newProgress,
          isUnlocked: newUnlocked,
          unlockedAt: justUnlocked ? DateTime.now().toUtc() : achievement.unlockedAt,
          justUnlocked: justUnlocked,
        ));
      }
    }
    return updates;
  }

  int _computeProgress(
    Achievement achievement,
    Statistics stats,
    List<LogEntry> logs,
  ) {
    return switch (achievement.id) {
      // Streak-based
      'streak-day-1'    => stats.currentStreak.clamp(0, 1),
      'streak-day-3'    => stats.currentStreak.clamp(0, 3),
      'streak-day-7'    => stats.currentStreak.clamp(0, 7),
      'streak-day-14'   => stats.currentStreak.clamp(0, 14),
      'streak-day-30'   => stats.currentStreak.clamp(0, 30),
      'streak-day-90'   => stats.currentStreak.clamp(0, 90),
      'streak-day-180'  => stats.currentStreak.clamp(0, 180),
      'streak-day-365'  => stats.currentStreak.clamp(0, 365),

      // Resilience
      'recovery-1'      => stats.recoveryCount.clamp(0, 1),
      'recovery-3'      => stats.recoveryCount.clamp(0, 3),
      'recovery-5'      => stats.recoveryCount.clamp(0, 5),

      // Engagement
      'checkin-7'       => _countEventType(logs, LogType.dailyCheckin, 7),
      'checkin-30'      => _countEventType(logs, LogType.dailyCheckin, 30),
      'toolkit-5'       => _countEventType(logs, LogType.copingAction, 5),
      'toolkit-20'      => _countEventType(logs, LogType.copingAction, 20),

      // Craving resistance
      'craving-resisted-1'  => _countEventType(logs, LogType.cravingDelayed, 1),
      'craving-resisted-10' => _countEventType(logs, LogType.cravingDelayed, 10),
      'craving-resisted-50' => _countEventType(logs, LogType.cravingDelayed, 50),

      // Smoking mode
      'smoke-money-10'  => (stats.moneySaved?.toInt() ?? 0).clamp(0, 10),
      'smoke-money-100' => (stats.moneySaved?.toInt() ?? 0).clamp(0, 100),

      // Reduction mode
      'urge-resisted-1'  => _countEventType(logs, LogType.cravingDelayed, 1),
      'urge-resisted-25' => _countEventType(logs, LogType.cravingDelayed, 25),

      _ => achievement.progressValue, // unknown ID — no change
    };
  }

  int _countEventType(List<LogEntry> logs, LogType type, int max) =>
      logs.where((l) => l.type == type).length.clamp(0, max);
}

class AchievementUpdate {
  final String achievementId;
  final int progressValue;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  final bool justUnlocked; // true only the first time it transitions to unlocked
}
```

**Evaluation trigger points:**
1. On app cold start (after `IsarService` resolves) — re-evaluate all achievements silently.
2. After every `LogEntry` write — partial re-evaluation for affected categories.
3. After `LapseRecoverySession` completion — re-evaluate resilience achievements.
4. After every toolkit session end — re-evaluate engagement achievements.

Any `justUnlocked == true` achievement triggers the **Achievement Unlock Animation** (see §4.7).

### 4.4 Achievement Definitions — Smoking Mode

All copy follows the "values-affirming, never moralistic" rule (BR-08, SRS §15).

| ID | Name | Icon | Description | Progress Max | Category |
|---|---|---|---|---|---|
| `streak-day-1` | First Smoke-Free Day | 🌅 | You made it through your first day. | 1 | streak |
| `streak-day-7` | One Week Smoke-Free | 🌿 | Seven days. Your circulation is already improving. | 7 | streak |
| `streak-day-14` | Two Weeks Strong | 🫁 | Your lung function is increasing. | 14 | streak |
| `streak-day-30` | One Month Free | 🎯 | A month of choosing yourself every day. | 30 | streak |
| `streak-day-90` | 90 Days | 🌟 | Three months. Most withdrawal symptoms are long gone. | 90 | streak |
| `streak-day-180` | Six Months | 🏆 | Half a year smoke-free. Your risk of heart disease is falling. | 180 | streak |
| `streak-day-365` | One Full Year | 🎊 | One year. Your heart disease risk is now half that of a smoker. | 365 | streak |
| `smoke-money-10` | First £10 Saved | 💰 | You've redirected your first £10 away from cigarettes. | 10 | milestone |
| `smoke-money-100` | £100 Saved | 💸 | £100 reclaimed. That's yours now. | 100 | milestone |
| `craving-resisted-1` | First Craving Beaten | 💪 | You felt it and didn't act on it. That's huge. | 1 | craving |
| `craving-resisted-10` | Ten Cravings Beaten | 🛡️ | Ten times you chose your goal over the urge. | 10 | craving |
| `craving-resisted-50` | Fifty Strong | ⚡ | Fifty cravings resisted. You've built real strength. | 50 | craving |
| `recovery-1` | First Recovery | 🔄 | You got back up. That's what matters. | 1 | resilience |
| `recovery-3` | Three Recoveries | 🌱 | Three times you chose to keep going. Resilience is a skill. | 3 | resilience |
| `checkin-7` | Seven Check-Ins | 📅 | Seven days of staying connected to your goal. | 7 | engagement |
| `checkin-30` | Thirty Check-Ins | 📆 | A month of showing up for yourself. | 30 | engagement |
| `toolkit-5` | Toolkit Explorer | 🧰 | Used the craving toolkit 5 times. | 5 | engagement |
| `toolkit-20` | Toolkit Regular | 🔧 | 20 toolkit sessions. You have real coping skills now. | 20 | engagement |

### 4.5 Achievement Definitions — Reduction Mode

Achievement copy for reduction mode is **values-affirming and never moralistic**. No moral framing ("You avoided sin"), no shame framing ("You didn't fail"). Only self-control, values, and clarity framing.

| ID | Name | Icon | Description | Progress Max | Category |
|---|---|---|---|---|---|
| `streak-day-3` | Three Days | 🌱 | Three days of choosing your values. | 3 | streak |
| `streak-day-7` | One Week | 🌿 | Seven days of self-directed clarity. | 7 | streak |
| `streak-day-14` | Two Weeks | 🧘 | Two weeks. Your focus and sleep patterns are likely shifting. | 14 | streak |
| `streak-day-30` | Thirty Days | 🎯 | A month of aligning with your values every day. | 30 | streak |
| `streak-day-90` | 90 Days | 🌟 | Three months of self-chosen clarity. | 90 | streak |
| `urge-resisted-1` | First Urge Surfed | 🌊 | You rode the wave instead of acting on it. | 1 | craving |
| `urge-resisted-25` | 25 Urges Surfed | ⚡ | 25 times you felt the pull and chose your values instead. | 25 | craving |
| `recovery-1` | Back on Course | 🔄 | You noticed, you acknowledged, and you kept going. | 1 | resilience |
| `recovery-3` | Three Recoveries | 🌱 | Resilience isn't absence of struggle — it's choosing to continue. | 3 | resilience |
| `checkin-7` | Seven Check-Ins | 📅 | Seven days of self-awareness and honest tracking. | 7 | engagement |
| `checkin-30` | Thirty Check-Ins | 📆 | A month of intentional self-reflection. | 30 | engagement |
| `toolkit-5` | Toolkit Explorer | 🧰 | Five times you reached for a tool instead of the habit. | 5 | engagement |
| `toolkit-20` | Toolkit Regular | 🔧 | 20 sessions. Coping skills are now part of your life. | 20 | engagement |

### 4.6 Achievement Definitions — Shared

These appear for both modes, filtered only by `modeFilter = null`.

| ID | Name | Icon | Description | Progress Max | Category |
|---|---|---|---|---|---|
| `streak-day-1` | First Day | 🌅 | The first day is always the hardest. You did it. | 1 | streak |
| `recovery-5` | Five Recoveries | 💜 | Five times you chose to continue. That persistence is yours. | 5 | resilience |

> **Note:** Where a shared badge and a mode-specific badge have overlapping conditions (e.g. `streak-day-1`), the engine awards only the mode-specific badge for that mode. The shared definition exists as a fallback if a mode-specific one is not defined.

### 4.7 Achievement Unlock Animation

When `AchievementEngine.evaluate()` returns any `justUnlocked == true` update, the app shows a non-blocking overlay animation.

**Implementation rules:**
- Use `OverlayEntry` inserted above the current route — not a dialog (dialogs block interaction).
- Animation duration: 2.5 seconds total. Auto-dismisses. Tappable to dismiss early.
- Visual: badge icon scales in (0 → 1.2 → 1.0) with a golden `ShimmerEffect` using `flutter_animate`.
- Copy: "Achievement Unlocked! [Name]" + one-line description.
- Never stack multiple overlays — queue them with a 500ms delay between.
- **Do NOT show** unlock animation for achievements unlocked on first app launch (too many firing at once). Only show for achievements earned since last evaluation.

```dart
// lib/features/achievements/presentation/widgets/achievement_unlock_overlay.dart

class AchievementUnlockOverlay {
  static final _queue = <Achievement>[];
  static bool _isShowing = false;

  static void enqueue(BuildContext context, Achievement achievement) {
    _queue.add(achievement);
    if (!_isShowing) _showNext(context);
  }

  static void _showNext(BuildContext context) {
    if (_queue.isEmpty) { _isShowing = false; return; }
    _isShowing = true;
    final achievement = _queue.removeAt(0);

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _AchievementOverlayWidget(
        achievement: achievement,
        onDismiss: () {
          entry.remove();
          Future.delayed(const Duration(milliseconds: 500), () => _showNext(context));
        },
      ),
    );
    Overlay.of(context).insert(entry);
  }
}
```

**Notification trigger:** After an achievement is unlocked, also schedule a local notification celebration (uses existing `NotificationManager.onStreakMilestone()` hook — extend it to accept achievement name).

### 4.8 Badge Gallery Screen

**File:** `lib/features/achievements/presentation/screens/badge_gallery_screen.dart`

**Navigation:** Accessible from Progress tab → "View All Achievements" button.

**Layout:**

```
AppBar: "Achievements" | [earned count] / [total count] chip

Earned section header
GridView.builder (2 columns, crossAxisSpacing=16, mainAxisSpacing=16):
  → AchievementBadgeCard (unlocked style: full color, golden border)

Locked section header ("Still to earn")
GridView.builder (same):
  → AchievementBadgeCard (locked style: greyscale, progress bar below icon)
```

**`AchievementBadgeCard` widget:**

```dart
class AchievementBadgeCard extends StatelessWidget {
  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: achievement.isUnlocked ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: achievement.isUnlocked
            ? const BorderSide(color: Color(0xFFFFD700), width: 2)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ColorFiltered(
              colorFilter: achievement.isUnlocked
                  ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
                  : const ColorFilter.matrix([
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0,      0,      0,      1, 0,
                    ]), // greyscale for locked
              child: Text(achievement.iconEmoji,
                  style: const TextStyle(fontSize: 40)),
            ),
            const SizedBox(height: 8),
            Text(achievement.name,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: 4),
            if (!achievement.isUnlocked) ...[
              LinearProgressIndicator(
                value: achievement.progressPercent,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 4),
              Text(
                '${achievement.progressValue} / ${achievement.progressMax}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (achievement.isUnlocked && achievement.unlockedAt != null)
              Text(
                'Earned ${_formatDate(achievement.unlockedAt!)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600),
              ),
          ],
        ),
      ),
    );
  }
}
```

**Accessibility:** Each `AchievementBadgeCard` must have `Semantics`:

```dart
Semantics(
  label: achievement.isUnlocked
      ? '${achievement.name} — earned ${_formatDate(achievement.unlockedAt!)}'
      : '${achievement.name} — ${achievement.progressValue} of ${achievement.progressMax}',
  child: AchievementBadgeCard(achievement: achievement),
)
```

### 4.9 Reasons Wall Feature

**File:** `lib/features/achievements/presentation/widgets/reasons_wall_card.dart`

The Reasons Wall is a dashboard card that shows the user's personal motivations (values set during onboarding and editable in Settings). Per SRS §7.6 FR-P09.

**Dashboard integration:**
- Displayed on both `SmokingDashboard` and `ReductionDashboard` (more prominent on reduction).
- Shows as a card with a tappable "Add a reason" CTA if empty.
- Shows chips for each value when populated.

**Data model:** The user's `values` list (from `UserProfile.values`) is the source of truth. The Reasons Wall reads from it and writes back via `ProfileRepository.updateProfile()`.

**Edit flow:** Tapping "Edit" on the Reasons Wall card navigates to a modal bottom sheet:

```dart
// ReasonsWallEditSheet:
// - Pre-populated multi-select chips (same chip set as onboarding values step)
// - Free-text "Add custom reason" TextField
// - "Save" saves to UserProfile.values via profileRepository
// - Closes sheet and invalidates profileProvider
```

**Copy rules (SRS BR-06):**
- Labels for shared values: "Focus", "Sleep", "Relationships", "Emotional Regulation", "Energy", "Self-Control", "Clarity"
- Reduction-mode specific: may add "Time" and "Financial Health"
- Smoking-mode specific: may add "Health", "Breathing", "Family"

### 4.10 Streak Flame Visual Enhancement

**File:** `lib/features/tracking/presentation/widgets/streak_card.dart` — enhance existing widget.

Per SRS FR-P08 (COULD priority), the streak icon intensifies at milestone days.

**Implementation:**

```dart
Widget _buildStreakIcon(int streakDays) {
  final intensity = switch (streakDays) {
    >= 90 => _FlameIntensity.blazing,
    >= 30 => _FlameIntensity.strong,
    >= 7  => _FlameIntensity.warm,
    _     => _FlameIntensity.spark,
  };

  return Text(
    intensity.emoji,
    style: TextStyle(
      fontSize: intensity.size,
      shadows: [
        Shadow(
          blurRadius: intensity.glowRadius,
          color: intensity.glowColor,
        ),
      ],
    ),
  );
}

enum _FlameIntensity {
  spark(emoji: '🔥', size: 32, glowRadius: 0,  glowColor: Colors.transparent),
  warm(emoji: '🔥',  size: 40, glowRadius: 8,  glowColor: Color(0xFFFF6B35)),
  strong(emoji: '🔥', size: 48, glowRadius: 16, glowColor: Color(0xFFFF4500)),
  blazing(emoji: '🔥', size: 56, glowRadius: 24, glowColor: Color(0xFFFF2200));

  const _FlameIntensity({
    required this.emoji,
    required this.size,
    required this.glowRadius,
    required this.glowColor,
  });

  final String emoji;
  final double size;
  final double glowRadius;
  final Color glowColor;
}
```

> **Note:** For reduction mode, the icon is a leaf/shield (`🛡️` or `🌿`) at small streaks, transitioning to brighter variants at milestones — never a flame (SRS §10.4: "calm leaf/shield icon — not flame").

---

## 5. Progress Tab — Full Implementation

### 5.1 Progress Tab Architecture

The Progress tab (Tab 3, `bar_chart_outlined` icon) is currently a stub. It must be a scrollable screen with multiple sections organized as a `CustomScrollView` with `SliverList` sections.

**File:** `lib/features/tracking/presentation/screens/progress_screen.dart`

```
ProgressScreen
├── AppBar: "Progress"
│   └── Action: "Weekly Review" button → WeeklyReviewScreen
│
└── CustomScrollView
    ├── SliverToBoxAdapter: MotivationalSummaryCard (collapsed, tap to expand)
    ├── SliverToBoxAdapter: ConsistencyScoreCard
    ├── SliverToBoxAdapter: [Mode-specific stats section]
    │   ├── SmokingMode: HealthMilestoneSection + MoneySection + CigarettesAvoidedCard
    │   └── ReductionMode: DistressionTrendSection + TimeReclaimedCard + UrgesResistedCard
    ├── SliverToBoxAdapter: RecoveryStatsCard (if recoveryCount > 0)
    ├── SliverToBoxAdapter: AchievementsPreviewCard (latest 3 earned + "View All" CTA)
    ├── SliverToBoxAdapter: ToolkitUsageSummaryCard
    └── SliverToBoxAdapter: [Log History] + [Journal entries] quick-access buttons
```

**Provider:** `progressScreenProvider` — `FutureProvider.autoDispose<ProgressScreenData>` that aggregates data from `statisticsProvider`, `achievementProvider`, `toolkitRepositoryProvider`.

### 5.2 Weekly Review Screen

**File:** `lib/features/tracking/presentation/screens/weekly_review_screen.dart`

Per SRS FR-C16: auto-generated from local log data, shows past 7 days.

**Structure:**

```
AppBar: "This Week" | Date range subtitle (e.g., "May 11 – May 17")

Hero Metric: [Mode's primary metric for the week]
  Smoking:   "You were smoke-free for X of 7 days"
  Reduction: "You resisted X urges this week"

Stats Grid (2×2):
  [Check-ins done] [Toolkit sessions]
  [Cravings resisted] [Longest streak segment]

Trend Section: 7-day bar chart (fl_chart)
  X axis: day abbreviations (Mon–Sun)
  Y axis: mode-specific metric (cigarettes avoided / urges resisted)

Top Trigger Card (if trigger data available):
  "Your most common trigger this week: [Stress]"
  CTA: "Learn to handle [Stress]" → toolkit filtered to coping exercises

Toolkit Use Section:
  "You used the craving toolkit [N] times"
  Most used exercise name (from ToolkitSessionModel query)

Motivational Closing Card:
  3–5 sentence summary (from MotivationalSummaryEngine)

Achievements earned this week (if any):
  Row of AchievementBadgeCard (unlocked style, compact)
```

**Auto-generated trigger:** The weekly review notification (FR-N02) deep-links to this screen. The screen is also accessible from the Progress tab AppBar action.

**`WeeklyReviewData` model:**

```dart
class WeeklyReviewData {
  final DateTimeRange week;
  final int checkInsThisWeek;
  final int toolkitSessionsThisWeek;
  final int cravingsResisted;
  final int lapseEvents;
  final int longestSegmentDays;
  final String? topTrigger;
  final String? mostUsedExercise;
  final List<int> dailyMetrics; // 7 values, one per day
  final List<Achievement> achievementsEarned;
  final String motivationalSummary;

  // Mode-specific
  final double? moneySavedThisWeek;
  final int? cigarettesAvoidedThisWeek;
  final int? urgesResistedThisWeek;
  final double? averageDistressThisWeek;
}
```

### 5.3 Health Milestone Timeline — Smoking Mode

**File:** `lib/features/tracking/presentation/screens/health_milestone_screen.dart`

Per SRS FR-S08: the app displays health milestones based on established cessation health timelines.

**Milestone data (static, from SRS §7.2):**

```dart
const kHealthMilestones = [
  HealthMilestone(
    id: 'hm-20min',
    label: '20 minutes',
    durationFromQuit: Duration(minutes: 20),
    title: 'Heart rate & blood pressure drop',
    description: 'Your heart rate and blood pressure begin to normalize.',
    iconEmoji: '❤️',
  ),
  HealthMilestone(
    id: 'hm-12hr',
    label: '12 hours',
    durationFromQuit: Duration(hours: 12),
    title: 'Carbon monoxide drops',
    description: 'CO levels in your blood normalize. Your heart gets more oxygen.',
    iconEmoji: '🫁',
  ),
  HealthMilestone(
    id: 'hm-2weeks',
    label: '2 weeks',
    durationFromQuit: Duration(days: 14),
    title: 'Circulation improves',
    description: 'Circulation improves and lung function increases.',
    iconEmoji: '🩸',
  ),
  HealthMilestone(
    id: 'hm-1month',
    label: '1 month',
    durationFromQuit: Duration(days: 30),
    title: 'Coughing, shortness of breath decrease',
    description: 'Cilia regrow in your airways. Breathing feels easier.',
    iconEmoji: '💨',
  ),
  HealthMilestone(
    id: 'hm-1year',
    label: '1 year',
    durationFromQuit: Duration(days: 365),
    title: 'Heart disease risk halved',
    description: 'Your risk of coronary heart disease is half that of a smoker.',
    iconEmoji: '🏆',
  ),
  HealthMilestone(
    id: 'hm-5years',
    label: '5 years',
    durationFromQuit: Duration(days: 1825),
    title: 'Stroke risk normalized',
    description: 'Your stroke risk is now similar to someone who never smoked.',
    iconEmoji: '🧠',
  ),
  HealthMilestone(
    id: 'hm-10years',
    label: '10 years',
    durationFromQuit: Duration(days: 3650),
    title: 'Lung cancer risk halved',
    description: 'Your risk of lung cancer is half that of a current smoker.',
    iconEmoji: '🌟',
  ),
];
```

**Dashboard integration (US-DB-05):**

The `SmokingDashboard` shows a `HealthMilestoneProgressBar` card:
- Finds the next unachieved milestone relative to `DateTime.now() - quitDate`.
- Shows milestone name + days remaining.
- Shows a `LinearProgressIndicator` between current milestone and next.
- Tapping navigates to the full `HealthMilestoneScreen` timeline.

### 5.4 Distress Trend Chart — Reduction Mode

**File:** `lib/features/tracking/presentation/widgets/distress_trend_chart.dart`

Per SRS FR-P03 and FR-M03: distress trend rendered as a sparkline chart, requires ≥3 data points.

**Implementation:**

```dart
class DistressTrendChart extends StatelessWidget {
  final List<double> distressRatings; // last 7 daily distress ratings (1–10)

  @override
  Widget build(BuildContext context) {
    if (distressRatings.length < 3) {
      return _buildEmptyState(context);
    }
    return SizedBox(
      height: 100,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: distressRatings
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
              isCurved: true,
              color: Theme.of(context).colorScheme.primary,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              ),
            ),
          ],
          minY: 1,
          maxY: 10,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: Text(
        'Check in daily to see your distress trend',
        style: Theme.of(context).textTheme.bodySmall
            ?.copyWith(color: Colors.grey.shade500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
```

Distress data comes from `LogEntry` records of type `LogType.dailyCheckin` where `distressRating != null`, grouped by calendar day (local timezone), taking the last logged value per day.

### 5.5 Statistics Motivational Summary

**File:** `lib/features/tracking/domain/services/motivational_summary_engine.dart`

Per SRS FR-P05: templated, 3–5 sentences, no LLM.

The engine selects a template based on mode, streak length, available data, and user's confidence level from profile.

```dart
class MotivationalSummaryEngine {
  String generate({
    required Statistics stats,
    required UserProfile profile,
    required DateTime forDate,
  }) {
    final mode = profile.goalType;
    final days = stats.currentStreak;
    final recoveries = stats.recoveryCount;
    final confidence = mode == GoalType.quitSmoking
        ? profile.confidenceToQuit
        : profile.confidenceToReduce;

    // Select opening sentence based on streak
    final opening = _openingSentence(mode, days);

    // Select body based on available data
    final body = _bodySentence(mode, stats, profile);

    // Add recovery framing if applicable
    final recovery = recoveries > 0 ? _recoverySentence(recoveries) : null;

    // Close with forward-looking encouragement
    final closing = _closingSentence(mode, days, confidence);

    return [opening, body, recovery, closing]
        .whereType<String>()
        .join(' ');
  }

  String _openingSentence(GoalType mode, int days) {
    if (days == 0) {
      return mode == GoalType.quitSmoking
          ? "Today is the beginning of something important."
          : "Every day is a chance to realign with your values.";
    }
    if (days < 7) {
      return mode == GoalType.quitSmoking
          ? "You've made it $days day${days == 1 ? '' : 's'} smoke-free."
          : "You've kept to your values for $days day${days == 1 ? '' : 's'}.";
    }
    return mode == GoalType.quitSmoking
        ? "You are $days days smoke-free."
        : "You have maintained your commitment for $days days.";
  }

  // ... additional template helpers
}
```

**Display:** The motivational summary appears:
1. As a `MotivationalSummaryCard` on the Progress tab (collapsed by default, expands on tap).
2. As the closing card of the Weekly Review screen.
3. In weekly summary notifications (FR-N02).

### 5.6 Log History Timeline Screen

**File:** `lib/features/tracking/presentation/screens/log_history_screen.dart`

Per SRS US-LG-05: timeline view with filters, tap to expand.

**Layout:**

```
AppBar: "Log History"
│
├── Filter Row (horizontal scroll of FilterChips):
│   [All] [Cravings] [Lapses] [Check-ins] [Coping] [Urges] [Episodes]
│
├── Date range picker row (optional, defaults to "All time")
│
└── ListView.builder (SRS Pitfall 11 — never Column with map):
    LogEventTile:
      ├── Leading: event type icon + category color
      ├── Title: event type label (e.g., "Craving Resisted")
      ├── Subtitle: timestamp (local, formatted "Today at 14:32")
      └── Expanded: trigger label(s), optional note, toolkit exercise used
```

**Provider:**

```dart
final logHistoryProvider = FutureProvider.autoDispose
    .family<List<LogEntry>, LogHistoryFilter>((ref, filter) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) return [];
  final repo = ref.read(logRepositoryProvider);
  return repo.getEntries(
    userId: userId,
    eventTypes: filter.eventTypes,
    from: filter.from,
    to: filter.to,
    limit: filter.limit,
  );
});

class LogHistoryFilter {
  final List<LogType>? eventTypes; // null = all
  final DateTime? from;
  final DateTime? to;
  final int limit;

  const LogHistoryFilter({
    this.eventTypes,
    this.from,
    this.to,
    this.limit = 200,
  });
}
```

### 5.7 Toolkit History Screen

**File:** `lib/features/tracking/presentation/screens/toolkit_history_screen.dart`

A scrollable list of `ToolkitSessionModel` records grouped by date, accessible from the Progress tab.

**Layout:**

```
AppBar: "Toolkit History"
│
└── ListView.builder (grouped by date — use sticky headers)
    DateHeader: "This Week" | "Last Week" | actual date
    ToolkitSessionTile:
      ├── Leading: category icon emoji
      ├── Title: exercise name
      ├── Subtitle: duration + mode tag
      └── Trailing: feedback emoji (😊/🤷/😕/—)
```

**Note:** This screen reads from `ToolkitSessionModel` via `ToolkitRepositoryImpl.getRecentSessions()`. It does NOT read from the old per-type session collections.

### 5.8 Recovery Statistics Section

**File:** `lib/features/tracking/presentation/widgets/recovery_stats_card.dart`

This card is shown on the Progress tab when `recoveryCount > 0`.

```
Recovery Journey Card
├── "You have recovered [N] time(s)."
├── "Most common trigger: [Stress]" (from LapseRecoverySession triggers)
├── "Longest smoke-free / urge-free streak after a recovery: [X] days"
└── Small bar chart: "Recovery outcomes" (opened toolkit / read guide / closed)
```

---

## 6. Settings Screen — Full Implementation

### 6.1 Settings Screen Architecture

**File:** `lib/features/settings/presentation/screens/settings_screen.dart`

The Settings screen (Tab 4) is a `ListView` of `ListTile` rows that navigate to sub-screens. All settings persisted via `AppSettings` Isar model and `SettingsNotifier`.

**Full list of settings rows (SRS FR-D01):**

```
Settings
├── PROFILE
│   ├── Edit Profile → EditProfileScreen
│   └── View Reasons Wall → ReasonsWallEditSheet
│
├── PREFERENCES
│   ├── Notifications → NotificationSettingsScreen
│   ├── Theme → ThemeSettingsSheet (inline bottom sheet)
│   └── Language → LanguageSettingsScreen
│
├── PRIVACY & SECURITY
│   ├── Privacy Lock → PrivacySecurityScreen
│   └── Help & Safety → HelpSafetyScreen (unguarded)
│
├── DATA
│   ├── Export My Data → ExportDataScreen
│   ├── Delete All Data → DeleteAllDataScreen (two-step)
│   └── Reset Profile → ResetProfileScreen (two-step, wipes everything)
│
└── ABOUT
    ├── App Version → AboutScreen
    └── Open-Source Licences → LicensePage (Flutter built-in)
```

### 6.2 Notification Settings Sub-Screen

Already implemented per the Interventions plan. Verify all sub-settings are present:
- [ ] Notifications enabled master toggle
- [ ] Daily check-in time picker
- [ ] Weekly summary toggle
- [ ] Milestone celebrations toggle
- [ ] High-risk hour reminders toggle
- [ ] Quiet hours start/end (via `showTimePicker`)
- [ ] Notification tone (Motivational / Gentle / Minimal)

### 6.3 Privacy & Security Sub-Screen

**File:** `lib/features/settings/presentation/screens/privacy_security_screen.dart`

```dart
Column(
  children: [
    SwitchListTile(
      title: const Text('Privacy Lock'),
      subtitle: const Text(
        'Require biometric or PIN to open the app',
      ),
      value: settings.privacyLockEnabled,
      onChanged: (enabled) async {
        if (enabled) {
          // Test auth before enabling — avoid locking user out
          final authenticated = await LocalAuthentication().authenticate(
            localizedReason: 'Confirm identity to enable Privacy Lock',
            options: const AuthenticationOptions(biometricOnly: false),
          );
          if (authenticated) {
            ref.read(settingsNotifierProvider.notifier).setPrivacyLock(true);
          }
        } else {
          ref.read(settingsNotifierProvider.notifier).setPrivacyLock(false);
        }
      },
    ),
    // Info text if biometric unavailable
    if (!biometricAvailable)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          'PIN lock will be used — biometric authentication is not available on this device.',
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: Colors.grey),
        ),
      ),
    ListTile(
      leading: const Icon(Icons.help_outline),
      title: const Text('Help & Safety'),
      subtitle: const Text('Always accessible, even when locked'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => HelpNavigation.openHelpScreen(context),
    ),
  ],
)
```

### 6.4 Theme & Display Sub-Screen

**File:** `lib/features/settings/presentation/widgets/theme_settings_sheet.dart` (bottom sheet)

```dart
// Inline bottom sheet (not a full screen — too simple for a full route)
showModalBottomSheet(
  context: context,
  builder: (_) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        title: const Text('System default'),
        leading: const Icon(Icons.brightness_auto),
        trailing: settings.themeMode == ThemeMode.system
            ? const Icon(Icons.check) : null,
        onTap: () => notifier.setTheme(ThemeMode.system),
      ),
      ListTile(
        title: const Text('Light'),
        leading: const Icon(Icons.light_mode),
        trailing: settings.themeMode == ThemeMode.light
            ? const Icon(Icons.check) : null,
        onTap: () => notifier.setTheme(ThemeMode.light),
      ),
      ListTile(
        title: const Text('Dark'),
        leading: const Icon(Icons.dark_mode),
        trailing: settings.themeMode == ThemeMode.dark
            ? const Icon(Icons.check) : null,
        onTap: () => notifier.setTheme(ThemeMode.dark),
      ),
    ],
  ),
);
```

**Implementation:** `ThemeMode` is stored in `AppSettings.themeMode` (as `String` — enum name). `MaterialApp.themeMode` reads from `settingsProvider`. On change, the entire app re-themes without restart via Riverpod state update.

### 6.5 Export Data Sub-Screen

**File:** `lib/features/settings/presentation/screens/export_data_screen.dart`

```
AppBar: "Export My Data"

Info card:
  "Your data is exported as a file you can save or share.
   It includes your profile (optional), all log events,
   and toolkit usage history. No data is sent to any server."

Export options:
  ┌──────────────────────────────────────────────────┐
  │ 📄  JSON Export                                  │
  │     Full data — profile, events, toolkit history │
  │     [Include profile] toggle (default: off)      │
  │     [Export JSON] button                         │
  └──────────────────────────────────────────────────┘
  ┌──────────────────────────────────────────────────┐
  │ 📊  CSV Export                                   │
  │     Log events only — for spreadsheet analysis   │
  │     [Export CSV] button                          │
  └──────────────────────────────────────────────────┘

Loading state: CircularProgressIndicator with "Preparing export..."
Success state: "File ready" → share_plus share sheet opens automatically
Error state: "Export failed. Please try again." with retry button
```

### 6.6 Delete All Data Sub-Screen

**File:** `lib/features/settings/presentation/screens/delete_data_screen.dart`

Per SRS FR-D03: two-step confirmation, irreversible.

```
AppBar: "Delete All Data"

Warning card (red background):
  "This action is permanent and cannot be undone.
   All your data — streak history, log events, journal entries,
   achievements, and settings — will be erased from this device."

Step 1: "I understand this cannot be undone"
  → Checkbox that must be checked to enable Step 2 button

Step 2: ElevatedButton(
  style: red background,
  label: "Delete Everything",
  onPressed: checkboxChecked ? () => _showFinalConfirm() : null,
)

_showFinalConfirm() → AlertDialog:
  title: "Are you absolutely sure?"
  content: "All data will be permanently deleted."
  actions: [Cancel] [Delete — red text]
  → On confirm: ExportNotifier.deleteAllData()
```

**`deleteAllData()` logic (see §7.5).**

### 6.7 Reset Profile Sub-Screen

**File:** `lib/features/settings/presentation/screens/reset_profile_screen.dart`

Per SRS US-ON05 and BR-02.

```
AppBar: "Reset Profile"

Info card:
  "Resetting your profile will erase all your data and return you
   to the goal selection screen. You can choose a different goal
   or start fresh with the same goal."

Warning: "This action cannot be undone."

ElevatedButton:
  label: "Reset Profile"
  style: outlined (less alarming than delete)
  onPressed: () → AlertDialog confirmation
    → On confirm: calls ExportNotifier.deleteAllData()
                   then navigates to WelcomeScreen with pushAndRemoveUntil
```

**Distinction from Delete All Data:** Reset Profile also navigates to `WelcomeScreen` and unlocks mode selection. Delete All Data stays on the Settings screen (user may want to stay without re-onboarding).

### 6.8 About / Version Sub-Screen

**File:** `lib/features/settings/presentation/screens/about_screen.dart`

Per SRS FR-D05: no network call.

```
AppBar: "About QuitMate"

App icon + name + version (from pubspec via package_info_plus)

Description card:
  "QuitMate is a private, offline-only habit support app.
   No data leaves your device. No accounts. No ads."

Offline Changelog card (static, hardcoded in Dart):
  v1.0.0 — Initial release
  [Future versions listed here as they ship]

Legal row:
  [Privacy Policy] → static in-app screen (no browser)
  [Open-Source Licences] → Flutter's built-in LicensePage
  [SRS Reference] → app stores link (if applicable)

Contact/feedback row:
  "Questions or feedback?" → opens email client with pre-filled address
```

### 6.9 Edit Profile Sub-Screen

**File:** `lib/features/onboarding/presentation/screens/edit_profile_screen.dart`

Accessible from Settings → Edit Profile and from dashboard nudge cards.

Renders the relevant profile form in edit mode, pre-populated with existing values. Each section (cost, triggers, confidence, values) is a separate expandable tile.

**On save:** calls `profileRepository.updateProfile(updatedProfile)`, invalidates `profileCompletenessProvider` and `statisticsProvider`, pops.

---

## 7. Data Export — Full Implementation

### 7.1 Export Domain Service

**File:** `lib/features/settings/domain/services/export_service.dart`

Pure Dart. Zero Flutter dependencies except `path_provider` at the call site.

```dart
class ExportService {
  final LogRepository _logRepo;
  final ToolkitRepository _toolkitRepo;
  final JournalRepository _journalRepo;
  final ProfileRepository _profileRepo;

  /// Generates a complete JSON export.
  Future<Map<String, dynamic>> buildJsonExport({
    required String userId,
    required bool includeProfile,
  }) async {
    final events = await _logRepo.getAllEvents(userId);
    final toolkitSessions = await _toolkitRepo.getRecentSessions(
        userId: userId, days: 99999); // all time
    final journalEntries = await _journalRepo.getEntries(userId: userId);

    final data = <String, dynamic>{
      'exportVersion': '1.0',
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'appVersion': '1.0.0',
      'logEvents': events.map(_logEventToMap).toList(),
      'toolkitSessions': toolkitSessions.map(_sessionToMap).toList(),
      'journalEntries': journalEntries.map(_journalToMap).toList(),
    };

    if (includeProfile) {
      final profile = await _profileRepo.getProfile(userId);
      data['profile'] = _profileToMap(profile);
    }

    return data;
  }

  /// Generates a CSV string for log events only.
  Future<String> buildCsvExport({required String userId}) async {
    final events = await _logRepo.getAllEvents(userId);
    final buffer = StringBuffer();

    // Header
    buffer.writeln('timestamp,eventType,triggerId,note,mode');

    for (final event in events) {
      buffer.writeln([
        event.timestamp.toIso8601String(),
        event.type.name,
        event.triggerId ?? '',
        (event.note ?? '').replaceAll(',', ';'),
        event.mode,
      ].join(','));
    }
    return buffer.toString();
  }
}
```

### 7.2 JSON Export Format

```json
{
  "exportVersion": "1.0",
  "exportedAt": "2026-05-17T14:00:00.000Z",
  "appVersion": "1.0.0",
  "profile": {
    "mode": "quitSmoking",
    "createdAt": "2026-04-01T08:00:00.000Z",
    "cigarettesPerDay": 15,
    "quitDate": "2026-04-01T08:00:00.000Z",
    "triggers": ["stress", "afterMeals"]
  },
  "logEvents": [
    {
      "id": "abc123",
      "eventType": "cravingDelayed",
      "timestamp": "2026-05-15T10:32:00.000Z",
      "triggerId": "stress",
      "note": null,
      "mode": "quitSmoking"
    }
  ],
  "toolkitSessions": [
    {
      "exerciseId": "breathing-box",
      "exerciseName": "Box Breathing",
      "startedAt": "2026-05-15T10:35:00.000Z",
      "completedAt": "2026-05-15T10:38:00.000Z",
      "feedbackRating": 0
    }
  ],
  "journalEntries": [
    {
      "entryId": "xyz789",
      "createdAt": "2026-05-15T11:00:00.000Z",
      "content": "Feeling much better after the breathing exercise.",
      "moodTag": "calm"
    }
  ]
}
```

> **Privacy note (SRS FR-D02):** Profile is included only when the user opts in via the "Include profile" toggle. The export copy must state: "Profile data is anonymized — your name is not included unless you entered it."

### 7.3 CSV Export Format

```csv
timestamp,eventType,triggerId,note,mode
2026-05-15T10:32:00.000Z,cravingDelayed,stress,,quitSmoking
2026-05-15T14:15:00.000Z,cigaretteSmoked,afterMeals,rough day,quitSmoking
2026-05-16T09:00:00.000Z,dailyCheckin,,,quitSmoking
```

CSV export covers log events only (not toolkit sessions or journal entries for simplicity and privacy).

### 7.4 Export File Sharing

**File:** `lib/features/settings/presentation/providers/export_provider.dart`

```dart
class ExportNotifier extends AutoDisposeAsyncNotifier<ExportState> {
  @override
  Future<ExportState> build() async => const ExportState.idle();

  Future<void> exportJson({required bool includeProfile}) async {
    state = const AsyncLoading();
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) throw Exception('No user ID');

      final service = ref.read(exportServiceProvider);
      final data = await service.buildJsonExport(
        userId: userId,
        includeProfile: includeProfile,
      );

      final jsonString = const JsonEncoder.withIndent('  ').convert(data);
      final dir = await getApplicationDocumentsDirectory();
      final file = File(
        '${dir.path}/quitmate_export_${DateTime.now().millisecondsSinceEpoch}.json',
      );
      await file.writeAsString(jsonString);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'QuitMate Data Export',
        text: 'My QuitMate data export',
      );

      state = const AsyncData(ExportState.success());
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  Future<void> exportCsv() async {
    // Same pattern as exportJson — different service call, .csv extension
  }

  Future<void> deleteAllData() async {
    state = const AsyncLoading();
    try {
      final userId = await ref.read(currentUserIdProvider.future);

      // 1. Close all open Hive/Isar boxes
      final isar = await ref.read(isarServiceProvider.future);

      // 2. Clear every Isar collection
      await isar.writeTxn(() async {
        await isar.clear(); // clears ALL collections in this Isar instance
      });

      // 3. Delete all flutter_secure_storage keys
      const storage = FlutterSecureStorage();
      await storage.deleteAll();

      // 4. Cancel all pending notifications
      final notifManager = await ref.read(notificationManagerProvider.future);
      await notifManager.cancelAll();

      // 5. Invalidate all providers
      ref.invalidate(userProfileProvider);
      ref.invalidate(statisticsProvider);
      ref.invalidate(achievementProvider);

      state = const AsyncData(ExportState.deleted());
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
```

### 7.5 Delete All Data Logic

The two-step delete must wipe **every** piece of persisted data:

1. `isar.clear()` — wipes all Isar collections in one transaction.
2. `FlutterSecureStorage().deleteAll()` — removes the Hive/Isar AES key and all secure preferences.
3. `NotificationManager.cancelAll()` — cancels all pending platform notifications.
4. Navigate to `WelcomeScreen` (if Reset Profile) or stay on Settings (if Delete All Data).

**Verification requirement (NFR-13):**
- Integration test: write data → delete → reopen app → confirm no Isar records and no secure storage keys remain.
- Rooted Android manual test: inspect app data directory — no readable box files.

---

## 8. Privacy Lock — Full Implementation

### 8.1 Local Authentication Flow

**File:** `lib/features/settings/services/privacy_lock_service.dart`

```dart
class PrivacyLockService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    final canCheck = await _auth.canCheckBiometrics;
    final isAvailable = await _auth.isDeviceSupported();
    return canCheck && isAvailable;
  }

  Future<bool> authenticate({required String reason}) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: false,  // Allow PIN fallback
          stickyAuth: true,      // Stay authenticated if interrupted
        ),
      );
    } on PlatformException catch (e) {
      debugPrint('Auth error: $e');
      return false;
    }
  }
}
```

### 8.2 Lock Screen Widget

**File:** `lib/features/settings/presentation/screens/lock_screen.dart`

The lock screen is shown via `WidgetsBindingObserver.didChangeAppLifecycleState`. When the app returns from background AND `privacyLockEnabled == true`, it wraps the current route with the lock screen.

```dart
class LockScreen extends ConsumerStatefulWidget {
  final Widget child; // the normal app content beneath
  ...
}

class _LockScreenState extends ConsumerState<LockScreen>
    with WidgetsBindingObserver {

  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkAndLock();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _lockIfEnabled();
    }
    if (state == AppLifecycleState.resumed && _isLocked) {
      _attemptAuthentication();
    }
  }

  Future<void> _lockIfEnabled() async {
    final settings = ref.read(settingsNotifierProvider).value;
    if (settings?.privacyLockEnabled == true) {
      setState(() => _isLocked = true);
    }
  }

  Future<void> _attemptAuthentication() async {
    final service = ref.read(privacyLockServiceProvider);
    final authenticated = await service.authenticate(
      reason: 'Unlock QuitMate',
    );
    if (authenticated) {
      setState(() => _isLocked = false);
    }
    // If not authenticated, stay locked — user can retry by tapping "Unlock"
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLocked) return widget.child;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🔒', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 24),
            const Text('QuitMate is locked',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _attemptAuthentication,
              child: const Text('Unlock'),
            ),
            const SizedBox(height: 16),
            // Help bypass — ALWAYS accessible (SRS §15)
            TextButton(
              onPressed: () => HelpNavigation.openHelpScreen(context),
              child: const Text('Get Help (no unlock needed)'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Integration:** `LockScreen` wraps the `MaterialApp.home` widget, not individual routes. This ensures the lock appears over all content.

### 8.3 Graceful Degradation

Per SRS NFR-03 and FR-C08:

```dart
Future<void> _checkAndLock() async {
  final settings = ref.read(settingsNotifierProvider).value;
  if (settings?.privacyLockEnabled != true) return;

  final service = ref.read(privacyLockServiceProvider);
  final biometricAvailable = await service.isBiometricAvailable();

  if (!biometricAvailable) {
    // Fallback: system PIN (AuthenticationOptions.biometricOnly = false handles this)
    // If no PIN either, show a warning in Privacy & Security settings:
    // "No secure lock is set on this device. Privacy Lock requires a device PIN."
    final hasDevicePin = await service.isDeviceSecured();
    if (!hasDevicePin) {
      // Disable privacy lock with an explanatory snackbar
      ref.read(settingsNotifierProvider.notifier).setPrivacyLock(false);
      _showNoPinWarning();
    }
  }
}
```

---

## 9. Daily Check-In Feature

### 9.1 Check-In Banner Widget

**File:** `lib/features/tracking/presentation/widgets/daily_checkin_banner.dart`

Per SRS FR-C15: dismissible, once per calendar day. Shown on both dashboard variants.

```dart
class DailyCheckinBanner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasCheckedInToday = ref.watch(hasCheckedInTodayProvider);

    return hasCheckedInToday.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (checkedIn) {
        if (checkedIn) return const SizedBox.shrink();

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text('How are you doing today?'),
                ),
                TextButton(
                  onPressed: () => _showCheckinSheet(context, ref),
                  child: const Text('Check in'),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => ref
                      .read(checkinProvider.notifier)
                      .dismissForToday(),
                  tooltip: 'Dismiss',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

### 9.2 Check-In Flow

**File:** `lib/features/tracking/presentation/widgets/daily_checkin_sheet.dart`

Shown as a `DraggableScrollableSheet`. Collects:

**Shared fields:**
- "How do you feel right now?" — 5-option emoji scale: 😟 😕 😐 🙂 😊
- "Any cravings today?" — Yes / No (if Yes → log `cravingLogged` event)

**Smoking mode extra fields:**
- "Did you smoke today?" — Yes / No (if Yes → log `cigaretteSmoked` event with `DAILY_CHECKIN` tag)
- "Craving level today?" — Low / Medium / High (updates craving status chip on dashboard)

**Reduction mode extra fields:**
- "Distress level today (1–10)" — Slider (logged as `distressRating` on `dailyCheckin` event)
- "Did you act on any urge today?" — Yes / No

**On submit:**
1. Write `LogEntry` with type `LogType.dailyCheckin`, `distressRating`, and `timestamp`.
2. Write any secondary events (craving, lapse).
3. Invalidate `hasCheckedInTodayProvider`.
4. Dismiss sheet.
5. Trigger `AchievementEngine` partial evaluation for `engagement` category.

### 9.3 Check-In Data Logging

**`hasCheckedInTodayProvider`:**

```dart
final hasCheckedInTodayProvider = FutureProvider.autoDispose<bool>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) return false;
  final repo = ref.read(logRepositoryProvider);
  return repo.hasEventToday(userId: userId, type: LogType.dailyCheckin);
});
```

**`hasEventToday` in `LogRepositoryImpl`:**

```dart
Future<bool> hasEventToday({
  required String userId,
  required LogType type,
}) async {
  final isar = await _db;
  final startOfDay = DateTime.now().toLocal();
  final midnight = DateTime(startOfDay.year, startOfDay.month, startOfDay.day)
      .toUtc();
  final count = await isar.logEventModels
      .filter()
      .userIdEqualTo(userId)
      .typeEqualTo(type.name)
      .timestampGreaterThan(midnight)
      .count();
  return count > 0;
}
```

**Consistency score (FR-P04):**

```dart
// In StatisticsCalculator:
static double _calculateConsistencyScore(
  List<LogEntry> logs,
  DateTime startDate,
) {
  final daysSinceStart = DateTime.now().difference(startDate).inDays + 1;
  final daysWithCheckin = logs
      .where((l) => l.type == LogType.dailyCheckin)
      .map((l) => DateUtils.dateOnly(l.timestamp.toLocal()))
      .toSet()
      .length;
  return daysWithCheckin / daysSinceStart.clamp(1, double.infinity);
}
```

Displayed as a percentage in the Progress tab: "You checked in on X% of days."

---

## 10. Motivational Summary Engine

### 10.1 Template System

**File:** `lib/features/tracking/domain/services/motivational_summary_engine.dart`

The engine maintains pools of template strings with `{placeholder}` tokens. Tokens are filled from `Statistics` and `UserProfile` at generation time.

**Template pools by scenario:**

```dart
const _smokingOpenings = {
  'day0':  "Today is the beginning of something important.",
  'day1':  "You've completed your first smoke-free day.",
  'day7':  "One week smoke-free. Your body has already started healing.",
  'day30': "A month without cigarettes. That's real, lasting change.",
  'day90': "Ninety days. The hardest part is well behind you.",
  'day365': "One full year smoke-free. Your heart disease risk is now halved.",
  'default': "You are {streak} days smoke-free.",
};

const _reductionOpenings = {
  'day0':  "Every day is a chance to realign with your values.",
  'day3':  "Three days of choosing clarity over compulsion.",
  'day7':  "One week of self-directed focus.",
  'day30': "A month of living by your values.",
  'default': "You have maintained your commitment for {streak} days.",
};

const _smokingBodies = {
  'hasMoneyData': "You've redirected approximately {currency}{money} away from cigarettes.",
  'hasCigsData': "That's roughly {cigs} cigarettes you chose not to smoke.",
  'default': "Every day you don't smoke is a day your body continues to heal.",
};

const _reductionBodies = {
  'hasTimeData': "You've reclaimed approximately {hours} hours of your time.",
  'hasUrgeData': "You've resisted {urges} urges this month.",
  'default': "Every day of self-control builds the version of yourself you want to be.",
};

const _closings = [
  "Keep going. You're building something real.",
  "One day at a time — and today counts.",
  "Your journey is yours. No one can take your progress away.",
  "Whatever comes next, you have tools to handle it.",
  "You chose your values again today. That matters.",
];
```

### 10.2 Personalization Hooks

The engine branches on available profile data (using `ProfileCompleteness`):

```dart
String _bodySentence(GoalType mode, Statistics stats, UserProfile profile) {
  if (mode == GoalType.quitSmoking) {
    if (stats.moneySaved != null && stats.moneySaved! > 0) {
      return _smokingBodies['hasMoneyData']!
          .replaceAll('{currency}', _currencySymbol(profile))
          .replaceAll('{money}', stats.moneySaved!.toStringAsFixed(0));
    }
    if (stats.cigarettesAvoided != null && stats.cigarettesAvoided! > 0) {
      return _smokingBodies['hasCigsData']!
          .replaceAll('{cigs}', stats.cigarettesAvoided!.toString());
    }
    return _smokingBodies['default']!;
  }
  // Reduction mode — mirror pattern
  ...
}
```

**Rotation:** The summary changes once per day (or once per week per user preference). A hash of `forDate` selects the closing sentence deterministically, so it doesn't feel random.

---

## 11. Non-Functional Requirements — Final Pass

### 11.1 Performance Targets

**NFR-05 — Cold start ≤ 2 seconds:**

Optimization checklist before release:
- [ ] `main()` defers all non-essential initialization with `WidgetsBinding.instance.addPostFrameCallback`.
- [ ] `IsarService.open()` is awaited before `runApp()` only for the encrypted key retrieval. Isar itself opens lazily.
- [ ] `ToolkitSeedService.seedIfNeeded()` runs off the main isolate via `compute()` on first launch only.
- [ ] No synchronous file I/O on the main thread during startup.
- [ ] `SplashScreen` (or `MaterialApp` home splash) renders immediately; `ProfileBloc` equivalent (`RelapseNotifier`) resolves in background.
- Measure with: `flutter run --release --profile` → Flutter DevTools → Timeline → "Cold Start".

**NFR-06 — Dashboard render ≤ 500ms:**

- [ ] `DashboardScreen` uses `const` constructors on all static child widgets.
- [ ] `statisticsProvider` resolves before first render via `SplashScreen` guard.
- [ ] No `FutureProvider` inside `build()` without `AsyncValue.when()` skeleton state.
- [ ] `fl_chart` charts are lazy-loaded (not rendered until tab is visible).

**NFR-07 — Primary log action ≤ 3 taps:**

Verify the tap path:
1. Dashboard → FAB or Log tab icon (tap 1)
2. Quick log sheet appears (tap 2)
3. Select event type (tap 3) — event logged ✅

This requires no sub-navigation inside the quick log sheet for the primary event types.

### 11.2 Accessibility Audit

**Tools:**
- Flutter Accessibility Scanner (automated — run on all P0 screens)
- VoiceOver (iOS) — manual walkthrough of onboarding, dashboard, toolkit, lapse recovery
- TalkBack (Android) — same walkthrough
- Large text test (200% scaling) — all screens, use `MediaQuery.textScaleFactor = 2.0` in integration tests

**Checklist (per NFR-08/09):**

- [ ] All `IconButton` widgets have `tooltip` set.
- [ ] All `Image` / emoji `Text` used as icons have `Semantics(label: ...)` wrapper.
- [ ] `BreathingAnimation` circle has `Semantics(liveRegion: true)`.
- [ ] `DistressTrendChart` has `Semantics(label: 'Distress trend chart, ...')`.
- [ ] All `LinearProgressIndicator` widgets have `Semantics(value: ..., label: ...)`.
- [ ] `AchievementBadgeCard` has correct label (see §4.8).
- [ ] `DailyCheckinBanner` dismiss button has `tooltip: 'Dismiss check-in'`.
- [ ] No content conveyed by color alone (all charts have text labels).
- [ ] Minimum touch target 48×48dp on all interactive elements.
- [ ] Focus traversal order correct on all form screens.

**WCAG 2.1 AA Contrast ratios — verify design tokens:**

| Token pair | Required ratio | Pass? |
|---|---|---|
| `colorPrimary (#1B3A6B)` on `colorSurface (#FFFFFF)` | 4.5:1 | ✅ ~11:1 |
| `colorSecondary (#2D9B6F)` on `colorSurface (#FFFFFF)` | 4.5:1 | ✅ ~4.6:1 |
| `colorError (#B00020)` on `colorSurface (#FFFFFF)` | 4.5:1 | ✅ ~5.4:1 |
| Body text on dark background `#1E1E1E` | 4.5:1 | Must verify |
| `colorSecondary (#4FC28E)` on `#121212` (dark mode) | 4.5:1 | Must verify — borderline |

### 11.3 Localization

**Current state:** Strings are largely hardcoded. This must be resolved before release.

**Enforcement steps:**

1. Run `flutter gen-l10n` — this is already configured per `flutter_localizations` in `pubspec.yaml`.
2. Add `flutter gen-l10n` to the CI pipeline. Make the build fail if ARB files are out of sync.
3. Move all user-facing strings to `app_en.arb`. Use the `AppLocalizations.of(context)!.xxx` pattern.
4. Add `analysis_options.yaml` rule: flag any `Text('hardcoded string')` containing ASCII letters — this can be partially enforced via a custom lint rule or a CI grep step.

**ARB file structure:**

```
l10n/
├── app_en.arb    ← English (required)
└── app_nl.arb    ← Dutch (Rotterdam user base — optional for v1)
```

**Minimum ARB key categories required:**
- Onboarding strings (welcome, goal descriptions, form labels, skip)
- Dashboard strings (streak label, money saved, cigarettes avoided)
- Toolkit strings (exercise names, phase labels, feedback options)
- Settings strings (all menu items, confirmation dialogs)
- Notification strings (all templates — already in `notification_content.dart`)
- Error strings (export failed, auth failed, etc.)
- Achievement names and descriptions

**RTL support:** `app_en.arb` includes `"@@locale": "en"` and `"@xxx": {"description": "..."}` for all keys. The project structure already includes `app_ar.arb` placeholder for Arabic RTL support (from SRS §13.1 project structure).

### 11.4 App Size & Assets

Per NFR-15: install size ≤ 30 MB (Android APK split by ABI).

**Verification:**

```bash
flutter build apk --split-per-abi --release
# Check output size of:
# build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
# Target: < 30 MB
```

**Asset rules:**
- No bundled videos or GIFs (SRS NFR-15).
- Breathing animation: pure `AnimationController` + custom painter (no assets).
- Icons: all emoji (no custom icon files required).
- Streak flame: emoji + text styling (no asset files).
- Achievement badges: emoji + card styling (no image assets).
- If a splash screen image is added: use a simple SVG or 1-color PNG < 10KB.

**If size exceeds 30MB:** Remove any transitive dependencies that bundle native libraries unnecessarily. Audit `flutter pub deps` for hidden large packages.

### 11.5 Security Verification Checklist

Per SRS NFR-02 and BR-04:

- [ ] Isar AES key is generated with `Hive.generateSecureKey()` equivalent (32 random bytes).
- [ ] Key is stored in `FlutterSecureStorage` only — never in `SharedPreferences`.
- [ ] Key is never logged (`debugPrint`) in any configuration.
- [ ] `android:allowBackup="false"` in `AndroidManifest.xml`.
- [ ] Isar box files are binary (not readable as plaintext) on a rooted device.
- [ ] `flutter_secure_storage` uses Android Keystore on Android, iOS Keychain on iOS.
- [ ] `export_service.dart` does not include raw encryption keys in the export JSON.
- [ ] Network monitoring in QA: zero outbound HTTP requests during any app flow.
- [ ] Background tap handler for notifications does not log sensitive payload data.

---

## 12. Data Model Revisions

### 12.1 AchievementModel Isar Collection

Already defined in §4.2. Register in `IsarService`.

```dart
// Isar schema registration addition:
AchievementModelSchema,
```

**Seeding:** Called from `main()` after `IsarService` and `ToolkitSeedService`. Uses `AchievementSeedService.seedIfNeeded(userId, mode)` — seeds all achievement definitions for the user's mode with `isUnlocked = false`, then runs initial engine evaluation.

### 12.2 WeeklyReviewModel Isar Collection

Stores a snapshot of the weekly review for caching and notification reference.

```dart
@collection
class WeeklyReviewModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Index()
  late DateTime weekStart; // Monday 00:00 UTC of the reviewed week

  late int checkInsCount;
  late int toolkitSessionsCount;
  late int cravingsResisted;
  late int lapseEvents;
  String? topTrigger;
  String? mostUsedExercise;
  String? motivationalSummary;
  late DateTime generatedAt;
}
```

The weekly review is re-generated on the Monday of each new week (or on first launch of the week). Cached to avoid re-computation.

### 12.3 CheckInModel Isar Collection

Daily check-ins are logged as `LogEntry` records (type `LogType.dailyCheckin`) — **no separate collection needed**. The `distressRating` field on `LogEntry` carries the distress score. Dismissed (not completed) check-ins are tracked only in memory via a `dismissedTodayProvider` that resets on app restart.

> **Design decision:** Dismissed check-ins are NOT persisted. If the user dismisses, the banner won't show again until tomorrow (same calendar day check). This is simpler than writing a dismissal record.

### 12.4 ReasonsWallModel Isar Collection

The Reasons Wall uses `UserProfile.values: List<String>` — **no separate collection needed**. Values are stored directly on the profile. The `ReasonsWallEditSheet` writes back to `UserProfile` via `profileRepository.updateProfile()`.

### 12.5 Isar Registration — Final Checklist

Complete list of all Isar collections that must be registered in `IsarService.instance`:

```dart
await Isar.open(
  [
    // Core
    UserProfileModelSchema,

    // Tracking
    LogEventModelSchema,

    // Craving Toolkit
    ToolkitExerciseModelSchema,
    ToolkitSessionModelSchema,
    JournalEntryModelSchema,

    // Relapse Prevention
    RelapsePlanModelSchema,
    RelapseContactModelSchema,
    LapseRecoverySessionModelSchema,

    // Interventions / Notifications
    NotificationPreferencesModelSchema,
    NotificationHistoryModelSchema,

    // Achievements (NEW)
    AchievementModelSchema,

    // Weekly Review (NEW)
    WeeklyReviewModelSchema,
  ],
  directory: dir.path,
  encryptionKey: encryptionKey,
  name: 'quitmate',
);
```

---

## 13. State Management Revisions

### 13.1 AchievementProvider Architecture

**File:** `lib/features/achievements/presentation/providers/achievement_provider.dart`

```dart
// All achievements for the current user's mode
final achievementsProvider = FutureProvider.autoDispose<List<Achievement>>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) return [];
  final repo = ref.read(achievementRepositoryProvider);
  return repo.getAchievements(userId);
});

// Earned achievements only
final earnedAchievementsProvider = FutureProvider.autoDispose<List<Achievement>>((ref) async {
  final all = await ref.read(achievementsProvider.future);
  return all.where((a) => a.isUnlocked).toList()
    ..sort((a, b) => b.unlockedAt!.compareTo(a.unlockedAt!));
});

// Notifier for engine evaluation and persistence
class AchievementNotifier extends AutoDisposeAsyncNotifier<List<Achievement>> {
  @override
  Future<List<Achievement>> build() async {
    final userId = await ref.watch(currentUserIdProvider.future);
    if (userId == null) return [];
    final repo = ref.read(achievementRepositoryProvider);
    return repo.getAchievements(userId);
  }

  Future<void> evaluate() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;

    final statistics = ref.read(statisticsProvider).statistics;
    final recentLogs = await ref.read(logRepositoryProvider).getRecentLogs(userId);
    final profile = await ref.read(profileRepositoryProvider).getProfile(userId);
    final mode = profile?.goalType ?? GoalType.quitSmoking;

    final current = state.valueOrNull ?? [];
    final engine = AchievementEngine();
    final updates = engine.evaluate(
      existing: current,
      statistics: statistics,
      recentLogs: recentLogs,
      mode: mode,
    );

    if (updates.isEmpty) return;

    // Persist updates
    final repo = ref.read(achievementRepositoryProvider);
    await repo.applyUpdates(userId, updates);

    // Show unlock animations for just-unlocked achievements
    final justUnlocked = updates
        .where((u) => u.justUnlocked)
        .map((u) => current.firstWhere((a) => a.id == u.achievementId))
        .toList();

    // Notify presentation layer via a separate provider
    ref.read(pendingUnlockAnimationsProvider.notifier).enqueue(justUnlocked);

    ref.invalidateSelf();
  }
}

final achievementNotifierProvider =
    AsyncNotifierProvider.autoDispose<AchievementNotifier, List<Achievement>>(
  AchievementNotifier.new,
);

// Queue for unlock animations — presentation only
final pendingUnlockAnimationsProvider =
    StateNotifierProvider<_UnlockQueueNotifier, List<Achievement>>(
  (ref) => _UnlockQueueNotifier(),
);
```

### 13.2 ProgressProvider Architecture

**File:** `lib/features/tracking/presentation/providers/progress_provider.dart`

```dart
class ProgressScreenData {
  final Statistics statistics;
  final ProfileCompleteness completeness;
  final List<Achievement> recentAchievements;  // last 3 earned
  final WeeklyReviewData? weeklyReview;
  final String motivationalSummary;
  final double consistencyScore;
}

final progressScreenProvider =
    FutureProvider.autoDispose<ProgressScreenData>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) throw Exception('No user ID');

  final statistics   = ref.read(statisticsProvider).statistics;
  final completeness = await ref.read(profileCompletenessProvider.future);
  final achievements = await ref.read(achievementsProvider.future);
  final profile      = await ref.read(profileRepositoryProvider).getProfile(userId);
  final weekReview   = await ref.read(weeklyReviewRepositoryProvider)
      .getThisWeekReview(userId);

  final summary = MotivationalSummaryEngine().generate(
    stats: statistics,
    profile: profile!,
    forDate: DateTime.now(),
  );

  return ProgressScreenData(
    statistics: statistics,
    completeness: completeness,
    recentAchievements: achievements
        .where((a) => a.isUnlocked)
        .take(3)
        .toList(),
    weeklyReview: weekReview,
    motivationalSummary: summary,
    consistencyScore: statistics.consistencyScore,
  );
});
```

### 13.3 SettingsProvider Architecture

**File:** `lib/features/settings/presentation/providers/settings_provider.dart`

```dart
class AppSettingsState {
  final ThemeMode themeMode;
  final String languageCode;
  final bool privacyLockEnabled;
  final bool isLoading;
  final String? error;

  const AppSettingsState({
    this.themeMode = ThemeMode.system,
    this.languageCode = 'en',
    this.privacyLockEnabled = false,
    this.isLoading = false,
    this.error,
  });

  AppSettingsState copyWith({...}) => ...;
}

class SettingsNotifier extends AutoDisposeAsyncNotifier<AppSettingsState> {
  @override
  Future<AppSettingsState> build() async {
    final userId = await ref.watch(currentUserIdProvider.future);
    if (userId == null) return const AppSettingsState();
    final repo = ref.read(settingsRepositoryProvider);
    final settings = await repo.getSettings(userId);
    return AppSettingsState(
      themeMode: settings.themeMode,
      languageCode: settings.languageCode,
      privacyLockEnabled: settings.privacyLockEnabled,
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    final current = state.valueOrNull ?? const AppSettingsState();
    state = AsyncData(current.copyWith(themeMode: mode));
    await _save((s) => s.themeMode = mode.name);
  }

  Future<void> setPrivacyLock(bool enabled) async {
    final current = state.valueOrNull ?? const AppSettingsState();
    state = AsyncData(current.copyWith(privacyLockEnabled: enabled));
    await _save((s) => s.privacyLockEnabled = enabled);
  }

  Future<void> _save(void Function(AppSettingsModel) mutate) async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;
    final repo = ref.read(settingsRepositoryProvider);
    final current = await repo.getSettings(userId);
    mutate(current);
    await repo.saveSettings(current);
  }
}

// Global theme provider read by MaterialApp
final appThemeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(settingsNotifierProvider).valueOrNull?.themeMode
      ?? ThemeMode.system;
});
```

**`MaterialApp` integration:**

```dart
// In app.dart:
final themeMode = ref.watch(appThemeModeProvider);

return MaterialApp(
  themeMode: themeMode,
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  ...
);
```

### 13.4 ExportProvider Architecture

Already defined in §7.4. Key additions:

```dart
// State for export UI
class ExportState {
  final ExportStatus status;
  final String? errorMessage;
  final String? exportedFilePath;

  const ExportState.idle()   : status = ExportStatus.idle, errorMessage = null, exportedFilePath = null;
  const ExportState.success(): status = ExportStatus.success, errorMessage = null, exportedFilePath = null;
  const ExportState.deleted(): status = ExportStatus.deleted, errorMessage = null, exportedFilePath = null;
}

enum ExportStatus { idle, loading, success, error, deleted }
```

### 13.5 CheckInProvider Architecture

**File:** `lib/features/tracking/presentation/providers/checkin_provider.dart`

```dart
final hasCheckedInTodayProvider = FutureProvider.autoDispose<bool>((ref) async {
  // Auto-invalidates on logHistoryProvider invalidation
  ref.watch(logHistoryInvalidatorProvider);
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) return false;
  return ref.read(logRepositoryProvider)
      .hasEventToday(userId: userId, type: LogType.dailyCheckin);
});

class CheckInNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  Future<void> submit({
    required int moodScore,          // 1–5
    required bool hadCraving,
    required int? distressRating,    // reduction mode only
    required bool? actedOnUrge,      // reduction mode only
    required bool? smokedToday,      // smoking mode only
    required String? cravingLevel,   // 'low'/'medium'/'high' — smoking mode
  }) async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;
    final mode = ref.read(currentModeProvider);

    // Write primary check-in event
    await ref.read(logRepositoryProvider).addEntry(LogEntry(
      userId: userId,
      type: LogType.dailyCheckin,
      timestamp: DateTime.now().toUtc(),
      distressRating: distressRating,
      mode: mode ?? 'quitSmoking',
    ));

    // Write secondary events
    if (smokedToday == true) {
      await ref.read(logRepositoryProvider).addEntry(LogEntry(
        userId: userId,
        type: LogType.cigaretteSmoked,
        timestamp: DateTime.now().toUtc(),
        mode: mode ?? 'quitSmoking',
      ));
    }

    // Invalidate related providers
    ref.invalidate(hasCheckedInTodayProvider);
    ref.invalidate(statisticsProvider);

    // Trigger achievement evaluation
    await ref.read(achievementNotifierProvider.notifier).evaluate();
  }

  void dismissForToday() {
    // In-memory only — sets a flag that suppresses the banner until next app open
    ref.read(_dismissedTodayProvider.notifier).state = true;
  }
}

final _dismissedTodayProvider = StateProvider.autoDispose<bool>((ref) => false);
```

---

## 14. Screen Inventory — Final State

Complete screen inventory for the baseline release. All screens listed must be implemented before v1.0 ships.

```
ONBOARDING FLOW
├── S01: WelcomeScreen                     ✅ Implemented
├── S02: GoalSelectionScreen               ✅ Implemented
├── S03a: SmokingProfileFormScreen         ✅ Implemented
├── S03b: ReductionProfileFormScreen       ✅ Implemented
├── S04: QuitDateScreen                    ✅ Implemented
└── S05: OnboardingCompleteScreen          ✅ Implemented

MAIN APP (Bottom Navigation: 4 tabs)
├── Tab 1: DashboardScreen                 ✅ Implemented
│   ├── SmokingDashboard                   ✅ Implemented
│   │   └── HealthMilestoneProgressBar     ⚠️ Partial
│   └── ReductionDashboard                 ✅ Implemented
│       └── DistressTrendChart             ⚠️ Partial
│
├── Tab 2: LogScreen (QuickLogSheet)       ✅ Implemented
│
├── Tab 3: ProgressScreen                  ❌ Stub — implement this phase
│   ├── MotivationalSummaryCard            ❌ New
│   ├── ConsistencyScoreCard               ❌ New
│   ├── HealthMilestoneSection             ❌ New
│   ├── RecoveryStatsCard                  ❌ New
│   ├── AchievementsPreviewCard            ❌ New
│   └── ToolkitUsageSummaryCard            ❌ New
│
└── Tab 4: SettingsScreen                  ⚠️ Partial — implement sub-screens

MODAL / OVERLAY SCREENS
├── S50: CravingToolkitScreen              ✅ Implemented
├── S51a–g: Exercise Screens               ✅ Implemented
├── S60: LapseRecoveryScreen               ✅ Implemented
├── S70: BadgeGalleryScreen                ❌ New
├── S80: JournalEntryScreen                ✅ Implemented
├── S81: JournalListScreen                 ✅ Implemented
├── S90: LogHistoryScreen                  ❌ New
├── S91: ToolkitHistoryScreen              ❌ New
├── S92: WeeklyReviewScreen                ❌ New
├── S93: HealthMilestoneScreen             ❌ New
└── S95: HelpSafetyScreen                  ✅ Implemented

SETTINGS SUB-SCREENS
├── S41: NotificationSettingsScreen        ✅ Implemented
├── S42: PrivacySecurityScreen             ❌ New
├── S43: ExportDataScreen                  ❌ New
├── S44: DeleteAllDataScreen               ❌ New
├── S45: ResetProfileScreen                ❌ New
├── S46: AboutScreen                       ❌ New
├── S47: LanguageSettingsScreen            ❌ New
├── S48: EditProfileScreen                 ⚠️ Partial
└── LockScreen                             ❌ New
```

---

## 15. Implementation Sequence

Implement strictly in this order. Each phase is independently testable.

### Phase 1 — Achievement Foundation (~2 days)

1. Create `Achievement` domain entity + `AchievementCategory` enum
2. Create `AchievementModel` Isar collection + run `build_runner`
3. Register `AchievementModelSchema` in `IsarService`
4. Create `IAchievementRepository` interface + `AchievementRepositoryImpl`
5. Create `AchievementEngine` (pure Dart, fully unit-testable)
6. Write unit tests for `AchievementEngine` — all 18+ achievement IDs
7. Create `AchievementSeedService` — seeds all definitions for user's mode
8. Wire `AchievementSeedService.seedIfNeeded()` in `main()` after profile load

### Phase 2 — Achievement UI (~2 days)

9. Create `AchievementNotifier` + `achievementNotifierProvider`
10. Create `AchievementUnlockOverlay` widget
11. Create `_AchievementOverlayWidget` with `flutter_animate` scale animation
12. Create `AchievementBadgeCard` widget (locked + unlocked variants)
13. Create `BadgeGalleryScreen` with GridView + section headers
14. Create `AchievementsPreviewCard` for Progress tab (3 recent + "View All")
15. Wire achievement evaluation trigger to: app cold start, log events, toolkit session end, check-in submit

### Phase 3 — Streak Flame & Reasons Wall (~1 day)

16. Enhance `StreakCard` with `_FlameIntensity` enum and styled emoji
17. Implement reduction mode leaf/shield icon variants
18. Create `ReasonsWallCard` widget for dashboards
19. Create `ReasonsWallEditSheet` bottom sheet
20. Wire `ReasonsWallCard` into `SmokingDashboard` and `ReductionDashboard`
21. Wire Reasons Wall data from `UserProfile.values` via `profileProvider`

### Phase 4 — Progress Tab (~3 days)

22. Create `MotivationalSummaryEngine` (pure Dart)
23. Create `progressScreenProvider` aggregating all data
24. Create `ProgressScreen` with `CustomScrollView` layout
25. Create `MotivationalSummaryCard` (collapsed/expanded)
26. Create `ConsistencyScoreCard`
27. Create `HealthMilestoneSection` (smoking mode — `kHealthMilestones` static data)
28. Create `HealthMilestoneScreen` (full timeline)
29. Create `DistressTrendChart` widget (fl_chart, requires ≥3 points)
30. Create `RecoveryStatsCard`
31. Create `ToolkitUsageSummaryCard`
32. Create `WeeklyReviewScreen` + `WeeklyReviewData` model
33. Create `WeeklyReviewModel` Isar collection + register schema
34. Create `LogHistoryScreen` with filter chips and timeline `ListView`
35. Create `ToolkitHistoryScreen` with date-grouped sessions

### Phase 5 — Daily Check-In (~1 day)

36. Create `DailyCheckinBanner` widget
37. Create `DailyCheckinSheet` bottom sheet (mode-aware fields)
38. Create `CheckInNotifier` + `checkinProvider`
39. Create `hasCheckedInTodayProvider`
40. Create `logRepositoryProvider.hasEventToday()` query method
41. Wire `DailyCheckinBanner` into `SmokingDashboard` and `ReductionDashboard`
42. Wire check-in submit → achievement evaluation → statistics invalidation
43. Wire check-in submit → distress trend data update

### Phase 6 — Settings Sub-Screens (~2 days)

44. Create `PrivacySecurityScreen` with `local_auth` toggle
45. Create `LockScreen` with `WidgetsBindingObserver`
46. Create `PrivacyLockService` with biometric + PIN + graceful degradation
47. Create `ThemeSettingsSheet` (bottom sheet — not full screen)
48. Create `LanguageSettingsScreen` (list of supported locales)
49. Create `AboutScreen` with version from `package_info_plus`
50. Create `ResetProfileScreen` with two-step confirmation
51. Create `DeleteAllDataScreen` with checkbox + two-step confirmation
52. Implement `ThemeMode` persistence in `AppSettings` + `settingsProvider`
53. Wire `appThemeModeProvider` into `MaterialApp.themeMode`

### Phase 7 — Data Export (~2 days)

54. Create `ExportService` (pure Dart, no Flutter dependencies)
55. Create `ExportDataScreen` with JSON/CSV options + "Include profile" toggle
56. Create `ExportNotifier` + `exportProvider`
57. Implement `exportJson()` with `path_provider` + `share_plus`
58. Implement `exportCsv()` with same pattern
59. Implement `deleteAllData()` — `isar.clear()` + `FlutterSecureStorage().deleteAll()` + cancel notifications
60. Integration test: write data → export → verify valid JSON → import check
61. Integration test: delete → reopen → verify zero Isar records

### Phase 8 — Localization (~2 days)

62. Create `l10n/app_en.arb` with all user-facing strings
63. Move all hardcoded strings to ARB file using `AppLocalizations.of(context)!.xxx`
64. Add `flutter gen-l10n` to CI pipeline as required step
65. Add CI grep step to detect hardcoded ASCII strings in widget `Text()` calls
66. Create `l10n/app_nl.arb` as optional v1 (Dutch — Rotterdam user base)
67. Update `LanguageSettingsScreen` to switch locale via `ref.read(localeProvider.notifier).state`
68. Add `localeProvider` and wire to `MaterialApp.locale`

### Phase 9 — NFR Final Pass (~2 days)

69. Cold start performance measurement (Flutter DevTools Timeline, release mode)
70. Dashboard render time measurement
71. Flutter Accessibility Scanner — all P0 screens
72. VoiceOver (iOS) and TalkBack (Android) manual walkthroughs
73. Large text (200%) test — all screens
74. Content audit grep — ARB files + static content strings for banned phrases
75. App size measurement (`flutter build apk --split-per-abi --release`)
76. Security audit — rooted Android check for plaintext data
77. Network monitoring — verify zero outbound requests for all flows
78. Unit test coverage measurement (`flutter test --coverage`)
79. Fix any coverage gaps below 80% in domain/data layers

### Phase 10 — QA & Release Gate (~2 days)

80. Full regression test on all P0 screens (see §18)
81. Integration test: full onboarding → dashboard → toolkit → lapse → recovery → export → delete
82. Verify all acceptance criteria from all predecessor documents still pass
83. Complete release gate checklist (see §19)

---

## 16. File-Level Change Matrix

### New Files to Create

| File | Purpose | Phase |
|---|---|---|
| `achievements/domain/entities/achievement.dart` | Achievement domain entity | 1 |
| `achievements/domain/entities/achievement_category.dart` | Enum | 1 |
| `achievements/domain/services/achievement_engine.dart` | Pure Dart evaluation engine | 1 |
| `achievements/domain/repositories/i_achievement_repository.dart` | Interface | 1 |
| `achievements/data/models/achievement_model.dart` | Isar collection | 1 |
| `achievements/data/models/achievement_model.g.dart` | Generated | 1 |
| `achievements/data/repositories/achievement_repository_impl.dart` | Repo impl | 1 |
| `achievements/data/datasources/achievement_seed_service.dart` | Seeding service | 1 |
| `achievements/presentation/providers/achievement_provider.dart` | Riverpod providers | 2 |
| `achievements/presentation/screens/badge_gallery_screen.dart` | Badge Gallery screen | 2 |
| `achievements/presentation/widgets/achievement_badge_card.dart` | Badge card widget | 2 |
| `achievements/presentation/widgets/achievement_unlock_overlay.dart` | Unlock animation | 2 |
| `achievements/presentation/widgets/achievements_preview_card.dart` | Progress tab preview | 2 |
| `tracking/presentation/widgets/reasons_wall_card.dart` | Dashboard reasons widget | 3 |
| `tracking/presentation/widgets/reasons_wall_edit_sheet.dart` | Edit sheet | 3 |
| `tracking/domain/services/motivational_summary_engine.dart` | Summary generator | 4 |
| `tracking/presentation/screens/progress_screen.dart` | Full progress tab | 4 |
| `tracking/presentation/screens/weekly_review_screen.dart` | Weekly review | 4 |
| `tracking/presentation/screens/health_milestone_screen.dart` | Milestone timeline | 4 |
| `tracking/presentation/screens/log_history_screen.dart` | Log timeline + filters | 4 |
| `tracking/presentation/screens/toolkit_history_screen.dart` | Toolkit session history | 4 |
| `tracking/presentation/widgets/motivational_summary_card.dart` | Summary card | 4 |
| `tracking/presentation/widgets/consistency_score_card.dart` | Consistency metric | 4 |
| `tracking/presentation/widgets/distress_trend_chart.dart` | Reduction trend chart | 4 |
| `tracking/presentation/widgets/recovery_stats_card.dart` | Recovery stats | 4 |
| `tracking/presentation/widgets/toolkit_usage_summary_card.dart` | Toolkit summary | 4 |
| `tracking/presentation/widgets/health_milestone_progress_bar.dart` | Dashboard progress bar | 4 |
| `tracking/presentation/providers/progress_provider.dart` | Progress screen data | 4 |
| `tracking/data/models/weekly_review_model.dart` | Isar collection | 4 |
| `tracking/data/models/weekly_review_model.g.dart` | Generated | 4 |
| `tracking/presentation/widgets/daily_checkin_banner.dart` | Dashboard banner | 5 |
| `tracking/presentation/widgets/daily_checkin_sheet.dart` | Check-in bottom sheet | 5 |
| `tracking/presentation/providers/checkin_provider.dart` | Check-in state | 5 |
| `settings/presentation/screens/privacy_security_screen.dart` | Privacy settings | 6 |
| `settings/presentation/screens/export_data_screen.dart` | Export screen | 6 |
| `settings/presentation/screens/delete_data_screen.dart` | Delete screen | 6 |
| `settings/presentation/screens/reset_profile_screen.dart` | Reset screen | 6 |
| `settings/presentation/screens/about_screen.dart` | About screen | 6 |
| `settings/presentation/screens/language_settings_screen.dart` | Language picker | 6 |
| `settings/presentation/widgets/theme_settings_sheet.dart` | Theme bottom sheet | 6 |
| `settings/presentation/providers/settings_provider.dart` | Settings notifier | 6 |
| `settings/presentation/providers/export_provider.dart` | Export notifier | 7 |
| `settings/domain/services/export_service.dart` | Pure Dart export | 7 |
| `settings/services/privacy_lock_service.dart` | Biometric service | 6 |
| `core/presentation/screens/lock_screen.dart` | Privacy lock screen | 6 |
| `core/navigation/help_navigation.dart` | Help bypass navigation | 6 |
| `l10n/app_en.arb` | English strings | 8 |
| `l10n/app_nl.arb` | Dutch strings (optional v1) | 8 |

### Files to Modify

| File | Changes |
|---|---|
| `core/services/database/isar_service.dart` | Register `AchievementModelSchema`, `WeeklyReviewModelSchema` |
| `main.dart` | Wire `AchievementSeedService.seedIfNeeded()`; add `LockScreen` wrapper |
| `app.dart` | Wire `appThemeModeProvider` to `MaterialApp.themeMode`; wire `localeProvider` to `MaterialApp.locale` |
| `tracking/presentation/widgets/streak_card.dart` | Add flame intensity enum + styled emoji + reduction icon variants |
| `tracking/presentation/widgets/smoking_dashboard.dart` | Add `ReasonsWallCard`, `HealthMilestoneProgressBar`, `DailyCheckinBanner` |
| `tracking/presentation/widgets/reduction_dashboard.dart` | Add `ReasonsWallCard`, `DistressTrendChart` (wired), `DailyCheckinBanner` |
| `tracking/services/statistics_calculator.dart` | Add `consistencyScore` calculation; add `topTrigger` computation |
| `tracking/data/repositories/log_repository_impl.dart` | Add `hasEventToday()` method; add `getAllEvents()` for export |
| `settings/presentation/screens/settings_screen.dart` | Add all missing list tile rows + navigation |
| `relapse_prevention/presentation/screens/help_safety_screen.dart` | Verify auth bypass route is correctly unguarded |
| `pubspec.yaml` | Add `package_info_plus`, `share_plus` (if not present), `local_auth` (if not present) |

---

## 17. Acceptance Criteria Checklist

### Achievement System

- [ ] `AchievementEngine.evaluate()` correctly computes all 18+ achievement progress values
- [ ] Achievements are seeded on first run with `isUnlocked = false`
- [ ] `AchievementEngine` evaluation runs on cold start, after log events, after toolkit sessions, and after check-in
- [ ] Achievements once unlocked are never reverted (even after lapse)
- [ ] `BadgeGalleryScreen` shows earned achievements in full color with gold border
- [ ] Locked badges shown in greyscale with `LinearProgressIndicator` below icon
- [ ] Achievement unlock overlay appears for newly earned achievements (not on first launch batch)
- [ ] Multiple unlocks are queued — not stacked simultaneously
- [ ] Unlock overlay auto-dismisses after 2.5 seconds; tappable to dismiss early
- [ ] Reduction mode achievement copy is values-affirming, not moralistic (BR-08)
- [ ] All achievement copy passes `ContentAuditService.audit()` (BR-09)

### Progress Tab

- [ ] `ProgressScreen` loads within 500ms on mid-range device
- [ ] `WeeklyReviewScreen` accessible from Progress tab AppBar action
- [ ] Weekly review shows all 7 required data sections
- [ ] `HealthMilestoneScreen` shows all 7 milestones with correct durations
- [ ] Dashboard `HealthMilestoneProgressBar` shows next unachieved milestone
- [ ] `DistressTrendChart` renders for ≥3 data points; shows empty state for <3
- [ ] `LogHistoryScreen` filters work correctly for all `LogType` values
- [ ] `ToolkitHistoryScreen` reads from `ToolkitSessionModel` (not old per-type collections)
- [ ] `ConsistencyScoreCard` shows percentage of days with ≥1 check-in
- [ ] Motivational summary is 3–5 sentences, changes daily, never shame-language

### Daily Check-In

- [ ] Check-in banner appears once per calendar day on dashboard
- [ ] Dismissing the banner suppresses it for the rest of that calendar day
- [ ] Completing check-in writes `LogType.dailyCheckin` to Isar with UTC timestamp
- [ ] Distress rating stored as `distressRating` on the `LogEntry`
- [ ] Check-in completion triggers achievement evaluation for engagement category
- [ ] Check-in submission invalidates `statisticsProvider` and `hasCheckedInTodayProvider`
- [ ] Banner never shows if check-in already completed today

### Settings Screen

- [ ] All listed sub-screens navigate correctly from main Settings
- [ ] Theme change applies without app restart
- [ ] Privacy Lock toggle triggers biometric authentication before enabling
- [ ] Privacy Lock screen shows with unlock button and "Get Help" bypass
- [ ] Lock screen appears when app returns from background (if enabled)
- [ ] "Get Help" on lock screen opens `HelpSafetyScreen` without authentication
- [ ] Language settings change applies to all UI strings via `AppLocalizations`

### Data Export

- [ ] JSON export produces valid JSON with correct structure
- [ ] CSV export contains all log events with correct columns
- [ ] Share sheet opens immediately after export file is ready
- [ ] "Include profile" toggle omits profile data when off
- [ ] Export works fully offline (no network) (NFR-01)

### Delete & Reset

- [ ] Delete All Data requires checkbox tick + button press + confirmation dialog (3 steps total)
- [ ] After deletion: zero Isar records, zero secure storage keys (integration test)
- [ ] After deletion: all pending notifications cancelled
- [ ] Reset Profile: deletes all data + navigates to `WelcomeScreen` with mode unlock
- [ ] Reset Profile confirmation dialog appears before any data is deleted

### Localization

- [ ] `flutter gen-l10n` runs without errors
- [ ] Zero hardcoded ASCII strings in any `Text()` widget in user-facing screens
- [ ] ARB enforcement passes in CI pipeline
- [ ] Language switch persists across app restarts

### Non-Functional

- [ ] Cold start ≤ 2000ms on 2GB RAM Android release build (NFR-05)
- [ ] Dashboard first meaningful paint ≤ 500ms (NFR-06)
- [ ] Primary log action ≤ 3 taps from home screen (NFR-07)
- [ ] Flutter Accessibility Scanner: zero violations on all P0 screens (NFR-08/09)
- [ ] All interactive elements have semantic labels (NFR-09)
- [ ] Content audit grep: zero banned phrases in all ARB files + static content (NFR-10)
- [ ] Unit test coverage ≥ 80% on domain + data layers (NFR-12)
- [ ] Install size ≤ 30MB Android APK (NFR-15)
- [ ] Network monitor: zero outbound HTTP requests during any app flow (NFR-01)
- [ ] Security audit: no plaintext data in app storage on rooted Android (NFR-02)

---

## 18. QA Traceability Matrix

| Requirement | Test Type | Test Description | Priority |
|---|---|---|---|
| FR-P06: Achievement system | Unit test | `AchievementEngine.evaluate()` returns correct updates for all 18+ IDs given mock statistics | P0 |
| FR-P06: Achievements persist | Integration test | Complete achievement → kill app → reopen → achievement still unlocked | P0 |
| FR-P07: Badge Gallery | Widget test | `BadgeGalleryScreen` shows earned badges (full color, gold border) and locked badges (greyscale, progress bar) | P1 |
| FR-P08: Streak flame | Widget test | `StreakCard` renders `_FlameIntensity.blazing` emoji styling at day ≥ 90 streak | P2 |
| FR-P09: Reasons Wall | Widget test | `ReasonsWallCard` hidden when values empty; shows chips when values set; edit sheet saves to `UserProfile.values` | P1 |
| FR-P05: Motivational summary | Unit test | `MotivationalSummaryEngine.generate()` returns 3–5 sentences for all mode/streak combinations | P1 |
| FR-C15: Daily check-in | Widget test | `DailyCheckinBanner` shown once per day; hidden after check-in or dismiss; reappears next calendar day | P0 |
| FR-C16: Weekly review | Integration test | Open `WeeklyReviewScreen` → verify all 7 sections populated from last 7 days of log data | P1 |
| FR-D01: Settings completeness | Widget test | Render `SettingsScreen` → verify all listed rows present | P0 |
| FR-D02: JSON export | Integration test | Export JSON → parse → verify all `logEvents`, `toolkitSessions`, `journalEntries` present | P0 |
| FR-D02: CSV export | Integration test | Export CSV → parse → verify header row and all log event columns correct | P0 |
| FR-D03: Delete two-step | Widget test | `DeleteAllDataScreen` — button disabled without checkbox; confirmation required | P0 |
| FR-D03: Delete wipes data | Integration test | Write data → delete → reopen → assert zero Isar records, zero secure storage keys | P0 |
| FR-D04: Theme | Widget test | Set dark theme → `MaterialApp.themeMode == ThemeMode.dark` → verify dark colors on screen | P1 |
| FR-C08: Privacy lock | Integration test | Enable lock → background app → resume → verify lock screen shown → authenticate → verify content accessible | P1 |
| FR-C08: Help bypass | Widget test | Lock screen "Get Help" button opens `HelpSafetyScreen` without authentication | P0 |
| FR-C08: Graceful degrade | Device test | Test on device with no PIN set → privacy lock toggle shows warning, does not crash | P1 |
| FR-C10: Export offline | Network test | Disconnect network → export JSON → verify share sheet opens, zero HTTP requests | P0 |
| FR-C11: Delete offline | Network test | Disconnect network → delete data → verify completes, zero HTTP requests | P0 |
| FR-C12: Localization | CI test | `flutter gen-l10n` passes; grep for hardcoded ASCII in `Text()` returns zero matches | P0 |
| US-ON05: Reset profile | Integration test | Settings → Reset Profile → confirm → verify zero Isar records → verify `WelcomeScreen` shown | P0 |
| NFR-05: Cold start | Performance test | Measure cold start on 2GB RAM Android release build via DevTools Timeline: assert ≤ 2000ms | P1 |
| NFR-06: Dashboard render | Performance test | Measure first meaningful paint of `DashboardScreen` after cold start: assert ≤ 500ms | P1 |
| NFR-07: Log ≤ 3 taps | UX walkthrough | Count taps from `DashboardScreen` home to first log event confirmation: assert ≤ 3 | P0 |
| NFR-08: Accessibility | Automated + manual | Flutter Accessibility Scanner on all P0 screens; VoiceOver iOS + TalkBack Android manual walkthrough | P1 |
| NFR-09: Semantic labels | Automated | Custom lint or accessibility tree inspection: zero unlabeled interactive widgets | P1 |
| NFR-10: No shame language | CI test | Grep all ARB files + static content strings against `ContentAuditService._bannedPhrases` list | P0 |
| NFR-12: Test coverage | CI | `flutter test --coverage` → assert ≥ 80% line coverage on `domain/` and `data/` | P1 |
| NFR-13: Export valid | Integration test | Export JSON → `json.decode()` without error; export CSV → parse all rows without error | P0 |
| NFR-13: Delete verified | Integration test | Delete all → open `IsarService` → assert `isar.collection.count() == 0` for every collection | P0 |
| NFR-14: ARB enforced | CI | `flutter gen-l10n` in CI as required step; build fails if ARB out of sync | P0 |
| NFR-15: App size | Build test | `flutter build apk --split-per-abi --release` → assert `app-arm64-v8a-release.apk` ≤ 30MB | P1 |
| BR-04: No plaintext | Security test | Rooted Android: inspect `app/data` directory → Isar box files unreadable, SharedPreferences contain no sensitive keys | P0 |
| BR-08: No punitive gamification | Content review | Achievement copy review: zero moralistic, punitive, or shame-based phrases in all badge descriptions | P0 |
| BR-09: Notification content | CI test | Run `ContentAuditService.audit()` on all notification templates → assert zero violations | P0 |

---

## 19. Release Gate Checklist

This checklist must be completed and signed off before the app is submitted for store review. All items are MUST unless marked SHOULD.

### Feature Completeness
- [ ] All screens listed in §14 are implemented and navigable
- [ ] All MUST-priority functional requirements from SRS §7 are implemented
- [ ] All MUST-priority user stories from SRS §8 are implemented
- [ ] `GoalType.both` is absent from the entire codebase
- [ ] No screen requires an internet connection to function

### Data Integrity
- [ ] Isar AES-256 encryption is active on all sensitive boxes
- [ ] `FlutterSecureStorage` key is the only storage location for the encryption key
- [ ] `android:allowBackup="false"` in AndroidManifest.xml
- [ ] All `DateTime` values stored as UTC in Isar
- [ ] Export JSON and CSV produce valid, parseable files
- [ ] Delete All Data removes every piece of persisted data (verified by integration test)

### Content & Language
- [ ] `ContentAuditService.audit()` passes with zero violations on all notification templates
- [ ] Grep of all ARB files and static strings: zero banned phrases from §5.5
- [ ] All achievement copy (names, descriptions) reviewed and approved — no moralistic framing
- [ ] `HelpSafetyScreen` crisis helpline numbers verified as current
- [ ] App disclaimer on `HelpSafetyScreen` and `AboutScreen` reviewed for accuracy
- [ ] BR-07 verified: app never presents itself as a medical or psychiatric tool in any string

### Performance
- [ ] Cold start ≤ 2000ms on 2GB RAM Android (release mode, measured)
- [ ] Dashboard render ≤ 500ms (measured)
- [ ] Primary log action ≤ 3 taps from home (UX walkthrough verified)
- [ ] Install size ≤ 30MB Android APK (measured)

### Accessibility
- [ ] Flutter Accessibility Scanner: zero violations on all P0 screens
- [ ] VoiceOver (iOS) manual walkthrough completed — core flows accessible
- [ ] TalkBack (Android) manual walkthrough completed — core flows accessible
- [ ] 200% text scaling: all screens render without overflow (tested)
- [ ] All interactive elements have semantic labels (NFR-09)

### Localization
- [ ] `flutter gen-l10n` passes in CI
- [ ] Zero hardcoded ASCII strings in user-facing `Text()` widgets
- [ ] Language selection persists across app restarts

### Testing
- [ ] Unit test coverage ≥ 80% for `domain/` and `data/` layers
- [ ] All P0 widget tests pass
- [ ] All P0 integration tests pass
- [ ] `ContentAuditService` unit test passes (release gate per §5.5)
- [ ] `AchievementEngine` unit tests cover all 18+ achievement IDs

### Security
- [ ] Network monitoring: zero outbound HTTP requests for any user flow
- [ ] Rooted Android inspection: Isar box files are binary (unreadable plaintext)
- [ ] No encryption keys logged anywhere (grep for `hive_key` in log statements)
- [ ] `FlutterSecureStorage` keys verified absent from `SharedPreferences`

### SRS Final Verification
- [ ] Every MUST requirement in SRS §7 has a corresponding test in §18
- [ ] Every MUST business rule in SRS §4.2 is verified by at least one test
- [ ] SRS §15 Safety, Ethics & Content Rules — all items verified against implementation
- [ ] SRS §17 Out of Scope — confirmed no out-of-scope features were accidentally included

---

*End of Gamification, Settings & Final Polish Plan v1.0*

**Stack confirmation:** Flutter · Isar · Riverpod (AsyncNotifier / StateNotifier / FutureProvider / StreamProvider) · Clean Architecture — Domain has ZERO Flutter dependencies.

**Features covered in this document:** Achievement Engine · Badge Gallery · Reasons Wall · Streak Flame Enhancement · Progress Tab · Weekly Review · Health Milestone Timeline · Distress Trend Chart · Log History · Toolkit History · Motivational Summary · Daily Check-In · Full Settings Screen · Export (JSON + CSV) · Delete All Data · Reset Profile · Privacy Lock · Localization · Final NFR Pass · Release Gate.

**This is the final implementation plan for QuitMate v1.0 baseline release.**
