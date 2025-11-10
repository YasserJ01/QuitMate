import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';
import 'package:quitmate/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:quitmate/features/onboarding/presentation/screens/baseline_screen.dart';
import 'package:quitmate/features/onboarding/presentation/screens/quit_date_screen.dart';

void main() {
  Widget createWidgetUnderTest({GoalType? goalType}) {
    return ProviderScope(
      overrides: goalType != null
          ? [
        onboardingProvider.overrideWith((ref) {
          final notifier = OnboardingNotifier(
            ref.watch(profileRepositoryProvider),
            ref.watch(secureStorageProvider),
          );
          notifier.setGoalType(goalType);
          return notifier;
        }),
      ]
          : [],
      child: const MaterialApp(
        home: BaselineScreen(),
      ),
    );
  }

  group('BaselineScreen Widget Tests', () {
    testWidgets('should display title and subtitle', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.baselineTitle), findsOneWidget);
      expect(find.text(AppStrings.baselineSubtitle), findsOneWidget);
    });

    testWidgets('should display back button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('should display smoking fields when goal is quit smoking', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      await tester.pumpAndSettle();

      expect(find.text('🚬 Smoking Habits'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Cigarettes per day'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Cost per pack'), findsOneWidget);
    });

    testWidgets('should not display smoking fields when goal is reduce masturbation', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.reduceMasturbation),
      );
      await tester.pumpAndSettle();

      expect(find.text('🚬 Smoking Habits'), findsNothing);
      expect(find.widgetWithText(TextFormField, 'Cigarettes per day'), findsNothing);
    });

    testWidgets('should display masturbation fields when goal is reduce masturbation', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.reduceMasturbation),
      );
      await tester.pumpAndSettle();

      expect(find.text('🎯 Current Habits'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Episodes per week'), findsOneWidget);
    });

    testWidgets('should display both sets of fields when goal is both', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.both),
      );
      await tester.pumpAndSettle();

      expect(find.text('🚬 Smoking Habits'), findsOneWidget);
      expect(find.text('🎯 Current Habits'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Cigarettes per day'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Episodes per week'), findsOneWidget);
    });

    testWidgets('should display triggers section', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('⚡ Common Triggers'), findsOneWidget);
      expect(find.text('Select situations that trigger your habits'), findsOneWidget);
    });

    testWidgets('should display trigger chips', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(FilterChip), findsWidgets);
      expect(find.text('Stress'), findsOneWidget);
      expect(find.text('Boredom'), findsOneWidget);
      expect(find.text('Social Situations'), findsOneWidget);
    });

    testWidgets('should validate cigarettes per day field', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      await tester.pumpAndSettle();

      // Clear the field
      final field = find.widgetWithText(TextFormField, 'Cigarettes per day');
      await tester.enterText(field, '');
      await tester.pumpAndSettle();

      // Try to submit
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      expect(find.text('Please enter a number'), findsOneWidget);
    });

    testWidgets('should validate cigarettes per day range', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      await tester.pumpAndSettle();

      // Enter invalid number
      final field = find.widgetWithText(TextFormField, 'Cigarettes per day');
      await tester.enterText(field, '999');
      await tester.pumpAndSettle();

      // Try to submit
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      expect(find.textContaining('Enter a valid number'), findsOneWidget);
    });

    testWidgets('should pre-fill default values', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      await tester.pumpAndSettle();

      final cigarettesField = tester.widget<TextFormField>(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
      );
      expect(
        cigarettesField.controller?.text,
        AppConstants.defaultCigarettesPerDay.toString(),
      );
    });

    testWidgets('should toggle trigger selection', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: BaselineScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Initially no triggers selected
      var state = container.read(onboardingProvider);
      expect(state.triggers, isEmpty);

      // Tap stress trigger
      await tester.tap(find.text('Stress'));
      await tester.pumpAndSettle();

      state = container.read(onboardingProvider);
      expect(state.triggers, contains(TriggerType.stress));

      // Tap again to deselect
      await tester.tap(find.text('Stress'));
      await tester.pumpAndSettle();

      state = container.read(onboardingProvider);
      expect(state.triggers, isEmpty);
    });

    testWidgets('should navigate to QuitDateScreen on valid submission', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: BaselineScreen(),
          ),
        ),
      );

      // Set goal type first
      container.read(onboardingProvider.notifier).setGoalType(GoalType.quitSmoking);
      await tester.pumpAndSettle();

      // Fill in valid data
      final field = find.widgetWithText(TextFormField, 'Cigarettes per day');
      await tester.enterText(field, '15');
      await tester.pumpAndSettle();

      // Submit
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Should navigate
      expect(find.byType(QuitDateScreen), findsOneWidget);
      expect(find.byType(BaselineScreen), findsNothing);
    });

    testWidgets('should save data to provider on submission', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: BaselineScreen(),
          ),
        ),
      );

      container.read(onboardingProvider.notifier).setGoalType(GoalType.quitSmoking);
      await tester.pumpAndSettle();

      // Enter values
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cigarettes per day'),
        '15',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cost per pack'),
        '12.5',
      );
      await tester.pumpAndSettle();

      // Submit
      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      // Verify data saved
      final state = container.read(onboardingProvider);
      expect(state.cigarettesPerDay, 15);
      expect(state.costPerPack, 12.5);
    });

    testWidgets('should only accept numeric input for cigarettes field', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      await tester.pumpAndSettle();

      final field = find.widgetWithText(TextFormField, 'Cigarettes per day');

      // Try to enter letters
      await tester.enterText(field, 'abc');
      await tester.pumpAndSettle();

      final textField = tester.widget<TextFormField>(field);
      expect(textField.controller?.text, '');
    });

    testWidgets('should validate cost per pack format', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      await tester.pumpAndSettle();

      // Enter invalid cost
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cost per pack'),
        '0',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.next));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid amount'), findsOneWidget);
    });
  });
}