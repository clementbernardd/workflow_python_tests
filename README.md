# Workflow python tests

This action tests the validity of the code using static tests, unit tests, coverage and complexity tests.

It uses the following pipeline: 

![test](img/test_pipeline.drawio.png?raw=true "Test pipeline")


## Inputs

### `WORKDIR`

Relative path to the directory. Default to `src`.

### `TEST_DIR`

Relative path to the different unit tests. Default to `tests/unit`.

### `MAX_LINE_LENGTH`

The maximum number of characters per line for the black format (https://pypi.org/project/black/). Default to 99. 

### `COMPLEXITY_SCORE`

The score acceptable for the `radon cc` (https://pypi.org/project/radon/) score. Default to 2. The lower the better. 

### `COVERAGE_SCORE`

The score acceptable for the unit tests, using `coverage` (https://pypi.org/project/coverage/) and `pytest`. Default to 50. The maximum score is 100. 

### `DOCUMENTATION_SCORE`

The score acceptable for the documentation, using `pylint` (https://pypi.org/project/pylint/). Default to 5. The maximum score is 10. 


## Outputs

### `complexity_score`

The complexity score of the code.

### `coverage_score`

The coverage score of the code.

### `documentation_score`

The documentation score of the code.


## Example usage

```
uses: actions/workflow_python_tests@v1
id: lintage_job
with:
  WORKDIR: 'src'
  TEST_DIR: 'tests/unit'
  MAX_LINE_LENGTH: 99
  COMPLEXITY_SCORE: 2
  COVERAGE_SCORE: 50
  DOCUMENTATION_SCORE: 5
```

## Explanation

Here are few explanation of what is done in the Makefile: 

- `format_code` : format the source code in the `black` format.
- `test_static_all`: do static tests that don't require further implementation to convert it to errors. It uses `black`, `isort`, `mypy` and `flake8`.
- `test_unit_coverage`: run the `coverage.sh` script to convert the unit tests into a coverage score.
- `test_complexity`: run the `complexity.sh` script to accept the code if it is not too complex.
- `test_documentation`: run the `documentation.sh` script to accept the code if it is enough documented.
- `all_tests`: run all the tests. It is useful to use in local to check that the current code is passing the tests.

Be aware that you need to preprocess the code into the black format if you want to pass the tests.