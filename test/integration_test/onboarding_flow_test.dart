import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quitmate/main.dart' as app;
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';
import 'package:quitmate/features/tracking/presentation/screens/dashboard_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Flow Integration Tests', () {
    testWidgets('complete onboarding flow - quit smoking goal', (tester) async {
      // Start app
      app.main();
      await tester.pumpAndSettle();

      // Welcome Screen
      expect(find.text(AppStrings.welcomeTitle), findsOneWidget);
      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      // Goal Selection Screen
      expect(find.text(AppStrings.selectGoalTitle), findsOneWidget);
      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Baseline Screen
      expect(find.text(AppStrings.baselineTitle), findsOneWidget);

      // Fill in smoking data
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '15',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cost per pack'),
        '12.50',
      );
      await tester.pumpAndSettle();

      // Select triggers
      await tester.tap(find.text('Stress'));
      await tester.tap(find.text('Boredom'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Quit Date Screen
      expect(find.text(AppStrings.quitDateTitle), findsOneWidget);
      await tester.tap(find.text('In 7 days'));
      await tester.pumpAndSettle();

      // Complete onboarding
      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should navigate to dashboard
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('complete onboarding flow - reduce masturbation goal', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Welcome Screen
      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      // Goal Selection
      await tester.tap(find.text(GoalType.reduceMasturbation.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Baseline Screen
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Episodes per week'),
        '7',
      );
      await tester.pumpAndSettle();

      // Select triggers
      await tester.tap(find.text('Loneliness'));
      await tester.tap(find.text('Anxiety'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Quit Date Screen
      await tester.tap(find.text('Tomorrow'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('complete onboarding flow - both goals', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      // Select both goals
      await tester.tap(find.text(GoalType.both.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Fill both sets of data
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '20',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cost per pack'),
        '15.00',
      );

      // Scroll down to find episodes field
      await tester.dragUntilVisible(
        find.widgetWithText(TextFormField, 'Episodes per week'),
        find.byType(ListView),
        const Offset(0, -200),
      );

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Episodes per week'),
        '5',
      );
      await tester.pumpAndSettle();

      // Select multiple triggers
      await tester.tap(find.text('Stress'));
      await tester.tap(find.text('Boredom'));
      await tester.tap(find.text('Loneliness'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Select custom date
      await tester.tap(find.text('In 14 days'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('can navigate back through onboarding flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Go back from baseline screen
      expect(find.text(AppStrings.baselineTitle), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Should be back on goal selection
      expect(find.text(AppStrings.selectGoalTitle), findsOneWidget);
    });

    testWidgets('validation prevents progression with incomplete data', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      // Try to proceed without selecting goal
      expect(find.text(AppStrings.next), findsOneWidget);
      final nextButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, AppStrings.next),
      );
      expect(nextButton.onPressed, isNull); // Button should be disabled

      // Select goal and proceed
      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Try to proceed with invalid data
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '999', // Invalid number
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Should show validation error and stay on same screen
      expect(find.textContaining('Enter a valid number'), findsOneWidget);
      expect(find.text(AppStrings.baselineTitle), findsOneWidget);
    });

    testWidgets('can switch between goal types', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      // Select first goal
      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();

      // Change to different goal
      await tester.tap(find.text(GoalType.reduceMasturbation.displayName));
      await tester.pumpAndSettle();

      // Proceed with second goal
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Should show appropriate fields for second goal
      expect(find.text('🎯 Current Habits'), findsOneWidget);
      expect(find.text('🚬 Smoking Habits'), findsNothing);
    });

    testWidgets('multiple triggers can be selected and deselected', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Select multiple triggers
      await tester.tap(find.text('Stress'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Boredom'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Social Situations'));
      await tester.pumpAndSettle();

      // Deselect one
      await tester.tap(find.text('Boredom'));
      await tester.pumpAndSettle();

      // Continue flow
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '10',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Complete onboarding
      await tester.tap(find.text('Today'));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('quick date options work correctly', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '10',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Test different quick date options
      await tester.tap(find.text('Today'));
      await tester.pumpAndSettle();
      expect(find.text('Your Quit Date'), findsOneWidget);

      await tester.tap(find.text('In 7 days'));
      await tester.pumpAndSettle();
      expect(find.text('Your Quit Date'), findsOneWidget);

      await tester.tap(find.text('In 30 days'));
      await tester.pumpAndSettle();
      expect(find.text('Your Quit Date'), findsOneWidget);
    });

    testWidgets('cannot complete onboarding without selecting quit date', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.getStarted));
      await tester.pumpAndSettle();

      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '10',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Try to finish without selecting date
      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle();

      // Should show error message
      expect(find.text('Please select a quit date'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}