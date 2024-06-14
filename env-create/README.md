# Create Environment

This action creates a new environment in Qase TMS and returns its ID.

## Inputs

### token

**Required**. Qase API token. You can get it in your account settings.

### project

**Required**. Project code where the test run will be created.

### title

**Required**. Title of the environment.

### slug

**Required**. Slug of the environment.

### description

Description of the environment.

### host

Host of the environment.

### verbose

Verbose mode. Default: false.

## Outputs

### id

ID of the created environment.

## Example usage

```yaml
steps:
  - name: Create a Qase test environment
    uses: qase-tms/gh-actions/env-create@v1
    id: qase-env-create
    with:
      token: ${{ secrets.QASE_TOKEN }}
      project: CODE
      title: My Environment
      slug: my-env
      description: My Environment Description
      host: my-environment.com

  - name: Get Qase environment ID as env variable
    run: |
      echo QASE_ENVIRONMENT=${{ steps.qase-env-create.outputs.id }} >> $GITHUB_ENV
```
