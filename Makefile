# Path to check the code
ifeq ($(PATH_TO_CODE),)
export PATH_TO_CODE=src
endif
# Path to the unit tests
ifeq ($(PATH_TO_UNIT_TESTS),)
export PATH_TO_UNIT_TESTS=tests/unit
endif

# Score thresholds
ifeq ($(COVERAGE_SCORE),)
export COVERAGE_SCORE:= 50
endif
ifeq ($(COMPLEXITY_SCORE),)
export COMPLEXITY_SCORE := 2
endif
ifeq ($(DOCUMENTATION_SCORE),)
export DOCUMENTATION_SCORE:= 5
endif

# Max line length for black
ifeq ($(MAX_LINE_LENGTH), )
MAX_LINE_LENGTH=99
endif

export PYTHON?=python -m

# Path to the lintage directory
LINTAGE_DIR=script/lintage

# Convert the code to black format
format_code :
	$(PYTHON) black --line-length $(MAX_LINE_LENGTH) ${PATH_TO_CODE}

# Do all the static tests
test_static_all:
	$(PYTHON) black --check --line-length $(MAX_LINE_LENGTH)  ${PATH_TO_CODE}
	$(PYTHON) isort --profile black ${PATH_TO_CODE}
	$(PYTHON) mypy ${PATH_TO_CODE} --ignore-missing-imports
	$(PYTHON) flake8 --exclude=tests --max-line-length $(MAX_LINE_LENGTH) ${PATH_TO_CODE}

test_unit_coverage:
	${LINTAGE_DIR}/coverage.sh

test_complexity:
	${LINTAGE_DIR}/complexity.sh

test_documentation:
	${LINTAGE_DIR}/documentation.sh

all_tests: test_static_all test_complexity test_documentation test_unit_coverage