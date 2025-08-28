#!/bin/bash

# Simple test runner for the test repository
# Tests the basic functionality of the test files

echo "Running tests..."
echo "=================="

test_count=0
passed_tests=0
failed_tests=0

# Function to run a test
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    test_count=$((test_count + 1))
    echo -n "Test $test_count: $test_name ... "
    
    if eval "$test_command"; then
        echo "PASS"
        passed_tests=$((passed_tests + 1))
    else
        echo "FAIL"
        failed_tests=$((failed_tests + 1))
    fi
}

# Test 1: Check if test files exist
run_test "Test files exist" "[ -f 'test' ] && [ -f 'test2' ] && [ -f 'test3' ]"

# Test 2: Check if test files have expected content
run_test "Test file content is 'test'" "[ \"\$(cat test | tr -d '\n')\" = 'test' ]"

# Test 3: Check if all test files have the same content
run_test "All test files have consistent content" "diff test test2 >/dev/null && diff test2 test3 >/dev/null"

# Test 4: Check if GitHub workflows exist
run_test "GitHub workflows exist" "[ -f '.github/workflows/test.yaml' ] && [ -f '.github/workflows/secrets-scan.yaml' ]"

# Test 5: Check if test.yaml contains proper CI configuration
run_test "CI workflow is valid" "grep -q 'name: CI' .github/workflows/test.yaml"

# Summary
echo "=================="
echo "Test Summary:"
echo "  Total tests: $test_count"
echo "  Passed: $passed_tests"
echo "  Failed: $failed_tests"
echo "=================="

if [ $failed_tests -eq 0 ]; then
    echo "All tests passed! ✅"
    exit 0
else
    echo "Some tests failed! ❌"
    exit 1
fi