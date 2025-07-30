# Admiral Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Chart Publish](https://github.com/mberwanger/admiral-helm/actions/workflows/publish.yaml/badge.svg?branch=master)](https://github.com/mberwanger/admiral-helm/actions/workflows/publish.yaml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/admiral)](https://artifacthub.io/packages/search?repo=admiral)

Admiral Helm is a collection charts for admiral project. The charts can be added using following command:

```bash
helm repo add admiral https://charts.admiral.io
```

The charts published currently by this repository are the following:

| Chart name                                                                                             | Status | Remark                         |
| ------------------------------------------------------------------------------------------------------ | ------ | ------------------------------ |
| [admiral-server](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-server)         | Alpha  | Deploys the Admiral Server     |
| [admiral-controller](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-controller) | Alpha  | Deploys the Admiral Controller |
| [admiral-worker](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-worker)         | Alpha  | Deploys the Admiral Worker     |

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

## Security Policy

Please refer to [SECURITY.md](https://github.com/mberwanger/admiral-helm/blob/master/SECURITY.md) for details on how to report security issues.

## Changelog

Releases are managed independently for each helm chart, and changelogs are tracked on each release.
