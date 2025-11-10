#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🚀 QuitMate Test Suite"
echo "======================"
echo ""

# Function to run tests and check result
run_test_suite() {
    local test_name=$1
    local test_path=$2

    echo -e "${YELLOW}Running $test_name...${NC}"

    if flutter test "$test_path"; then
        echo -e "${GREEN}✅ $test_name passed${NC}"
        echo ""
        return 0
    else
        echo -e "${RED}❌ $test_name failed${NC}"
        echo ""
        return 1
    fi
}

# Track failures
FAILED_TESTS=0

# Run test suites
run_test_suite "Domain Tests" "test/features/onboarding/domain/" || ((FAILED_TESTS++))
run_test_suite "Data Model Tests" "test/features/onboarding/data/models/" || ((FAILED_TESTS++))
run_test_suite "Provider Tests" "test/features/onboarding/presentation/providers/" || ((FAILED_TESTS++))
run_test_suite "Widget Tests" "test/features/onboarding/presentation/screens/" || ((FAILED_TESTS++))
run_test_suite "Component Tests" "test/features/onboarding/presentation/widgets/" || ((FAILED_TESTS++))

# Summary
echo ""
echo "======================"
echo "📋 Test Summary"
echo "======================"

if [ $FAILED_TESTS -eq 0 ]; then
    echo -e "${GREEN}All test suites passed! 🎉${NC}"
    exit 0
else
    echo -e "${RED}$FAILED_TESTS test suite(s) failed${NC}"
    exit 1
fi