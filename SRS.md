# QuitMate — Software Requirements Specification (SRS)

**Document Version:** 1.0.0  
**Date:** 2026-05-04  
**App Version Analyzed:** 1.0.0 (MVP)  
**Prepared By:** Engineering Review  
**Audience:** Flutter developers, engineering leads, product managers  

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Overall Description](#2-overall-description)
3. [Stakeholders & User Personas](#3-stakeholders--user-personas)
4. [System Context](#4-system-context)
5. [Functional Requirements — Current](#5-functional-requirements--current)
6. [Functional Requirements — Future](#6-functional-requirements--future)
7. [Non-Functional Requirements](#7-non-functional-requirements)
8. [Data Requirements](#8-data-requirements)
9. [Interface Requirements](#9-interface-requirements)
10. [Security Requirements](#10-security-requirements)
11. [Constraints & Assumptions](#11-constraints--assumptions)
12. [Glossary](#12-glossary)
13. [Appendix A: Architecture Diagram](#13-appendix-a-architecture-diagram)
14. [Appendix B: Data Flow Diagram](#14-appendix-b-data-flow-diagram)
15. [Appendix C: Known Issues Register](#15-appendix-c-known-issues-register)

---

## 1. Introduction

### 1.1 Purpose

This Software Requirements Specification (SRS) provides a comprehensive description of the QuitMate mobile application — covering its current implemented state, identified defects, and a complete roadmap of functional and non-functional requirements needed to bring the application to production readiness.

This document serves as the authoritative specification for:
- Developers continuing the codebase
- QA engineers creating test plans
- Product managers planning release milestones

### 1.2 Scope

**QuitMate** is a privacy-first, offline mobile application (Flutter, iOS and Android) that helps users quit or reduce addictive habits — specifically cigarette smoking and compulsive masturbation — through:

- Habit baseline tracking and self-awareness
- Daily habit logging (successes and relapses)
- Craving management tools
- Evidence-based behavioral interventions (CBT, mindfulness)
- Progress visualization and milestone celebration

The application stores all user data locally on-device with no cloud dependency, ensuring complete data privacy.

### 1.3 Document Conventions

| Symbol | Meaning |
|--------|---------|
| `[REQ-CUR-NNN]` | Currently implemented requirement |
| `[REQ-FUT-NNN]` | Future/planned requirement |
| `[BUG-NNN]` | Known defect in current implementation |
| **Bold** | Critical/mandatory requirement |
| *Italic* | Optional or conditional requirement |

### 1.4 References

- Flutter 3.x Documentation: https://docs.flutter.dev
- Isar Database Documentation: https://isar.dev
- Riverpod 2.x Documentation: https://riverpod.dev
- Material 3 Design System: https://m3.material.io

---

## 2. Overall Description

### 2.1 Product Perspective

QuitMate operates as a **standalone mobile application** with no external service dependencies. It is designed to be:
- **Offline-first:** All functionality available without internet connectivity
- **Privacy-preserving:** No data leaves the device
- **Evidence-based:** Techniques drawn from CBT and mindfulness research
- **Cross-platform:** Single Flutter codebase targeting iOS and Android

### 2.2 Product Functions (High Level)

1. **Onboarding** — Personalize the app experience with user goals, baselines, and quit date
2. **Daily Logging** — Record habit outcomes, triggers, and mood
3. **Progress Tracking** — Visualize streaks, money saved, and behavior patterns
4. **Craving Tools** — Real-time coping and urge management
5. **Behavioral Interventions** — CBT and mindfulness exercises
6. **Milestone System** — Celebrate achievements to reinforce behavior change
7. **Settings & Data Control** — User agency over their data and preferences

### 2.3 User Classes

| Class | Description | Primary Needs |
|-------|-------------|---------------|
| **Primary User** | Adult seeking to quit/reduce a habit | Easy daily logging, encouragement, progress visibility |
| **Administrator** | App developer/team (internal) | Crash reports, usage analytics (aggregated, anonymized) |

### 2.4 Operating Environment

| Attribute | Specification |
|-----------|---------------|
| Mobile OS (iOS) | iOS 14.0 or later |
| Mobile OS (Android) | Android 5.0 (API 21) or later |
| Flutter SDK | 3.x |
| Dart SDK | 3.x |
| Architecture | arm64 (iOS), arm64/x86_64 (Android) |
| Storage Requirement | Minimum 50MB free device storage |
| Network | **Not required** (fully offline) |

---

## 3. Stakeholders & User Personas

### Persona 1: "Alex" — The Determined Quitter

- Age: 28, smokes 15 cigarettes/day for 6 years
- Has tried to quit 3 times before
- Motivated by health and financial concerns
- **Needs:** Clear progress metrics (money saved, days clean), daily accountability, relapse tools without shame

### Persona 2: "Sam" — The Private Recoverer

- Age: 34, seeking to reduce masturbation
- Highly privacy-conscious; would delete the app if data left device
- **Needs:** Absolute confidence in local-only storage, discreet app icon, biometric lock

### Persona 3: "Jordan" — The Both-Goals User

- Age: 22, both smoking and masturbation habits
- Tech-savvy, wants detailed analytics
- **Needs:** Separate tracking per habit, combined milestone view, detailed charts

---

## 4. System Context

### 4.1 Current System Components

```
┌─────────────────────────────────────────────┐
│                 QuitMate App                 │
│                                             │
│  ┌─────────────┐    ┌─────────────────────┐ │
│  │  Flutter UI  │◄──►│  Riverpod Providers │ │
│  │  (Widgets)   │    │  (State Management) │ │
│  └─────────────┘    └──────────┬──────────┘ │
│                                │             │
│                    ┌───────────▼───────────┐ │
│                    │    Repositories        │ │
│                    │  (ProfileRepository)   │ │
│                    └───────────┬───────────┘ │
│                                │             │
│         ┌──────────────────────┤             │
│         │                      │             │
│  ┌──────▼──────┐    ┌──────────▼──────────┐ │
│  │   Isar DB   │    │  FlutterSecureStorage│ │
│  │  (Encrypted)│    │  (Flags + User ID)   │ │
│  └─────────────┘    └─────────────────────┘ │
└─────────────────────────────────────────────┘
         On-Device Only — No External Services
```

---

## 5. Functional Requirements — Current

### FR-C-001: App Initialization

**ID:** REQ-CUR-001  
**Priority:** Must Have  
**Status:** ✅ Implemented

- The system shall initialize the Isar database on app launch.
- The system shall lock device orientation to portrait mode.
- The system shall check onboarding completion status from secure storage before rendering the first screen.
- The system shall display a splash screen during initialization.
- The system shall route new users to `WelcomeScreen` and returning users to `DashboardScreen`.

---

### FR-C-002: Welcome Screen

**ID:** REQ-CUR-002  
**Priority:** Must Have  
**Status:** ✅ Implemented

- The system shall display the app name, logo, and tagline on the welcome screen.
- The system shall present three feature highlights (Track, Evidence-Based, Privacy).
- The system shall provide a "Get Started" button navigating to goal selection.

---

### FR-C-003: Goal Selection

**ID:** REQ-CUR-003  
**Priority:** Must Have  
**Status:** ✅ Implemented

- The system shall present three selectable goal types: `quitSmoking`, `reduceMasturbation`, `both`.
- The system shall display each goal with an emoji icon, title, and description.
- The system shall visually indicate the selected goal.
- The system shall disable the "Next" button until a goal is selected.
- The system shall persist the selected goal in onboarding state.

---

### FR-C-004: Baseline Data Collection

**ID:** REQ-CUR-004  
**Priority:** Must Have  
**Status:** ✅ Implemented (partial — see BUG-004)

- The system shall show smoking fields (cigarettes/day, cost/pack, cigarettes/pack) for `quitSmoking` or `both` goals.
- The system shall show masturbation baseline field (episodes/week) for `reduceMasturbation` or `both` goals.
- The system shall pre-fill fields with default values from `AppConstants`.
- The system shall validate all fields before allowing progression:
  - Cigarettes per day: integer 1–100
  - Cost per pack: decimal > 0
  - Cigarettes per pack: integer ≥ 1
  - Episodes per week: integer 1–50
- The system shall display trigger selection chips for common triggers.
- The system shall allow multi-selection of triggers.
- The system shall persist all baseline values in onboarding state.

---

### FR-C-005: Quit Date Selection

**ID:** REQ-CUR-005  
**Priority:** Must Have  
**Status:** ✅ Implemented (with BUG-001)

- The system shall display quick date options: Today, Tomorrow, 3 days, 1 week, 2 weeks, 30 days.
- The system shall allow custom date selection via native date picker.
- The system shall constrain custom date selection to today through today + 365 days.
- The system shall display the selected date in a formatted card.
- The system shall visually indicate the currently selected quick option.
- The system shall disable the "Finish" button until a date is selected.

---

### FR-C-006: Onboarding Completion

**ID:** REQ-CUR-006  
**Priority:** Must Have  
**Status:** ✅ Implemented

- The system shall construct a `UserProfile` from all collected onboarding state.
- The system shall persist the `UserProfile` to the Isar database.
- The system shall persist the user UUID to secure storage.
- The system shall set `hasCompletedOnboarding = true` in secure storage.
- On success, the system shall navigate to `DashboardScreen`, removing all onboarding routes.
- On failure, the system shall display an error `SnackBar` with the error message.
- The system shall show a loading overlay during the save operation.

---

### FR-C-007: Profile Repository

**ID:** REQ-CUR-007  
**Priority:** Must Have  
**Status:** ✅ Implemented

- The system shall provide CRUD operations for `UserProfile` via `ProfileRepository`.
- The system shall use Isar write transactions for all mutation operations.
- The `updateProfile` method shall preserve `createdAt` and `id` from the existing record.
- The `updateProfile` method shall set `updatedAt` to the current timestamp.

---

### FR-C-008: Theme System

**ID:** REQ-CUR-008  
**Priority:** Must Have  
**Status:** ✅ Implemented

- The system shall use Material 3 with a consistent color scheme.
- The system shall apply the defined color palette across all UI components.
- The system shall provide `GradientButton`, `LoadingOverlay`, and `EmptyState` shared widgets.

---

## 6. Functional Requirements — Future

### FR-F-001: Habit Log Entry

**ID:** REQ-FUT-001  
**Priority:** 🟠 P1 — Must Have for v1.0

- **The system shall allow users to create a habit log entry from the dashboard.**
- Each entry shall capture: timestamp, outcome (resisted/relapsed), relapse count, trigger, mood rating (1–5), and optional notes.
- Log entries shall be persisted to a `LogEntry` Isar collection.
- The system shall support separate logging for smoking and masturbation when `goalType = both`.
- The system shall display a confirmation upon successful log save.
- The system shall update dashboard statistics immediately after a log is saved.

---

### FR-F-002: Streak Calculation

**ID:** REQ-FUT-002  
**Priority:** 🟠 P1 — Must Have for v1.0

- **The system shall compute and display the user's current clean streak in days.**
- A streak day is defined as a calendar day with no relapse logged.
- Days with no log entry shall be treated as clean (benefit of the doubt).
- The streak shall reset to 0 the calendar day following a logged relapse.
- The system shall track and display the longest streak achieved.
- Streak calculation shall be performed from log history on each dashboard load.

---

### FR-F-003: Dashboard Statistics

**ID:** REQ-FUT-003  
**Priority:** 🟠 P1 — Must Have for v1.0

- **The system shall display the following statistics on the dashboard:**
  - Days since quit date
  - Current streak
  - Longest streak
  - Total cigarettes avoided (vs. baseline)
  - Total money saved (calculated from baseline cost data)
  - Number of cravings resisted
- All statistics shall be computed from `LogEntry` history and `UserProfile` baseline.
- Statistics shall refresh on each dashboard mount and after any log entry.

---

### FR-F-004: Local Notifications

**ID:** REQ-FUT-004  
**Priority:** 🟠 P1 — Must Have for v1.0

- The system shall request notification permission after onboarding completion.
- The system shall support daily check-in reminder notifications at a user-configured time.
- The system shall trigger milestone achievement notifications.
- The system shall support streak encouragement notifications.
- The system shall re-schedule notifications on device restart.
- All notification types shall be individually configurable in Settings.

---

### FR-F-005: Craving Management

**ID:** REQ-FUT-005  
**Priority:** 🟡 P2 — Required for v1.1

- The system shall provide an "I'm Having a Craving" quick-access button on the dashboard.
- The system shall guide the user through a configurable urge-surfing timer (5–15 minutes).
- The system shall prompt the user to rate craving intensity and select a trigger before starting.
- The system shall log the craving outcome (resisted/relapsed) after the session.
- The system shall provide an emergency toolkit with breathing, grounding, and distraction tools.

---

### FR-F-006: Milestone Achievement System

**ID:** REQ-FUT-006  
**Priority:** 🟡 P2 — Required for v1.1

- The system shall define milestones at the following streak thresholds: 1, 3, 7, 14, 30, 100, 180, 365 days.
- The system shall evaluate milestone eligibility on each log save and app launch.
- The system shall trigger an in-app celebration modal on first milestone achievement.
- The system shall send a local notification for each new milestone.
- The system shall display all milestones (locked/unlocked) in an Achievements screen.
- Achieved milestones shall be persisted to a `MilestoneAchievement` Isar collection.

---

### FR-F-007: Settings Screen

**ID:** REQ-FUT-007  
**Priority:** 🟡 P2 — Required for v1.1

- The system shall provide a Settings screen accessible from the dashboard AppBar.
- The system shall allow editing of nickname, goal type, baseline data, and quit date.
- The system shall allow configuration of all notification types and timing.
- The system shall allow toggling of biometric lock.
- The system shall provide data export functionality.
- The system shall provide a "Reset Progress" action (with confirmation).
- The system shall provide a "Delete All Data" action (with double confirmation).

---

### FR-F-008: Biometric Lock

**ID:** REQ-FUT-008  
**Priority:** 🟢 P3 — Required for v1.2

- The system shall optionally require biometric or PIN authentication when resuming after 60+ seconds in the background.
- Biometric lock shall be opt-in, configurable in Settings.
- The system shall fall back to device PIN/passcode if biometric authentication is unavailable.

---

### FR-F-009: Behavioral Tools

**ID:** REQ-FUT-009  
**Priority:** 🟢 P3 — Required for v1.2

- The system shall provide a guided 4-7-8 breathing exercise with animation.
- The system shall provide a 5-4-3-2-1 grounding exercise with step-by-step guidance.
- The system shall provide a thought record tool (CBT structured journal).
- The system shall display daily affirmations on the dashboard.
- The system shall provide short educational articles on addiction science.

---

### FR-F-010: History & Analytics

**ID:** REQ-FUT-010  
**Priority:** 🔵 P4 — Required for v2.0

- The system shall display a paginated history of all log entries.
- The system shall provide charts showing daily/weekly/monthly habit data.
- The system shall identify the most common relapse triggers from log history.
- The system shall generate a weekly summary report.

---

## 7. Non-Functional Requirements

### 7.1 Performance

| Requirement | Target |
|-------------|--------|
| App launch to interactive | < 2 seconds on mid-range device |
| Dashboard statistics load | < 500ms |
| Log entry save | < 200ms |
| Smooth scrolling | 60fps sustained |
| App binary size | < 30MB download |

### 7.2 Reliability

| Requirement | Target |
|-------------|--------|
| Crash-free sessions | ≥ 99.5% |
| Data integrity | Zero data loss on app crash during write operations (Isar transactions) |
| Notification delivery | ≥ 95% of scheduled notifications delivered |

### 7.3 Security

| Requirement | Specification |
|-------------|---------------|
| Database encryption | AES-256 via Isar encryption key |
| Key storage | Platform keystore (iOS Keychain / Android Keystore) via `flutter_secure_storage` |
| Encryption key generation | Cryptographically secure random (`Random.secure()`) |
| Data locality | No data transmitted off-device |
| Biometric auth | Platform biometric API via `local_auth` |

### 7.4 Usability

- The app shall be fully operable with one hand on a standard smartphone.
- All touch targets shall meet minimum 48×48dp size.
- The app shall support system font size scaling (accessibility).
- All icon buttons shall have `Semantics` labels for screen reader support.
- The app shall pass WCAG 2.1 AA contrast ratios for all text.

### 7.5 Maintainability

- Code coverage shall be ≥ 80% for business logic (providers, repositories, use cases).
- All public APIs shall have Dart doc comments.
- No hard-coded strings in widget build methods (use `AppStrings` constants).
- Feature code shall be isolated in feature-specific directories.

### 7.6 Compatibility

- iOS: 14.0+
- Android: API 21+
- Screen sizes: 4.7" to 6.9" (375dp to 430dp width)
- Orientation: Portrait only (enforced)

---

## 8. Data Requirements

### 8.1 Data Entities (Current + Planned)

| Entity | Status | Description |
|--------|--------|-------------|
| `UserProfile` | ✅ Current | User goals, baseline, quit date |
| `LogEntry` | 🔴 Required | Daily habit log (success/relapse) |
| `CravingEntry` | 🔴 Required | Craving event log |
| `MilestoneAchievement` | 🟡 P2 | Achieved milestone records |
| `ThoughtRecord` | 🟢 P3 | CBT thought records |

### 8.2 Data Retention

- All data is retained indefinitely unless the user explicitly triggers "Reset Progress" or "Delete All Data".
- "Reset Progress" deletes `LogEntry` and `CravingEntry` records; preserves `UserProfile`.
- "Delete All Data" deletes all Isar collections and secure storage; returns app to new-user state.

### 8.3 Data Privacy

- No data is transmitted to any external server.
- No analytics SDK that exfiltrates data (e.g., Firebase Analytics) shall be included.
- *If* crash reporting (e.g., Sentry) is added, it must be fully anonymized with no PII in events.

---

## 9. Interface Requirements

### 9.1 User Interface

- Follow Material 3 design guidelines.
- Use the defined `AppTheme` color tokens exclusively.
- Bottom navigation bar with 4–5 tabs for the main app shell (post-onboarding).
- Onboarding screens use push navigation within a dedicated flow.

### 9.2 Hardware Interfaces

- **Biometric sensor:** Used for app lock (optional).
- **Haptic feedback:** Used in breathing exercises for phase transitions.
- **Push notifications:** Local only, via OS notification system.

### 9.3 Software Interfaces

| Interface | Package | Purpose |
|-----------|---------|---------|
| Local DB | `isar` | Persistent data storage |
| Secure KV | `flutter_secure_storage` | Encryption keys and flags |
| Notifications | `flutter_local_notifications` | Scheduling and display |
| Biometrics | `local_auth` | App lock |
| Charts | `fl_chart` or equivalent | Progress visualization |

---

## 10. Security Requirements

### SEC-001: Database Encryption at Rest

**Status:** 🔴 Not currently active (BUG-002)  
**Requirement:** All Isar database files shall be encrypted using AES-256 with a key generated by `Random.secure()` and stored in the platform keystore.

### SEC-002: Secure Key Generation

**Status:** 🔴 Deficient (BUG-003)  
**Requirement:** The encryption key shall be generated using `dart:math`'s `Random.secure()`, producing 32 bytes of cryptographically secure random data.

### SEC-003: No Sensitive Data in Logs

**Requirement:** Release builds shall not log any user-identifiable data, habit information, or personal metrics to the console or crash reporters.

### SEC-004: App Lock

**Status:** 🟢 Planned (P3)  
**Requirement:** Users shall optionally enable biometric authentication required on app resume after 60 seconds of background inactivity.

### SEC-005: Privacy Policy

**Requirement:** The app shall include a link to a privacy policy (viewable in Settings and on store listings) that accurately describes the local-only data storage model.

---

## 11. Constraints & Assumptions

### Constraints

| Constraint | Description |
|------------|-------------|
| **Offline Only** | No cloud backend will be implemented in v1.x. All features must work offline. |
| **Single User** | The app supports one user profile per device installation. |
| **Portrait Only** | Landscape orientation is explicitly disabled. |
| **Flutter** | The app shall remain a Flutter application (not migrated to native). |
| **Isar** | Isar is the committed database technology; no migration to SQLite or Hive. |

### Assumptions

| Assumption | Rationale |
|------------|-----------|
| Users are adults (18+) | Content involves adult behavioral health topics. |
| Users have basic smartphone literacy | No tutorial overlays are required. |
| Users consent to local data storage | Disclosed in onboarding and privacy policy. |
| No multi-device sync required | Privacy-first design explicitly excludes cloud sync. |

---

## 12. Glossary

| Term | Definition |
|------|-----------|
| **Streak** | Consecutive calendar days without a logged relapse |
| **Relapse** | A log entry where the user reports engaging in the habit they are trying to quit |
| **Baseline** | The user's pre-quit habit frequency, used to compute savings and avoidance stats |
| **Trigger** | A situation or emotion that leads to a craving or habit engagement |
| **Urge Surfing** | A mindfulness technique where the user observes a craving without acting on it until it subsides |
| **Quit Date** | The date the user has committed to begin their habit-free journey |
| **GoalType** | The category of habit being addressed: smoking, masturbation, or both |
| **Isar** | An embedded, high-performance NoSQL database for Flutter/Dart |
| **Riverpod** | A reactive state management library for Flutter |
| **CBT** | Cognitive Behavioral Therapy — an evidence-based psychological treatment for addictive behaviors |

---

## 13. Appendix A: Architecture Diagram

### Target Architecture (v1.1+)

```
Presentation Layer (Flutter Widgets)
    │  Consumer widgets watch providers reactively
    ▼
State Management Layer (Riverpod Providers)
    │  AsyncNotifier / Notifier classes
    │  Business logic: streak calc, stats aggregation, milestone evaluation
    ▼
Domain Layer (Use Cases + Entities)
    │  Pure Dart classes: GoalType, TriggerType, LogEntry, UserProfile
    │  Interfaces: ILogRepository, IProfileRepository, ICravingRepository
    ▼
Data Layer (Repositories)
    │  Concrete implementations of repository interfaces
    │  Isar query building, transaction management
    ▼
Infrastructure Layer (Services)
    ├── IsarService (DB singleton, schema registration)
    ├── SecureStorageService (flags, encryption keys)
    └── NotificationService (schedule, cancel, update)
    ▼
Platform
    ├── Isar DB (encrypted, local)
    ├── FlutterSecureStorage (Keychain/Keystore)
    └── OS Notification System
```

---

## 14. Appendix B: Data Flow Diagram

### Log Entry Creation Flow

```
User taps "Log Now"
    │
    ▼
LogEntrySheet displayed
    │
    ▼
User fills: outcome, count, trigger, mood, notes
    │
    ▼
User taps "Save"
    │
    ▼
LogEntryNotifier.saveLog(entry)
    │
    ├──► LogRepository.saveLog(entry)    ──► Isar writeTxn ──► LogEntry persisted
    │
    ├──► StatsNotifier.refresh()         ──► Recompute all dashboard stats
    │
    ├──► MilestoneChecker.evaluate()     ──► Check all milestone thresholds
    │         │
    │         └── [New milestone] ──► MilestoneRepository.save()
    │                              ──► NotificationService.showMilestone()
    │                              ──► MilestoneModal shown in UI
    │
    └──► DashboardScreen rebuilds with updated stats
```

---

## 15. Appendix C: Known Issues Register

| Bug ID | Screen | Description | Severity | Fix Reference |
|--------|--------|-------------|----------|---------------|
| BUG-001 | QuitDateScreen | `Spacer` inside `ListView` causes runtime RenderFlex exception | **Critical** | FIX-001 |
| BUG-002 | IsarService | Database encryption commented out despite privacy claims | **Critical** | FIX-002 |
| BUG-003 | IsarService | Encryption key uses non-secure `DateTime % 256` algorithm | **Critical** | FIX-002 |
| BUG-004 | UserProfile | Computed getters persisted as Isar fields, causing stale values | **High** | FIX-003 |
| BUG-005 | Onboarding | Nickname field defined but never collected in any screen | **Medium** | FIX-004 |
| BUG-006 | BaselineScreen | Only 6 of 10 TriggerType values shown; 4 silently omitted | **Low** | REQ-FUT — Onboarding Enhancement |
| BUG-007 | OnboardingState | `currentStep` maintained but not used for navigation | **Low** | Refactor |
| BUG-008 | QuitMateApp | SecureStorageService instantiated directly, bypassing DI | **Low** | Refactor |

---

*End of Software Requirements Specification*  
*QuitMate v1.0.0 — Confidential — Engineering Use Only*
