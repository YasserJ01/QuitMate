import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';
import 'package:quitmate/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:quitmate/features/onboarding/presentation/screens/quit_date_screen.dart';
import 'package:quitmate/features/tracking/presentation/screens/dashboard_screen.dart';
import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockProfileRepository mockProfileRepository;
  late MockSecureStorageService mockSecureStorage;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    mockSecureStorage = MockSecureStorageService();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        profileRepositoryProvider.overrideWithValue(mockProfileRepository),
        secureStorageProvider.overrideWithValue(mockSecureStorage),
      ],
      child: const MaterialApp(
        home: QuitDateScreen(),
      ),
    );
  }

  group('QuitDateScreen Widget Tests', () {
    testWidgets('should display title and subtitle', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.quitDateTitle), findsOneWidget);
      expect(find.text(AppStrings.quitDateSubtitle), findsOneWidget);
    });

    testWidgets('should display back button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('should display quick date options', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Quick Options'), findsOneWidget);
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Tomorrow'), findsOneWidget);
      expect(find.text('In 3 days'), findsOneWidget);
      expect(find.text('In 7 days'), findsOneWidget);
      expect(find.text('In 14 days'), findsOneWidget);
      expect(find.text('In 30 days'), findsOneWidget);
    });

    testWidgets('should display custom date button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Choose Custom Date'), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
    });

    testWidgets('should display finish button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(AppStrings.finish), findsOneWidget);
    });

    testWidgets('should display info card', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      expect(
        find.textContaining('Research shows that setting a specific quit date'),
        findsOneWidget,
      );
    });

    testWidgets('should select date when quick option is tapped', (tester) async {
      final container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockProfileRepository),
          secureStorageProvider.overrideWithValue(mockSecureStorage),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: QuitDateScreen(),
          ),
        ),
      );

      // Initially no date selected
      var state = container.read(onboardingProvider);
      expect(state.quitDate, isNull);

      // Tap "Tomorrow"
      await tester.tap(find.text('Tomorrow'));
      await tester.pumpAndSettle();

      // Date should be selected
      state = container.read(onboardingProvider);
      expect(state.quitDate, isNotNull);
    });

    testWidgets('should display selected date card', (tester) async {
      final container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockProfileRepository),
          secureStorageProvider.overrideWithValue(mockSecureStorage),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: QuitDateScreen(),
          ),
        ),
      );

      // Select a date
      await tester.tap(find.text('Tomorrow'));
      await tester.pumpAndSettle();

      // Should display selected date card
      expect(find.text('Your Quit Date'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should show snackbar if finish is tapped without selecting date', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Tap finish without selecting date
      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle();

      expect(find.text('Please select a quit date'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should complete onboarding and navigate to dashboard on success', (tester) async {
      final container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockProfileRepository),
          secureStorageProvider.overrideWithValue(mockSecureStorage),
        ],
      );
      addTearDown(container.dispose);

      // Setup mocks for successful save
      when(mockProfileRepository.saveProfile(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setUserId(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setOnboardingCompleted(true))
          .thenAnswer((_) async => Future.value());

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: QuitDateScreen(),
          ),
        ),
      );

      // Set required data
      container.read(onboardingProvider.notifier).setGoalType(GoalType.quitSmoking);
      container.read(onboardingProvider.notifier).setCigarettesPerDay(10);

      // Select date
      await tester.tap(find.text('Tomorrow'));
      await tester.pumpAndSettle();

      // Tap finish
      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle();

      // Should navigate to dashboard
      expect(find.byType(DashboardScreen), findsOneWidget);
      expect(find.byType(QuitDateScreen), findsNothing);
    });

    testWidgets('should show error snackbar on save failure', (tester) async {
      final container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockProfileRepository),
          secureStorageProvider.overrideWithValue(mockSecureStorage),
        ],
      );
      addTearDown(container.dispose);

      // Setup mocks for failed save
      when(mockProfileRepository.saveProfile(any))
          .thenThrow(Exception('Database error'));

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: QuitDateScreen(),
          ),
        ),
      );

      container.read(onboardingProvider.notifier).setGoalType(GoalType.quitSmoking);

      // Select date
      await tester.tap(find.text('Tomorrow'));
      await tester.pumpAndSettle();

      // Tap finish
      await tester.tap(find.text(AppStrings.finish));
      await tester.pumpAndSettle();

      // Should show error
      expect(find.textContaining('Failed to'), findsOneWidget);
    });

    testWidgets('should show loading overlay during save', (tester) async {
      final container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockProfileRepository),
          secureStorageProvider.overrideWithValue(mockSecureStorage),
        ],
      );
      addTearDown(container.dispose);

      // Setup mock with delay
      when(mockProfileRepository.saveProfile(any))
          .thenAnswer((_) async => Future.delayed(const Duration(seconds: 2)));
      when(mockSecureStorage.setUserId(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setOnboardingCompleted(true))
          .thenAnswer((_) async => Future.value());

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: QuitDateScreen(),
          ),
        ),
      );

      container.read(onboardingProvider.notifier).setGoalType(GoalType.quitSmoking);

      await tester.tap(find.text('Tomorrow'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.finish));
      await tester.pump();

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });

    testWidgets('should highlight selected quick date option', (tester) async {
      final container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockProfileRepository),
          secureStorageProvider.overrideWithValue(mockSecureStorage),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: QuitDateScreen(),
          ),
        ),
      );

      // Select "In 7 days"
      await tester.tap(find.text('In 7 days'));
      await tester.pumpAndSettle();

      // Find the button widget
      final button = tester.widget<OutlinedButton>(
        find.ancestor(
          of: find.text('In 7 days'),
          matching: find.byType(OutlinedButton),
        ),
      );

      // Verify styling
      expect(button.style, isNotNull);
    });
  });
}