import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/app.dart';
import 'package:quitmate/core/services/database/isar_service.dart';
import 'package:quitmate/features/interventions/services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Isar database
  await IsarService.instance;

  // Initialize push notifications
  final notificationService = PushNotificationService();
  await notificationService.initialize();

  runApp(
    const ProviderScope(
      child: QuitMateApp(),
    ),
  );
}