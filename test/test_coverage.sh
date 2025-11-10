#!/bin/bash

echo "🧪 Running QuitMate Onboarding Tests..."
echo ""

# Run unit tests
echo "📦 Running Unit Tests..."
flutter test test/features/onboarding/domain/ --coverage
flutter test test/features/onboarding/data/ --coverage

# Run provider tests
echo "🎯 Running Provider Tests..."
flutter test test/features/onboarding/presentation/providers/ --coverage

# Run widget tests
echo "🎨 Running Widget Tests..."
flutter test test/features/onboarding/presentation/screens/ --coverage
flutter test test/features/onboarding/presentation/widgets/ --coverage

# Run integration tests
echo "🔗 Running Integration Tests..."
flutter test integration_test/onboarding_flow_test.dart

# Generate coverage report
echo ""
echo "📊 Generating Coverage Report..."
flutter test --coverage

# Convert to HTML (requires lcov)
if command -v genhtml &> /dev/null
then
    genhtml coverage/lcov.info -o coverage/html
    echo "✅ Coverage report generated at coverage/html/index.html"
else
    echo "⚠️  Install lcov to generate HTML coverage report: brew install lcov (macOS) or apt-get install lcov (Linux)"
fi

echo ""
echo "✅ All tests completed!"