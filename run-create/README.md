# Create Test Run

Create a new test run in Qase TMS and return its ID.

## Inputs

### token

**Required**. Qase API token. You can get it in your account settings.

### project

**Required**. Project code where the test run will be created.

### title

**Required**. Test run title. 

### description

Test run description, shown on the test run page.
Markdown formatting is supported in descriptions.

### environment

Qase test environment to use for a new test run.
For example, 'dev', 'feature-123', 'production'

### milestone

Qase milestone to use for a new test run, specified by ID.

### plan

Qase test plan to use for a new test run, specified by ID.

### verbose

Verbose mode. Default: false.

## Outputs

### id

ID of the created test run.

## Example usage

```yaml
steps:
  - uses: qase-tms/gh-actions/run-create
    id: qase-run-create
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: CODE
      title: Test Run Title
      description: |
        Test Run Description
        Use multiline text and [markdown formatting](https://example.com)
      environment: my-env
      milestone: 123
      plan: 321

  - name: Run tests
    run: |
      echo QASE_TESTOPS_RUN_ID=${{ steps.qase-run-create.outputs.id }} >> $GITHUB_ENV
      # Run tests here  
```
