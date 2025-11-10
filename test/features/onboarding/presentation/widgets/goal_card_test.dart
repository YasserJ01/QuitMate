import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/core/theme/app_theme.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';
import 'package:quitmate/features/onboarding/presentation/widgets/goal_card.dart';

void main() {
  Widget createWidgetUnderTest({
    required GoalType goalType,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: GoalCard(
          goalType: goalType,
          isSelected: isSelected,
          onTap: onTap ?? () {},
        ),
      ),
    );
  }

  group('GoalCard Widget Tests', () {
    testWidgets('should display goal name and description', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );

      expect(find.text(GoalType.quitSmoking.displayName), findsOneWidget);
      expect(
        find.text('Break free from nicotine addiction and improve your health'),
        findsOneWidget,
      );
    });

    testWidgets('should display goal emoji', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );

      expect(find.text(GoalType.quitSmoking.emoji), findsOneWidget);
    });

    testWidgets('should show check icon when selected', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          goalType: GoalType.quitSmoking,
          isSelected: true,
        ),
      );

      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('should not show check icon when not selected', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          goalType: GoalType.quitSmoking,
          isSelected: false,
        ),
      );

      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('should call onTap when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        createWidgetUnderTest(
          goalType: GoalType.quitSmoking,
          onTap: () => tapped = true,
        ),
      );

      await tester.tap(find.byType(GoalCard));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('should have different border when selected', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          goalType: GoalType.quitSmoking,
          isSelected: true,
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      final shape = card.shape as RoundedRectangleBorder;

      expect(shape.side.color, AppTheme.primaryColor);
      expect(shape.side.width, 2);
    });

    testWidgets('should display correct description for each goal type', (tester) async {
      // Quit Smoking
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );
      expect(
        find.text('Break free from nicotine addiction and improve your health'),
        findsOneWidget,
      );

      // Reduce Masturbation
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.reduceMasturbation),
      );
      expect(
        find.text('Build healthier habits and improve self-control'),
        findsOneWidget,
      );

      // Both
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.both),
      );
      expect(
        find.text('Take on both challenges for complete transformation'),
        findsOneWidget,
      );
    });

    testWidgets('should use Card widget', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should have rounded corners', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(goalType: GoalType.quitSmoking),
      );

      final card = tester.widget<Card>(find.byType(Card));
      final shape = card.shape as RoundedRectangleBorder;

      expect(shape.borderRadius, BorderRadius.circular(16));
    });
  });
}