# admiral-controller

Official Helm chart for Admiral Controller

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.0](https://img.shields.io/badge/AppVersion-v0.1.0-informational?style=flat-square)

## Introduction

This chart deploys Admiral Controller on a Kubernetes cluster using the Helm package manager.

Admiral Controller is a Kubernetes controller that connects to Admiral Server to execute workloads across multiple clusters. It acts as the execution agent that receives deployment instructions from Admiral Server and manages the actual Kubernetes resources.

## Prerequisites

- Kubernetes 1.20+
- Helm 3.2.0+
- Admiral Server instance
- Authentication token from Admiral Server

## Installing the Chart

To install the chart with the release name `admiral-controller`:

```bash
helm repo add admiral https://charts.admiral.io
helm repo update
helm install admiral-controller admiral/admiral-controller \
  --set admiral.config.server.hostPort="admiral-server.default.svc.cluster.local:8080" \
  --set admiral.config.server.authToken="your-auth-token"
```

The command deploys Admiral Controller on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

### Upgrading existing Helm Chart

```
helm repo update
helm upgrade admiral-controller admiral/admiral-controller --reuse-values
```

## Uninstalling the Chart

To uninstall the `admiral-controller` deployment:

```bash
helm uninstall admiral-controller
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admiral.affinity | object | `{}` |  |
| admiral.config.logging.format | string | `"json"` |  |
| admiral.config.logging.level | string | `"info"` |  |
| admiral.config.server.authToken | string | `""` |  |
| admiral.config.server.hostPort | string | `""` |  |
| admiral.config.worker.concurrency | int | `5` |  |
| admiral.config.worker.namespace | string | `"default"` |  |
| admiral.image.pullPolicy | string | `"IfNotPresent"` |  |
| admiral.image.repository | string | `"ghcr.io/mberwanger/admiral-controller"` |  |
| admiral.image.tag | string | `"v0.1.0"` |  |
| admiral.imagePullSecrets | list | `[]` |  |
| admiral.nodeSelector | object | `{}` |  |
| admiral.replicaCount | int | `1` |  |
| admiral.resources.limits.cpu | string | `"500m"` |  |
| admiral.resources.limits.memory | string | `"512Mi"` |  |
| admiral.resources.requests.cpu | string | `"100m"` |  |
| admiral.resources.requests.memory | string | `"128Mi"` |  |
| admiral.tolerations | list | `[]` |  |
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
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.path | string | `"/healthz"` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| metrics.enabled | bool | `true` |  |
| metrics.path | string | `"/metrics"` |  |
| metrics.port | int | `9090` |  |
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
| rbac.create | bool | `true` |  |
| rbac.rules[0].apiGroups[0] | string | `""` |  |
| rbac.rules[0].resources[0] | string | `"pods"` |  |
| rbac.rules[0].resources[1] | string | `"services"` |  |
| rbac.rules[0].resources[2] | string | `"configmaps"` |  |
| rbac.rules[0].resources[3] | string | `"secrets"` |  |
| rbac.rules[0].verbs[0] | string | `"get"` |  |
| rbac.rules[0].verbs[1] | string | `"list"` |  |
| rbac.rules[0].verbs[2] | string | `"watch"` |  |
| rbac.rules[0].verbs[3] | string | `"create"` |  |
| rbac.rules[0].verbs[4] | string | `"update"` |  |
| rbac.rules[0].verbs[5] | string | `"patch"` |  |
| rbac.rules[0].verbs[6] | string | `"delete"` |  |
| rbac.rules[1].apiGroups[0] | string | `"apps"` |  |
| rbac.rules[1].resources[0] | string | `"deployments"` |  |
| rbac.rules[1].resources[1] | string | `"replicasets"` |  |
| rbac.rules[1].verbs[0] | string | `"get"` |  |
| rbac.rules[1].verbs[1] | string | `"list"` |  |
| rbac.rules[1].verbs[2] | string | `"watch"` |  |
| rbac.rules[1].verbs[3] | string | `"create"` |  |
| rbac.rules[1].verbs[4] | string | `"update"` |  |
| rbac.rules[1].verbs[5] | string | `"patch"` |  |
| rbac.rules[1].verbs[6] | string | `"delete"` |  |
| rbac.rules[2].apiGroups[0] | string | `"batch"` |  |
| rbac.rules[2].resources[0] | string | `"jobs"` |  |
| rbac.rules[2].resources[1] | string | `"cronjobs"` |  |
| rbac.rules[2].verbs[0] | string | `"get"` |  |
| rbac.rules[2].verbs[1] | string | `"list"` |  |
| rbac.rules[2].verbs[2] | string | `"watch"` |  |
| rbac.rules[2].verbs[3] | string | `"create"` |  |
| rbac.rules[2].verbs[4] | string | `"update"` |  |
| rbac.rules[2].verbs[5] | string | `"patch"` |  |
| rbac.rules[2].verbs[6] | string | `"delete"` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.path | string | `"/readyz"` |  |
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
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.path | string | `"/healthz"` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.successThreshold | int | `1` |  |
| startupProbe.timeoutSeconds | int | `5` |  |

### Required Configuration

All external service configurations are **required**. The chart includes schema validation to enforce this:

#### Admiral Server Configuration

Admiral Controller requires connection details to Admiral Server:

```yaml
admiral:
  config:
    server:
      hostPort: "admiral-server.default.svc.cluster.local:8080"
      authToken: "your-authentication-token"
```

#### Worker Configuration

Configure the controller's worker behavior:

```yaml
admiral:
  config:
    worker:
      concurrency: 5
      namespace: "default"
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

### RBAC

Admiral Controller requires cluster-level permissions to manage Kubernetes resources:

```yaml
rbac:
  create: true
  rules:
    - apiGroups: [""]
      resources: ["pods", "services", "configmaps", "secrets"]
      verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
    - apiGroups: ["apps"]
      resources: ["deployments", "replicasets"]
      verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
```

### Resource Management

Configure resource limits and requests:

```yaml
admiral:
  resources:
    limits:
      cpu: 500m
      memory: 512Mi
    requests:
      cpu: 100m
      memory: 128Mi
```

### High Availability

For production deployments, consider:

```yaml
admiral:
  replicaCount: 2

podDisruptionBudget:
  enabled: true
  maxUnavailable: 1

admiral:
  affinity:
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 100
          podAffinityTerm:
            labelSelector:
              matchLabels:
                app.kubernetes.io/name: admiral-controller
            topologyKey: kubernetes.io/hostname
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