> :warning: This project is currently **under heavy development and is not considered stable yet**. This means that there may be bugs or unexpected behavior, and we don't recommend using it in production.

# Admiral Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Chart Publish](https://github.com/mberwanger/admiral-helm/actions/workflows/publish.yaml/badge.svg?branch=master)](https://github.com/mberwanger/admiral-helm/actions/workflows/publish.yaml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/admiral)](https://artifacthub.io/packages/search?repo=admiral)

Admiral Helm is a collection charts for admiral project. The charts can be added using following command:

```bash
helm repo add admiral https://charts.admiral.io
helm repo update
```

The charts published currently by this repository are the following:

| Chart name                                                                                             | Status | Remark                         |
| ------------------------------------------------------------------------------------------------------ | ------ | ------------------------------ |
| [admiral-server](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-server)         | Alpha  | Deploys the Admiral Server     |
| [admiral-controller](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-controller) | Alpha  | Deploys the Admiral Controller |
| [admiral-worker](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-worker)         | Alpha  | Deploys the Admiral Worker     |
| [admiral-demo](https://github.com/mberwanger/admiral-helm/tree/master/charts/admiral-demo)             | Alpha  | All-in-one demo deployment     |

## Documentation

-   [Security](docs/security.md) - Security scanning procedures and policies

## Changelog

Releases are managed independently for each helm chart, and changelogs are tracked on each release.
