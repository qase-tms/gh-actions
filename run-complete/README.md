# Complete Test Run

Complete a test run in Qase TMS.

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
  - name: Complete a Qase test run
    uses: qase-tms/gh-actions/run-complete
    id: complete
    if: always()
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: CODE
      id: ${{ steps.qase-run-create.outputs.id }}
```

