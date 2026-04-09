# Complete Test Run

Complete a test run in Qase TMS.

## Inputs

### token

Qase API token. You can get it in your account settings.
If not provided, the `QASE_TESTOPS_API_TOKEN` environment variable will be used.

### project

**Required**. Project code where the test run will be created.

### id

**Required**. ID of the test run to complete.

### verbose

Verbose mode. Default: false.

## Outputs

### id

ID of the completed test run.

## Example usage

### Using token input

```yaml
steps:
  - name: Complete a Qase test run
    uses: qase-tms/gh-actions/run-complete
    id: complete
    if: always()
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: CODE
      id: ${{ steps.qase-run-create.outputs.id }}
```

### Using environment variable

```yaml
env:
  QASE_TESTOPS_API_TOKEN: ${{ secrets.QASE_TOKEN }}

steps:
  - name: Complete a Qase test run
    uses: qase-tms/gh-actions/run-complete
    id: complete
    if: always()
    with:
      project: CODE
      id: ${{ steps.qase-run-create.outputs.id }}
```

