import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'app.dart';
import 'core/services/database/isar_service.dart';
import 'features/interventions/services/push_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── 1. Lock to portrait ────────────────────────────────────────────────────
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ── 2. Timezone (required by flutter_local_notifications zonedSchedule) ───
  await _initTimezone();

  // ── 3. Isar database ───────────────────────────────────────────────────────
  await IsarService.instance;

  // ── 4. Local notification plugin (channel creation + listener wiring) ─────
  await PushNotificationService().initialize();

  // ── 5. Run ─────────────────────────────────────────────────────────────────
  runApp(
    const ProviderScope(
      child: QuitMateApp(),
    ),
  );
}

/// Resolves the device's IANA timezone name and sets it as the default
/// location for the `timezone` package.  flutter_local_notifications relies
/// on this for `zonedSchedule` to fire at the correct local time.
Future<void> _initTimezone() async {
  tz.initializeTimeZones();
  try {
    final name = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(name as String));
  } catch (_) {
    // Fallback: UTC is safe — notifications will still fire, just offset.
    tz.setLocalLocation(tz.UTC);
  }
}