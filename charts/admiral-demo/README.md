> :warning: This project is currently **under heavy development and is not considered stable yet**. This means that there may be bugs or unexpected behavior, and we don't recommend using it in production.

# admiral-demo

A Helm chart for quickly provisioning Admiral with all required dependencies (PostgreSQL, Keycloak, Temporal, MinIO)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.0](https://img.shields.io/badge/AppVersion-v1.0.0-informational?style=flat-square)

## Introduction

This chart deploys a complete Admiral demo environment on a Kubernetes cluster using the Helm package manager. It includes all required dependencies pre-configured and ready to use:

- **PostgreSQL**: Database for Admiral, Keycloak, and Temporal
- **Keycloak**: OIDC authentication provider with pre-configured realm and users
- **MinIO**: S3-compatible object storage for manifests and revisions
- **Temporal**: Workflow orchestration engine
- **Admiral Server**: Core Admiral application (when available)

## ⚠️ WARNING: Demo Use Only

This chart is configured with default passwords and settings suitable only for demonstration purposes. **DO NOT use this chart in production environments.**

## Prerequisites

- Kubernetes 1.20+
- Helm 3.2.0+
- Ingress controller (optional, for external access)

## Installing the Chart

To install the chart with the release name `admiral-demo`:

```bash
helm repo add admiral https://charts.admiral.io
helm repo update
helm install admiral-demo admiral/admiral-demo
```

The command deploys the complete Admiral demo stack on the Kubernetes cluster. The installation may take a few minutes as all services initialize.

### Quick Start After Installation

1. **Get the Admiral URL**:
   ```bash
   kubectl get ingress -n admiral-demo
   ```

2. **Default Demo Users**:
   - Username: `john.doe` / Password: `password123`
   - Username: `jane.smith` / Password: `password123`
   - Username: `bob.wilson` / Password: `password123`

3. **Access Services Directly** (port-forward):
   ```bash
   # Admiral Server
   kubectl port-forward -n admiral-demo svc/admiral-demo-admiral-server 8080:8080

   # Keycloak Admin Console
   kubectl port-forward -n admiral-demo svc/admiral-demo-keycloak 8081:8080

   # MinIO Console
   kubectl port-forward -n admiral-demo svc/admiral-demo-minio 9000:9000
   ```

### Upgrading existing Helm Chart

```bash
helm repo update
helm upgrade admiral-demo admiral/admiral-demo --reuse-values
```

## Uninstalling the Chart

To uninstall the `admiral-demo` deployment:

```bash
helm uninstall admiral-demo
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admiral-server.config.database.database | string | `"admiral"` |  |
| admiral-server.config.database.host | string | `"admiral-demo-postgresql"` |  |
| admiral-server.config.database.password | string | `"admiral-demo-password"` |  |
| admiral-server.config.database.port | int | `5432` |  |
| admiral-server.config.database.username | string | `"admiral"` |  |
| admiral-server.config.keycloak.authUrl | string | `"http://admiral-demo-keycloak:8080"` |  |
| admiral-server.config.keycloak.clientId | string | `"admiral-server"` |  |
| admiral-server.config.keycloak.clientSecret | string | `"admiral-demo-client-secret"` |  |
| admiral-server.config.keycloak.enabled | bool | `true` |  |
| admiral-server.config.keycloak.realm | string | `"master"` |  |
| admiral-server.config.s3.accessKey | string | `"minioadmin"` |  |
| admiral-server.config.s3.bucket | string | `"admiral-data"` |  |
| admiral-server.config.s3.endpoint | string | `"http://admiral-demo-minio:9000"` |  |
| admiral-server.config.s3.secretKey | string | `"minioadmin"` |  |
| admiral-server.config.temporal.host | string | `"admiral-demo-temporal-frontend"` |  |
| admiral-server.config.temporal.namespace | string | `"admiral"` |  |
| admiral-server.config.temporal.port | int | `7233` |  |
| admiral-server.enabled | bool | `true` |  |
| admiral-server.image.pullPolicy | string | `"IfNotPresent"` |  |
| admiral-server.image.repository | string | `"admiral/server"` |  |
| admiral-server.image.tag | string | `"latest"` |  |
| admiral-server.ingress.className | string | `"nginx"` |  |
| admiral-server.ingress.enabled | bool | `true` |  |
| admiral-server.ingress.hosts[0].host | string | `"admiral.admiral-demo.local"` |  |
| admiral-server.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| admiral-server.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| admiral-server.replicaCount | int | `1` |  |
| admiral-server.service.port | int | `8080` |  |
| admiral-server.service.type | string | `"ClusterIP"` |  |
| admiral-worker.config.s3.accessKey | string | `"minioadmin"` |  |
| admiral-worker.config.s3.bucket | string | `"admiral-data"` |  |
| admiral-worker.config.s3.endpoint | string | `"http://admiral-demo-minio:9000"` |  |
| admiral-worker.config.s3.secretKey | string | `"minioadmin"` |  |
| admiral-worker.config.temporal.host | string | `"admiral-demo-temporal-frontend"` |  |
| admiral-worker.config.temporal.namespace | string | `"admiral"` |  |
| admiral-worker.config.temporal.port | int | `7233` |  |
| admiral-worker.config.temporal.taskQueue | string | `"admiral-tasks"` |  |
| admiral-worker.enabled | bool | `true` |  |
| admiral-worker.image.pullPolicy | string | `"IfNotPresent"` |  |
| admiral-worker.image.repository | string | `"admiral/worker"` |  |
| admiral-worker.image.tag | string | `"latest"` |  |
| admiral-worker.replicaCount | int | `2` |  |
| keycloak.auth.adminPassword | string | `"shipitnow"` |  |
| keycloak.auth.adminUser | string | `"admiral"` |  |
| keycloak.enabled | bool | `true` |  |
| keycloak.externalDatabase.database | string | `"keycloak"` |  |
| keycloak.externalDatabase.host | string | `"admiral-demo-postgresql"` |  |
| keycloak.externalDatabase.password | string | `"shipitnow"` |  |
| keycloak.externalDatabase.port | int | `5432` |  |
| keycloak.externalDatabase.user | string | `"admiral"` |  |
| keycloak.keycloakConfigCli.availabilityCheck.timeout | string | `"180s"` |  |
| keycloak.keycloakConfigCli.configuration."master-realm.json" | string | `"{\n  \"realm\": \"master\",\n  \"users\": [\n    {\n      \"username\": \"john.doe\",\n      \"enabled\": true,\n      \"emailVerified\": true,\n      \"firstName\": \"John\",\n      \"lastName\": \"Doe\",  \n      \"email\": \"john.doe@example.com\",\n      \"credentials\": [\n        {\n          \"type\": \"password\",\n          \"value\": \"password123\",\n          \"temporary\": false\n        }\n      ]\n    },\n    {\n      \"username\": \"jane.smith\",\n      \"enabled\": true,\n      \"emailVerified\": true,\n      \"firstName\": \"Jane\",\n      \"lastName\": \"Smith\",\n      \"email\": \"jane.smith@example.com\", \n      \"credentials\": [\n        {\n          \"type\": \"password\",\n          \"value\": \"password123\",\n          \"temporary\": false\n        }\n      ]\n    },\n    {\n      \"username\": \"bob.wilson\",\n      \"enabled\": true,\n      \"emailVerified\": true,\n      \"firstName\": \"Bob\",\n      \"lastName\": \"Wilson\",\n      \"email\": \"bob.wilson@example.com\",\n      \"credentials\": [\n        {\n          \"type\": \"password\", \n          \"value\": \"password123\",\n          \"temporary\": false\n        }\n      ]\n    }\n  ],\n  \"clients\": [\n    {\n      \"clientId\": \"admiral\",\n      \"name\": \"Admiral\",\n      \"enabled\": true,\n      \"clientAuthenticatorType\": \"client-secret\",\n      \"secret\": \"admiral-demo-client-secret\",\n      \"redirectUris\": [\n        \"http://localhost:8080/*\",\n        \"http://admiral.admiral-demo.local/*\",\n        \"https://admiral.admiral-demo.local/*\"\n      ],\n      \"webOrigins\": [\n        \"http://localhost:8080\",\n        \"http://admiral.admiral-demo.local\", \n        \"https://admiral.admiral-demo.local\"\n      ],\n      \"standardFlowEnabled\": true,\n      \"directAccessGrantsEnabled\": true,\n      \"publicClient\": false,\n      \"protocol\": \"openid-connect\"\n    }\n  ]\n}\n"` |  |
| keycloak.keycloakConfigCli.enabled | bool | `true` |  |
| keycloak.livenessProbe.failureThreshold | int | `6` |  |
| keycloak.livenessProbe.initialDelaySeconds | int | `120` |  |
| keycloak.livenessProbe.periodSeconds | int | `30` |  |
| keycloak.livenessProbe.timeoutSeconds | int | `10` |  |
| keycloak.postgresql.enabled | bool | `false` |  |
| keycloak.readinessProbe.failureThreshold | int | `12` |  |
| keycloak.readinessProbe.initialDelaySeconds | int | `60` |  |
| keycloak.readinessProbe.periodSeconds | int | `10` |  |
| keycloak.readinessProbe.timeoutSeconds | int | `5` |  |
| minio.auth.rootPassword | string | `"shipitnow"` |  |
| minio.auth.rootUser | string | `"admiral"` |  |
| minio.console.enabled | bool | `false` |  |
| minio.defaultBuckets | string | `"manifests,revisions"` |  |
| minio.enabled | bool | `true` |  |
| minio.persistence.enabled | bool | `false` |  |
| minio.persistence.size | string | `"5Gi"` |  |
| minio.service.ports.api | int | `9000` |  |
| minio.service.ports.console | int | `9090` |  |
| minio.service.type | string | `"ClusterIP"` |  |
| postgresql.auth.database | string | `"admiral"` |  |
| postgresql.auth.password | string | `"shipitnow"` |  |
| postgresql.auth.postgresPassword | string | `"shipitnow"` |  |
| postgresql.auth.username | string | `"admiral"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.fullnameOverride | string | `"admiral-demo-postgresql"` |  |
| postgresql.primary.initdb.scriptsConfigMap | string | `"admiral-demo-postgres-init"` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| postgresql.primary.persistence.size | string | `"5Gi"` |  |
| temporal.admintools.enabled | bool | `false` |  |
| temporal.cassandra.enabled | bool | `false` |  |
| temporal.elasticsearch.enabled | bool | `false` |  |
| temporal.enabled | bool | `true` |  |
| temporal.grafana.enabled | bool | `false` |  |
| temporal.mysql.enabled | bool | `false` |  |
| temporal.postgresql.enabled | bool | `false` |  |
| temporal.prometheus.enabled | bool | `false` |  |
| temporal.schema.setup.enabled | bool | `true` |  |
| temporal.schema.update.enabled | bool | `true` |  |
| temporal.server.config.namespaces.create | bool | `true` |  |
| temporal.server.config.namespaces.namespace[0].name | string | `"default"` |  |
| temporal.server.config.namespaces.namespace[0].retention | string | `"3d"` |  |
| temporal.server.config.namespaces.namespace[1].name | string | `"admiral"` |  |
| temporal.server.config.namespaces.namespace[1].retention | string | `"7d"` |  |
| temporal.server.config.persistence.default.driver | string | `"sql"` |  |
| temporal.server.config.persistence.default.sql.database | string | `"temporal"` |  |
| temporal.server.config.persistence.default.sql.driver | string | `"postgres12"` |  |
| temporal.server.config.persistence.default.sql.host | string | `"admiral-demo-postgresql"` |  |
| temporal.server.config.persistence.default.sql.maxConnLifetime | string | `"1h"` |  |
| temporal.server.config.persistence.default.sql.maxConns | int | `20` |  |
| temporal.server.config.persistence.default.sql.password | string | `"shipitnow"` |  |
| temporal.server.config.persistence.default.sql.port | int | `5432` |  |
| temporal.server.config.persistence.default.sql.user | string | `"admiral"` |  |
| temporal.server.config.persistence.visibility.driver | string | `"sql"` |  |
| temporal.server.config.persistence.visibility.sql.database | string | `"temporal_visibility"` |  |
| temporal.server.config.persistence.visibility.sql.driver | string | `"postgres12"` |  |
| temporal.server.config.persistence.visibility.sql.host | string | `"admiral-demo-postgresql"` |  |
| temporal.server.config.persistence.visibility.sql.maxConnLifetime | string | `"1h"` |  |
| temporal.server.config.persistence.visibility.sql.maxConns | int | `20` |  |
| temporal.server.config.persistence.visibility.sql.password | string | `"shipitnow"` |  |
| temporal.server.config.persistence.visibility.sql.port | int | `5432` |  |
| temporal.server.config.persistence.visibility.sql.user | string | `"admiral"` |  |
| temporal.server.replicaCount | int | `1` |  |
| temporal.web.enabled | bool | `false` |  |

## Configuration Examples

### Expose Admiral with Ingress

```yaml
admiral-server:
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

### Enable Persistence

By default, persistence is disabled for easy testing. To enable:

```yaml
postgresql:
  primary:
    persistence:
      enabled: true
      size: 10Gi

minio:
  persistence:
    enabled: true
    size: 10Gi
```

### Customize Demo Users

Add or modify users in the Keycloak configuration:

```yaml
keycloak:
  keycloakConfigCli:
    configuration:
      master-realm.json: |
        {
          "realm": "master",
          "users": [
            {
              "username": "custom.user",
              "enabled": true,
              "email": "custom@example.com",
              "credentials": [{
                "type": "password",
                "value": "custompassword"
              }]
            }
          ]
        }
```

## Demo Environment Details

### Service Endpoints

| Service | Internal Endpoint | Default Credentials |
|---------|------------------|-------------------|
| Admiral Server | admiral-demo-admiral-server:8080 | Via Keycloak |
| PostgreSQL | admiral-demo-postgresql:5432 | admiral / shipitnow |
| Keycloak | admiral-demo-keycloak:8080 | admiral / shipitnow |
| MinIO | admiral-demo-minio:9000 | admiral / shipitnow |
| Temporal | admiral-demo-temporal-frontend:7233 | N/A |

### Pre-configured Resources

1. **Databases Created**:
   - `admiral` - Main Admiral database
   - `keycloak` - Keycloak configuration
   - `temporal` - Temporal persistence
   - `temporal_visibility` - Temporal visibility

2. **MinIO Buckets**:
   - `manifests` - Application manifests storage
   - `revisions` - Deployment revisions storage

3. **Keycloak Configuration**:
   - Realm: `master`
   - Client: `admiral` (with secret: `admiral-demo-client-secret`)
   - Three demo users with full access

4. **Temporal Namespaces**:
   - `default` - 3 day retention
   - `admiral` - 7 day retention

## Troubleshooting

### Services Not Starting

Check pod status and logs:

```bash
kubectl get pods -n admiral-demo
kubectl logs -n admiral-demo <pod-name>
```

### Database Connection Issues

Ensure PostgreSQL is fully initialized:

```bash
kubectl logs -n admiral-demo admiral-demo-postgresql-0
```

### Keycloak Initialization

Keycloak configuration happens after startup. Check the config-cli job:

```bash
kubectl logs -n admiral-demo -l job-name=admiral-demo-keycloak-config-cli
```

### Reset Demo Environment

To completely reset the demo:

```bash
helm uninstall admiral-demo
kubectl delete pvc -n admiral-demo --all
helm install admiral-demo admiral/admiral-demo
```

## Security Notice

This chart uses hardcoded demo credentials and is configured for ease of use, not security:

- All services use simple passwords
- No TLS between services
- Minimal security policies
- Public client secrets

**Never expose this deployment to the internet or use in production.**

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

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | keycloak | 24.8.x |
| https://charts.bitnami.com/bitnami | minio | 17.0.x |
| https://charts.bitnami.com/bitnami | postgresql | 16.7.x |
| https://temporalio.github.io/helm-charts | temporal | 0.64.x |