# Report

Report test results to Qase TMS from JUnit, Qase, XCTest and Allure test reports.

## Inputs

### token

Qase API token. You can get it in your account settings.
If not provided, the `QASE_TESTOPS_API_TOKEN` environment variable will be used.

### project

**Required**. Project code where the test run will be created.

### id

**Required**. ID of the test run to report results to.

### format

**Required**. Format of the test results. Allowed values: `junit`, `qase`, `xctest`, `allure`.

### path

**Required**. Path to the test results file or directory.

### batch

Batch size of the test results. Default: 20

### steps

Steps show mode in XCTest. Allowed values: all, user

### verbose

Verbose mode. Default: false.

## Example usage

### Using token input

```yaml
steps:
  - uses: qase-tms/gh-actions/report@v1
    id: report
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: CODE
      # create a test run using qase-tms/gh-actions/run-create
      id: ${{ steps.qase-run-create.outputs.id }}
      format: junit
      path: test-results.xml
      batch: 100
```

### Using environment variable

```yaml
env:
  QASE_TESTOPS_API_TOKEN: ${{ secrets.QASE_TOKEN }}

steps:
  - uses: qase-tms/gh-actions/report@v1
    id: report
    with:
      project: CODE
      id: ${{ steps.qase-run-create.outputs.id }}
      format: junit
      path: test-results.xml
      batch: 100
```
