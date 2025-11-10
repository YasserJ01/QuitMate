import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';
import 'package:quitmate/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:quitmate/features/onboarding/presentation/screens/goal_selection_screen.dart';
import 'package:quitmate/features/onboarding/presentation/screens/baseline_screen.dart';
import 'package:quitmate/features/onboarding/presentation/widgets/goal_card.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const ProviderScope(
      child: MaterialApp(
        home: GoalSelectionScreen(),
      ),
    );
  }

  group('GoalSelectionScreen Widget Tests', () {
    testWidgets('should display title and subtitle', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.selectGoalTitle), findsOneWidget);
      expect(find.text(AppStrings.selectGoalSubtitle), findsOneWidget);
    });

    testWidgets('should display back button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('should display all three goal cards', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(GoalCard), findsNWidgets(3));
      expect(find.text(GoalType.quitSmoking.displayName), findsOneWidget);
      expect(find.text(GoalType.reduceMasturbation.displayName), findsOneWidget);
      expect(find.text(GoalType.both.displayName), findsOneWidget);
    });

    testWidgets('should display next button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.next), findsOneWidget);
    });

    testWidgets('next button should be disabled initially', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, AppStrings.next),
      );

      expect(button.onPressed, isNull);
    });

    testWidgets('should select goal when card is tapped', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: GoalSelectionScreen(),
          ),
        ),
      );

      // Tap the quit smoking card
      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();

      // Verify state updated
      final state = container.read(onboardingProvider);
      expect(state.goalType, GoalType.quitSmoking);
    });

    testWidgets('next button should be enabled after goal selection', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: GoalSelectionScreen(),
          ),
        ),
      );

      // Select a goal
      await tester.tap(find.text(GoalType.quitSmoking.displayName));
      await tester.pumpAndSettle();

      // Check button is enabled
      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, AppStrings.next),
      );
      expect(button.onPressed, isNotNull);
    });

    testWidgets('should navigate to BaselineScreen when next is tapped', (tester) async {
        final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: GoalSelectionScreen(),
        ),
      ),
    );

    // Select a goal
    await tester.tap(find.text(GoalType.quitSmoking.displayName));
    await tester.pumpAndSettle();

    // Tap next button
    await tester.tap(find.text(AppStrings.next));
    await tester.pumpAndSettle();

    // Should navigate to BaselineScreen
    expect(find.byType(BaselineScreen), findsOneWidget);
    expect(find.byType(GoalSelectionScreen), findsNothing);
  });

  testWidgets('should highlight selected goal card', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: GoalSelectionScreen(),
        ),
      ),
    );

    // Initially no goal is selected
    final goalCards = tester.widgetList<GoalCard>(find.byType(GoalCard));
    expect(goalCards.every((card) => !card.isSelected), isTrue);

    // Select quit smoking
    await tester.tap(find.text(GoalType.quitSmoking.displayName));
    await tester.pumpAndSettle();

    // Find the selected card
    final selectedCard = tester.widget<GoalCard>(
      find.byWidgetPredicate(
            (widget) => widget is GoalCard && widget.goalType == GoalType.quitSmoking,
      ),
    );
    expect(selectedCard.isSelected, isTrue);
  });

  testWidgets('should switch selection when different goal is tapped', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: GoalSelectionScreen(),
        ),
      ),
    );

    // Select quit smoking
    await tester.tap(find.text(GoalType.quitSmoking.displayName));
    await tester.pumpAndSettle();

    var state = container.read(onboardingProvider);
    expect(state.goalType, GoalType.quitSmoking);

    // Select reduce masturbation
    await tester.tap(find.text(GoalType.reduceMasturbation.displayName));
    await tester.pumpAndSettle();

    state = container.read(onboardingProvider);
    expect(state.goalType, GoalType.reduceMasturbation);
  });

  testWidgets('should navigate back when back button is pressed', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GoalSelectionScreen(),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(GoalSelectionScreen), findsNothing);
  });
});
}