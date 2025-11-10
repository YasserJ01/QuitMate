import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/core/theme/app_theme.dart';
import 'package:quitmate/features/onboarding/presentation/screens/welcome_screen.dart';
import 'package:quitmate/features/onboarding/presentation/screens/goal_selection_screen.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const ProviderScope(
      child: MaterialApp(
        home: WelcomeScreen(),
      ),
    );
  }

  group('WelcomeScreen Widget Tests', () {
    testWidgets('should display welcome title and subtitle', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.welcomeTitle), findsOneWidget);
      expect(find.text(AppStrings.welcomeSubtitle), findsOneWidget);
    });

    testWidgets('should display app icon', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    });

    testWidgets('should display all feature descriptions', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Track Your Progress'), findsOneWidget);
      expect(find.text('Evidence-Based Methods'), findsOneWidget);
      expect(find.text('Privacy First'), findsOneWidget);
    });

    testWidgets('should display feature icons', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.track_changes), findsOneWidget);
      expect(find.byIcon(Icons.psychology), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
    });

    testWidgets('should display Get Started button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.getStarted), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should navigate to GoalSelectionScreen when Get Started is tapped', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Find and tap the Get Started button
      final button = find.text(AppStrings.getStarted);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pumpAndSettle();

      // Should navigate to GoalSelectionScreen
      expect(find.byType(GoalSelectionScreen), findsOneWidget);
      expect(find.byType(WelcomeScreen), findsNothing);
    });

    testWidgets('should use primary gradient background', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(WelcomeScreen),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());
    });

    testWidgets('should have white text on gradient background', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final titleText = tester.widget<Text>(
        find.text(AppStrings.welcomeTitle),
      );

      expect(titleText.style?.color, Colors.white);
    });

    testWidgets('should be scrollable for small screens', (tester) async {
      // Set small screen size
      tester.binding.window.physicalSizeTestValue = const Size(400, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);

      // Clean up
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}