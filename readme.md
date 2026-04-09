# GitHub Actions for Qase TestOps

*  Create Qase test runs: [qase-tms/gh-actions/run-create](https://github.com/qase-tms/gh-actions/tree/main/run-create).
*  Complete (close) Qase test runs: [qase-tms/gh-actions/run-complete](https://github.com/qase-tms/gh-actions/tree/main/run-complete).
*  Send test reports in JUnit, XCTest, Qase, and Allure formats: [qase-tms/gh-actions/report](https://github.com/qase-tms/gh-actions/tree/main/report).
*  Create Qase environments: [qase-tms/gh-actions/env-create](https://github.com/qase-tms/gh-actions/tree/main/env-create).
*  Create Qase milestones: [qase-tms/gh-actions/milestone-create](https://github.com/qase-tms/gh-actions/tree/main/milestone-create).

## Authentication

All actions accept a `token` input for the Qase API token. Alternatively, you can set the `QASE_TESTOPS_API_TOKEN` environment variable at the workflow or job level, and all actions will use it automatically:

```yaml
env:
  QASE_TESTOPS_API_TOKEN: ${{ secrets.QASE_TOKEN }}

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: qase-tms/gh-actions/run-create@v1
        with:
          project: CODE
          title: Test Run
      # ... no need to pass token to each action
```

If both the `token` input and the environment variable are provided, the `token` input takes priority.