# admiral-server

Official Helm chart for Admiral Server

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Introduction

This chart deploys Admiral Server on a Kubernetes cluster using the Helm package manager.

Admiral is a comprehensive application and infrastructure management system designed to orchestrate the full lifecycle of applications from development to production deployment.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- External PostgreSQL database
- OIDC provider (e.g., Auth0, Microsoft, Okta, Google, etc.)
- S3-compatible object storage
- Temporal workflow engine

## Installing the Chart

To install the chart with the release name `admiral`:

```bash
helm repo add admiral https://charts.admiral.io
helm repo update
helm install admiral-server admiral/admiral-server \
  --set admiral.config.database.host="postgres.example.com" \
  --set admiral.config.database.user="admiral" \
  --set admiral.config.database.password="your-db-password" \
  --set admiral.config.auth.oidcIssuer="https://auth.example.com" \
  --set admiral.config.auth.oidcClientId="admiral-client" \
  --set admiral.config.auth.oidcClientSecret="your-client-secret" \
  --set admiral.config.auth.sessionSecret="your-session-secret" \
  --set admiral.config.storage.manifestsBucket="admiral-manifests" \
  --set admiral.config.storage.revisionsBucket="admiral-revisions" \
  --set admiral.config.temporal.hostPort="temporal.example.com:7233"
```

The command deploys Admiral Server on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

### Upgrading existing Helm Chart

```
helm repo update
helm upgrade admiral-server admiral/admiral-server --reuse-values
```

## Uninstalling the Chart

To uninstall the `admiral-server` deployment:

```bash
helm uninstall admiral-server
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admiral.affinity | object | `{}` |  |
| admiral.config.auth.oidcClientId | string | `""` |  |
| admiral.config.auth.oidcClientSecret | string | `""` |  |
| admiral.config.auth.oidcIssuer | string | `""` |  |
| admiral.config.auth.sessionSecret | string | `""` |  |
| admiral.config.database.host | string | `""` |  |
| admiral.config.database.name | string | `"admiral"` |  |
| admiral.config.database.password | string | `""` |  |
| admiral.config.database.port | int | `5432` |  |
| admiral.config.database.sslMode | string | `"disable"` |  |
| admiral.config.database.user | string | `""` |  |
| admiral.config.logging.format | string | `"json"` |  |
| admiral.config.logging.level | string | `"info"` |  |
| admiral.config.server.host | string | `"0.0.0.0"` |  |
| admiral.config.server.port | int | `8080` |  |
| admiral.config.storage.accessKey | string | `""` |  |
| admiral.config.storage.endpoint | string | `""` |  |
| admiral.config.storage.manifestsBucket | string | `""` |  |
| admiral.config.storage.revisionsBucket | string | `""` |  |
| admiral.config.storage.secretKey | string | `""` |  |
| admiral.config.storage.type | string | `"s3"` |  |
| admiral.config.storage.useSSL | bool | `true` |  |
| admiral.config.temporal.hostPort | string | `""` |  |
| admiral.config.temporal.namespace | string | `"admiral"` |  |
| admiral.image.pullPolicy | string | `"IfNotPresent"` |  |
| admiral.image.repository | string | `"ghcr.io/mberwanger/admiral-server"` |  |
| admiral.image.tag | string | `"0.1.0"` |  |
| admiral.imagePullSecrets | list | `[]` |  |
| admiral.ingress.annotations | object | `{}` |  |
| admiral.ingress.className | string | `""` |  |
| admiral.ingress.enabled | bool | `false` |  |
| admiral.ingress.hosts[0].host | string | `"admiral.local"` |  |
| admiral.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| admiral.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| admiral.ingress.tls | list | `[]` |  |
| admiral.nodeSelector | object | `{}` |  |
| admiral.replicaCount | int | `1` |  |
| admiral.resources.limits.cpu | string | `"1000m"` |  |
| admiral.resources.limits.memory | string | `"1Gi"` |  |
| admiral.resources.requests.cpu | string | `"500m"` |  |
| admiral.resources.requests.memory | string | `"512Mi"` |  |
| admiral.service.port | int | `8080` |  |
| admiral.service.type | string | `"ClusterIP"` |  |
| admiral.tolerations | list | `[]` |  |
| affinity.podAntiAffinity.enabled | bool | `false` |  |
| affinity.podAntiAffinity.topologyKey | string | `"kubernetes.io/hostname"` |  |
| affinity.podAntiAffinity.type | string | `"soft"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| extraEnvVars | list | `[]` |  |
| extraManifests | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| global | object | `{}` |  |
| initContainers | list | `[]` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.path | string | `"/healthcheck"` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `10` |  |
| metrics.enabled | bool | `true` |  |
| metrics.path | string | `"/metrics"` |  |
| networkPolicy.egress.customRules | list | `[]` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.ingress.customRules | list | `[]` |  |
| networkPolicy.ingress.namespaceSelector | object | `{}` |  |
| networkPolicy.ingress.podSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| podDisruptionBudget.maxUnavailable | int | `1` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `65534` |  |
| podSecurityContext.runAsGroup | int | `65534` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `65534` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| priorityClassName | string | `""` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.initialDelaySeconds | int | `30` |  |
| readinessProbe.path | string | `"/healthcheck"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `65534` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sidecars | list | `[]` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.failureThreshold | int | `18` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.path | string | `"/healthcheck"` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.successThreshold | int | `1` |  |
| startupProbe.timeoutSeconds | int | `5` |  |

### Required Configuration

All external service configurations are **required**. The chart includes schema validation to enforce this:

#### Database Configuration
Admiral requires a PostgreSQL database. Configure the connection details:

```yaml
admiral:
  config:
    database:
      host: "your-postgres-host"
      name: "admiral"
      user: "admiral"
      password: "your-secure-password"
