# QuitMate Interventions & Relapse Prevention Implementation Notes

This document captures the work completed for the interventions and relapse-prevention plan, plus guidance for the next phases.
It is intended for developers continuing implementation and QA.

## What Was Implemented

### Interventions (Notifications)
- Quiet-hours edge case handling now treats equal start/end as disabled.
- Scheduler uses typed `Statistics` instead of `dynamic` and removes unsafe casts.
- Rescheduling no longer cancels today's pending notifications; only future days are cleared.
- Notification preferences save is debounced to avoid excessive rescheduling.
- Permission check in `PushNotificationService` now avoids the Android-only assumption and clarifies iOS behavior.

### Relapse Prevention
- Provider architecture migrated to `AsyncNotifier` to avoid `userId` race conditions.
- `RelapsePlanScreen` now consumes the `AsyncValue` from the notifier rather than tracking loading flags in state.
- `EditPanicStepsScreen` pulls a fresh plan directly from the repository to avoid cache race.
- `PanicButton` now pauses the animation when the app is backgrounded to reduce battery drain.

## Files Updated

### Interventions
- `lib/features/interventions/data/models/notification_models.dart`
- `lib/features/interventions/services/notification_scheduler_service.dart`
- `lib/features/interventions/presentation/providers/notification_provider.dart`
- `lib/features/interventions/services/push_notification_service.dart`

### Relapse Prevention
- `lib/features/relapse_prevention/presentation/providers/relapse_provider.dart`
- `lib/features/relapse_prevention/presentation/screens/relapse_plan_screen.dart`
- `lib/features/relapse_prevention/presentation/screens/edit_panic_steps_screen.dart`
- `lib/features/relapse_prevention/presentation/widgets/panic_button.dart`

## Notes For Future Implementation

### Notification System
- Add `permission_handler` if accurate iOS permission status is required. Current code still assumes iOS is granted if initialized.
- Implement `requestPermissionsIfAppropriate()` in `NotificationManager` and call it from the first log event (per plan).
- Add `permissionDeniedAt` and `userMode` fields to `NotificationPreferences` and regenerate Isar schemas.
- Expand `NotificationContent` with mode-specific pools and run the content audit tests.
- Replace `NotificationSettingsScreen` hour dropdown with `showTimePicker` to avoid overflow on small screens.

### Relapse Prevention
- Replace the custom steps dialog with a dedicated `EditCustomStepsScreen` using `ReorderableListView`.
- Add `HelpSafetyScreen` accessible without auth and wire to settings + lock screen.
- Implement `LapseRecoveryScreen` and `RecoveryGuideScreen` with mode-specific copy.
- Add `LapseRecoverySessionModel` and repository methods to persist recovery sessions.

### Craving Toolkit
- Build the toolkit catalogue seed service and register new Isar models (`ToolkitExercise`, `ToolkitSession`, `JournalEntry`).
- Implement favorites/recents/usage tracking and the post-exercise feedback flow.
- Replace static CBT, grounding, and breathing screens with the multi-step flows defined in the plan.

## QA / Verification Checklist
- Exercise notification scheduling across multiple days; confirm today's notifications are not cancelled.
- Toggle notification preferences rapidly; ensure only one reschedule occurs after debounce.
- Open `RelapsePlanScreen` during cold app start; verify no blank state due to empty userId.
- Open and close the app while `PanicButton` is visible; verify animation stops in background.

## Suggested Next Steps
1. Add the remaining NotificationPreferences fields + regenerate Isar schema.
2. Implement `requestPermissionsIfAppropriate()` and the permission timing flow.
3. Build the Help/Safety screen and Lapse Recovery flow.
4. Start the toolkit data layer and seeding.
