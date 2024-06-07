# Create Test Run

This action creates a new test run in Qase TMS and returns its ID.

## Inputs

### token

**Required**. Qase API token. You can get it in your account settings.

### project

**Required**. Project code where the test run will be created.

### title

**Required**. Title of the test run.

### description

Description of the test run.

### environment

Environment of the test run (slug). For example, 'dev', 'feature-123', 'production'

### milestone

Milestone of the test run, specified by ID.

### plan

Plan of the test run, specified by ID.

### verbose

Verbose mode. Default: false.

## Outputs

### id

ID of the created test run.

## Example usage

```yaml
steps:
  - uses: actions/checkout@v3

  - uses: qase-tms/gh-actions/run-create
    id: create
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: PRJ_CODE
      title: Test Run Title
      description: Test Run Description
      environment: my-env
      milestone: 123
      plan: 321

  - name: Run tests
    run: |
      echo QASE_TESTOPS_RUN_ID=${{ steps.create.outputs.id }} >> $GITHUB_ENV
      # Run tests here  
```
