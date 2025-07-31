# Admiral Demo Chart

A comprehensive demo environment for Admiral with all required dependencies.

## ⚠️ Installation Notice

**This installation will take approximately 5 minutes to complete.**

The chart provisions several complex components that require time to initialize:
- PostgreSQL database with initialization scripts
- Keycloak authentication server with user setup
- Temporal workflow engine
- MinIO object storage
- Admiral server and worker components

Please be patient during the initial deployment. You can monitor progress with:
```bash
kubectl get pods -w
```

## Quick Start

```bash
# Install with default values (uses release name as namespace prefix)  
helm install my-admiral-demo .

# Or specify a custom release name
helm install my-custom-name .
```

## What Gets Installed

- **PostgreSQL**: Shared database for all components
- **Keycloak**: Authentication with pre-configured users and OIDC client
- **Temporal**: Workflow orchestration engine  
- **MinIO**: S3-compatible object storage
- **Admiral Components**: Server and worker processes

## Default Credentials

After installation completes (≈5 minutes), you'll have access to:

- **Keycloak Admin**: `admiral` / `shipitnow`
- **Demo Users**: `john.doe@example.com`, `jane.smith@example.com`, `bob.wilson@example.com` (password: `password123`)
- **PostgreSQL**: `admiral` / `shipitnow`
- **MinIO**: `admiral` / `shipitnow`

## Monitoring Installation Progress

```bash
# Watch all pods come online
kubectl get pods -w

# Check specific component status
kubectl get pods -l app.kubernetes.io/name=postgresql
kubectl get pods -l app.kubernetes.io/name=keycloak  
kubectl get pods -l app.kubernetes.io/name=temporal
kubectl get pods -l app.kubernetes.io/name=minio

# Check for any failed jobs
kubectl get jobs
```

## Troubleshooting

If installation seems stuck:
1. **Check pod status**: `kubectl get pods`
2. **View logs**: `kubectl logs <pod-name>`
3. **Check events**: `kubectl get events --sort-by='.firstTimestamp'`

The most common issue is resource constraints - ensure your cluster has adequate CPU and memory.

## Configuration

See `values.yaml` for all configuration options. Key settings:

- Database credentials and connection details
- Keycloak authentication settings  
- Resource limits and requests
- Storage configuration

## Uninstall

```bash
helm uninstall my-admiral-demo
```

For more information, visit: https://admiral.io/docs