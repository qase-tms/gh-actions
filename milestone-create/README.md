# Create Milestone

This action creates a new milestone in Qase TMS and returns its ID.

## Inputs

### token

Qase API token. You can get it in your account settings.
If not provided, the `QASE_TESTOPS_API_TOKEN` environment variable will be used.

### project

**Required**. Project code where the test run will be created.

### title

**Required**. Title of the milestone.

### description

Description of the milestone.
Markdown formatting is supported in descriptions.

### status

Status of the milestone. Allowed values: active, completed

### due_date

Due date of the milestone. Format: YYYY-MM-DD

### verbose

Verbose mode. Default: false.

## Outputs

### id

ID of the created milestone.

## Example usage

### Using token input

```yaml
steps:
  - name: Create a Qase milestone
    uses: qase-tms/gh-actions/milestone-create@v1
    id: qase-milestone-create
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: CODE
      title: Release 1.0.0
      description: Preparing product release 1.0.0
      due_date: 2048-02-24
      status: active

  - name: Get milestone ID as an env variable
    run: |
      echo QASE_MILESTONE=${{ steps.qase-milestone-create.outputs.id }} >> $GITHUB_ENV
```

### Using environment variable

```yaml
env:
  QASE_TESTOPS_API_TOKEN: ${{ secrets.QASE_TOKEN }}

steps:
  - name: Create a Qase milestone
    uses: qase-tms/gh-actions/milestone-create@v1
    id: qase-milestone-create
    with:
      project: CODE
      title: Release 1.0.0
      description: Preparing product release 1.0.0
      due_date: 2048-02-24
      status: active
```
