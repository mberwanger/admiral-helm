# Security

This document covers security practices and scanning procedures for Admiral Helm charts.

## Security Scanning

You can run security scans locally using [Checkov](https://www.checkov.io/):

```bash
# Install Checkov
pip install checkov

# Scan individual charts
checkov -d charts/admiral-server --output cli --output sarif --output-file-path checkov-results.sarif --var-file charts/admiral-server/ci/test-values.yaml
checkov -d charts/admiral-controller --output cli --output sarif --output-file-path checkov-results.sarif --var-file charts/admiral-controller/ci/test-values.yaml
checkov -d charts/admiral-worker --output cli --output sarif --output-file-path checkov-results.sarif --var-file charts/admiral-worker/ci/test-values.yaml

# Scan all charts
checkov -d charts/ --output cli --output sarif --output-file-path checkov-results.sarif --var-file charts/admiral-server/ci/test-values.yaml --var-file charts/admiral-controller/ci/test-values.yaml --var-file charts/admiral-worker/ci/test-values.yaml
```

## Automated Security Scanning

### OSSF Scorecard

The repository uses [OSSF Scorecard](https://github.com/ossf/scorecard) for supply-chain security analysis. This runs automatically:

- Weekly on Saturdays at 18:39 UTC
- On pushes to master and release branches
- On branch protection rule changes

Results are uploaded to GitHub Security tab and published to the OpenSSF REST API.

## Security Policy

Please refer to [SECURITY.md](../SECURITY.md) for details on how to report security issues.