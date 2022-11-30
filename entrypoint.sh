#!/bin/sh -l
# Relative path in the container
CODE_PATH=/app/code


# Export variables from --env docker arguments
export PATH_TO_CODE=$CODE_PATH/$INPUT_WORKDIR
export PATH_TO_UNIT_TESTS=$CODE_PATH/$INPUT_TEST_DIR
export MAX_LINE_LENGTH=$CODE_PATH/$INPUT_MAX_LINE_LENGTH
export COMPLEXITY_SCORE=$CODE_PATH/$INPUT_COMPLEXITY_SCORE
export COVERAGE_SCORE=$CODE_PATH/$INPUT_COVERAGE_SCORE
export DOCUMENTATION_SCORE=$CODE_PATH/$INPUT_DOCUMENTATION_SCORE

set -euxo # Enable to stop the code when there is an error

# Install missing libraries if necessary
if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
fi

## As the workdir for github actions isn't the default one, copy the testing commands in /app/code
mkdir -p $CODE_PATH
cp -r ./ $CODE_PATH/
cd /app

# Command to launch all the tests at once
make all_tests
