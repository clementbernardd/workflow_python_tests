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