```

#### Authentication Configuration
Configure OIDC provider for authentication:

```yaml
admiral:
  config:
    auth:
      oidcIssuer: "https://your-idp.com"
      oidcClientId: "your-client-id"
      oidcClientSecret: "your-client-secret"
      sessionSecret: "your-session-secret"
```

#### Storage Configuration
Configure S3-compatible storage for manifests and revisions:

```yaml
admiral:
  config:
    storage:
      type: "s3"
      accessKey: "your-access-key"
      secretKey: "your-secret-key"
      manifestsBucket: "manifests"
      revisionsBucket: "revisions"
```

#### Temporal Configuration
Configure Temporal workflow engine:

```yaml
admiral:
  config:
    temporal:
      hostPort: "your-temporal-host:7233"
      namespace: "admiral"
```

## Configuration and Installation Details

### Schema Validation

This chart includes `values.schema.json` to validate required configuration fields. If required fields are missing, Helm will reject the installation with a clear error message.

### Security Context

The chart runs with a restrictive security context by default:
- Non-root user (UID 65534)
- Read-only root filesystem
- Dropped ALL capabilities
- Seccomp profiles enabled

### Resource Management

Configure resource limits and requests:

```yaml
admiral:
  resources:
    limits:
      cpu: 1000m
      memory: 1Gi
    requests:
      cpu: 500m
      memory: 512Mi
```

### High Availability

For production deployments, consider:

```yaml
admiral:
  replicaCount: 3
 
podDisruptionBudget:
  enabled: true
  maxUnavailable: 1

affinity:
  podAntiAffinity:
    enabled: true
    type: "hard"
```

### Ingress

Configure ingress for external access:

```yaml
admiral:
  ingress:
    enabled: true
    className: "nginx"
    hosts:
      - host: admiral.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - secretName: admiral-tls
        hosts:
          - admiral.example.com
```

https://admiral.io

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mberwanger | <mberwanger@protonmail.com> |  |

## Source Code

* <https://github.com/mberwanger/admiral>
* <https://github.com/mberwanger/admiral-helm>

## Requirements

Kubernetes: `>= 1.20.0-0`

