# Complete Test Run

This action completes a test run in Qase TMS and returns its ID.

## Inputs

### token

**Required**. Qase API token. You can get it in your account settings.

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

```yaml
steps:
  - uses: actions/checkout@v3

  - uses: qase-tms/gh-actions/run-complete
    id: complete
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: PRJ_CODE
      id: ${{ steps.create.outputs.id }}
```
