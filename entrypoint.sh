#!/bin/sh -l

# Export variables from --env docker arguments
export PATH_TO_CODE=$INPUT_WORKDIR
export PATH_TO_UNIT_TESTS=$INPUT_TEST_DIR
export MAX_LINE_LENGTH=$INPUT_MAX_LINE_LENGTH
export COMPLEXITY_SCORE=$INPUT_COMPLEXITY_SCORE
export COVERAGE_SCORE=$INPUT_COVERAGE_SCORE
export DOCUMENTATION_SCORE=$INPUT_DOCUMENTATION_SCORE

# As the workdir for github actions isn't the default one, copy the testing commands here.
cp -r /app/* .

# Command to launch all the tests at once
make all_tests
