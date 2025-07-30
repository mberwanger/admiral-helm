# Admiral Demo Helm Chart

A comprehensive Helm chart for quickly provisioning Admiral with all required dependencies in a Kubernetes cluster. This chart is designed for demo, testing, and evaluation purposes.

## Overview

The Admiral Demo chart packages together:
- **Admiral Server** - The main Admiral API server
- **Admiral Controller** - Kubernetes controller for Admiral resources
- **Admiral Worker** - Background job workers
- **PostgreSQL** - Primary database for Admiral and Temporal
- **Keycloak** - Authentication and authorization server
- **Temporal** - Workflow orchestration platform
- **MinIO** - S3-compatible object storage

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- kubectl configured to access your cluster
- Ingress controller (optional, for external access)

## Quick Start

1. Add the Bitnami repository (for dependencies):
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add temporal https://temporalio.github.io/helm-charts
helm repo update
```

2. Install the chart:
```bash
helm install admiral-demo ./charts/admiral-demo --namespace admiral-demo --create-namespace
```

3. Wait for all pods to be ready:
```bash
kubectl get pods -n admiral-demo -w
```

4. Access the services (if ingress is enabled):
- Admiral Server: http://admiral.admiral-demo.local
- Keycloak Admin: http://keycloak.admiral-demo.local
- Temporal Web UI: http://temporal.admiral-demo.local
- MinIO Console: http://minio-console.admiral-demo.local

## Configuration

### Key Configuration Options

| Parameter | Description | Default |
|-----------|-------------|---------|
| `admiral-server.enabled` | Enable Admiral Server | `true` |
| `admiral-controller.enabled` | Enable Admiral Controller | `true` |
| `admiral-worker.enabled` | Enable Admiral Worker | `true` |
| `postgresql.enabled` | Enable PostgreSQL | `true` |
| `keycloak.enabled` | Enable Keycloak | `true` |
| `temporal.enabled` | Enable Temporal | `true` |
| `minio.enabled` | Enable MinIO | `true` |

### Default Credentials

**⚠️ WARNING: Change these in production!**

- **Keycloak Admin**: admin / admin-demo-password
- **Demo User**: demo-user / demo-password
- **PostgreSQL**: admiral / admiral-demo-password
- **MinIO**: minioadmin / minioadmin

### Custom Values

Create a custom values file:
```yaml
# custom-values.yaml
admiral-server:
  replicaCount: 2
  resources:
    limits:
      cpu: 1000m
      memory: 1Gi

postgresql:
  auth:
    password: my-secure-password

keycloak:
  auth:
    adminPassword: my-secure-admin-password
```

Install with custom values:
```bash
helm install admiral-demo ./charts/admiral-demo -f custom-values.yaml
```

## Local Development

### Using Port Forwarding

If you don't have an ingress controller, you can use port forwarding:

```bash
# Admiral Server
kubectl port-forward -n admiral-demo svc/admiral-demo-admiral-server 8080:8080

# Keycloak
kubectl port-forward -n admiral-demo svc/admiral-demo-keycloak 8081:8080

# Temporal Web UI
kubectl port-forward -n admiral-demo svc/admiral-demo-temporal-web 8082:8088

# MinIO Console
kubectl port-forward -n admiral-demo svc/admiral-demo-minio 9001:9001
```

### Using /etc/hosts

Add these entries to your `/etc/hosts` file:
```
127.0.0.1 admiral.admiral-demo.local
127.0.0.1 keycloak.admiral-demo.local
127.0.0.1 temporal.admiral-demo.local
127.0.0.1 minio.admiral-demo.local
127.0.0.1 minio-console.admiral-demo.local
```

## Monitoring

The chart includes optional monitoring configurations:

```yaml
postgresql:
  metrics:
    enabled: true
    serviceMonitor:
      enabled: true

temporal:
  prometheus:
    enabled: true
  grafana:
    enabled: true
```

## Troubleshooting

### Check Pod Status
```bash
kubectl get pods -n admiral-demo
kubectl describe pod <pod-name> -n admiral-demo
kubectl logs <pod-name> -n admiral-demo
```

### Common Issues

1. **Pods stuck in Pending**: Check PVC status and storage class availability
2. **Init containers failing**: Check database connectivity and credentials
3. **Ingress not working**: Verify ingress controller is installed and DNS is configured

### Database Connection Issues
```bash
# Test PostgreSQL connection
kubectl run -it --rm --restart=Never postgres-client \
  --image=postgres:15-alpine \
  --namespace=admiral-demo \
  -- psql -h admiral-demo-postgresql -U admiral -d admiral
```

## Uninstall

To remove the chart:
```bash
helm uninstall admiral-demo -n admiral-demo
kubectl delete namespace admiral-demo
```

## Production Considerations

This chart is designed for demo purposes. For production use:

1. **Security**:
   - Change all default passwords
   - Enable TLS/SSL for all services
   - Configure network policies
   - Use external secret management

2. **High Availability**:
   - Increase replica counts
   - Configure pod disruption budgets
   - Enable database replication
   - Use persistent storage with appropriate backup strategies

3. **Resource Management**:
   - Set appropriate resource requests and limits
   - Configure horizontal pod autoscaling
   - Monitor resource usage

4. **External Dependencies**:
   - Consider using managed services (RDS, managed Keycloak, etc.)
   - Configure proper backup and disaster recovery

## Support

For issues and feature requests, please visit: https://github.com/martbhell/admiral-helm/issues