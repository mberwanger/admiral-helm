# Helm Chart Best Practices

This document outlines the Helm best practices that should be followed for the Admiral chart, based on the official Helm documentation.

## 1. Conventions

### Chart Naming
- ✅ **Use lowercase letters and numbers only**
- ✅ **Use dashes to separate words** (no underscores or dots)
- ✅ **Follow semantic versioning (SemVer 2)**

**Examples:**
- ✅ Good: `admiral`, `nginx-lego`, `aws-cluster-autoscaler`
- ❌ Bad: `Admiral`, `nginx_lego`, `aws.cluster.autoscaler`

### File Organization
- ✅ **Use `.yaml` extension for YAML output files**
- ✅ **Use `.tpl` for non-formatted template files**
- ✅ **Use dashed notation for filenames** (e.g., `my-example-configmap.yaml`)
- ✅ **Each resource definition in its own template file**
- ✅ **Filenames should reflect the resource kind**

### YAML Formatting
- ✅ **Indent using two spaces (never tabs)**
- ✅ **Add whitespace around template directives** (`{{ .foo }}` not `{{.foo}}`)

## 2. Values Configuration

### Naming Conventions
- ✅ **Use camelCase for variable names**
- ✅ **Start variable names with lowercase letters**
- ✅ **Avoid hyphens and initial capital letters**

**Examples:**
```yaml
# ✅ Correct
chickenNoodleSoup: true
serverHost: "localhost"
serverPort: 8080

# ❌ Incorrect  
Chicken: true
chicken-noodle-soup: true
```

### Structure Design
- ✅ **Prefer flat configuration over deeply nested structures**
- ✅ **Use nested structures only when there are many related variables**
- ✅ **Make values easy to override with `--set`**
- ✅ **Use maps instead of lists for better `--set` compatibility**

### Type Handling
- ✅ **Explicitly quote string values**
- ✅ **Be careful with type coercion**
- ✅ **Consider storing integers as strings and converting in templates**

### Documentation
- ✅ **Document each property in values.yaml**
- ✅ **Start each comment with the property name**
- ✅ **Provide clear, one-sentence descriptions**

**Example:**
```yaml
# serverHost is the host name for the webserver
serverHost: example
# serverPort is the HTTP listener port for the webserver  
serverPort: 9191
```

## 3. Templates

### Template Structure
- ✅ **Use `.yaml` extension for YAML output files**
- ✅ **Use `.tpl` for helper templates**
- ✅ **Each resource definition in its own template file**
- ✅ **Namespace all defined template names**

**Examples:**
```yaml
# ✅ Correct
{{- define "admiral.fullname" -}}

# ❌ Incorrect
{{- define "fullname" -}}
```

### Formatting
- ✅ **Use two spaces for indentation**
- ✅ **Add whitespace around template directives**
- ✅ **Minimize whitespace in generated templates**
- ✅ **Chomp whitespace where possible**

### Commenting
- ✅ **Use `{{- /* */ -}}` for template comments**
- ✅ **Use `#` for YAML comments visible during debugging**

## 4. Dependencies

### Version Management
- ✅ **Prefer version ranges over exact version pinning**
- ✅ **Use patch-level version matching** (`version: ~1.2.3`)
- ✅ **For pre-release versions, use** (`version: ~1.2.3-0`)

### Repository URLs
- ✅ **Prioritize `https://` URLs**
- ✅ **Use repository names as aliases when possible**
- ✅ **Leave repository field blank only for local `charts` subdirectory**

### Optional Dependencies
- ✅ **Use conditions for optional dependencies** (`condition: somechart.enabled`)
- ✅ **Use shared tags for related optional dependencies**

**Example:**
```yaml
dependencies:
  - name: postgresql
    version: "15.5.x"
    repository: "https://charts.bitnami.com/bitnami"
    condition: postgresql.enabled
```

## 5. Labels and Annotations

### Standard Labels (Required)
- ✅ **`app.kubernetes.io/name`**: App name
- ✅ **`helm.sh/chart`**: Chart name and version
- ✅ **`app.kubernetes.io/managed-by`**: Set to `{{ .Release.Service }}`
- ✅ **`app.kubernetes.io/instance`**: Set to `{{ .Release.Name }}`

### Optional Labels
- ✅ **`app.kubernetes.io/version`**: App version
- ✅ **`app.kubernetes.io/component`**: Component role (e.g., "frontend")
- ✅ **`app.kubernetes.io/part-of`**: Top-level application

### Label Guidelines
- ✅ **Use labels for metadata used by Kubernetes for identification**
- ✅ **Use annotations for metadata not used for querying**
- ✅ **Helm hooks are always annotations**

## 6. Pods and Containers

### Images
- ✅ **Use fixed tags or image SHA, not floating tags**
- ✅ **Define images in values.yaml for easy customization**
- ✅ **Configure ImagePullPolicy in values.yaml**

**Example:**
```yaml
image:
  repository: "admiral/server"
  tag: "v1.2.3"  # ✅ Fixed tag, not "latest"
  pullPolicy: IfNotPresent
```

### PodTemplate Selectors
- ✅ **Always declare selectors in PodTemplates**
- ✅ **Ensure selector labels match template labels**

**Example:**
```yaml
selector:
  matchLabels:
    app.kubernetes.io/name: admiral
template:
  metadata:
    labels:
      app.kubernetes.io/name: admiral
```

## 7. RBAC

### Configuration Structure
- ✅ **Separate RBAC and ServiceAccount configurations**
- ✅ **Use boolean flags for resource creation**

**Example:**
```yaml
rbac:
  create: true
serviceAccount:
  create: true
  name: ""
```

### ServiceAccount Handling
- ✅ **Use helper template to determine ServiceAccount name**
- ✅ **Support both created and external ServiceAccounts**
- ✅ **Provide flexibility for multiple ServiceAccounts in complex charts**

## 8. Security Best Practices

### Pod Security
- ✅ **Use non-root containers**
- ✅ **Set read-only root filesystem**
- ✅ **Drop all capabilities**
- ✅ **Define security contexts**

### Secret Management
- ✅ **Store sensitive data in Kubernetes secrets**
- ✅ **Use environment variables for secret injection**
- ✅ **Avoid hardcoding secrets in templates**

## 9. Custom Resource Definitions (CRDs)

### CRD Management
- ✅ **Place CRDs in `crds/` directory for automatic installation**
- ✅ **Consider separate charts for CRD declaration and usage**
- ✅ **Understand CRD upgrade and deletion limitations**

### Important Notes
- ⚠️ **Helm does not support upgrading or deleting CRDs**
- ⚠️ **CRD registration can take a few seconds**
- ⚠️ **Use `--skip-crds` flag when needed**

## 10. Testing and Validation

### Chart Testing
- ✅ **Use `helm lint` to validate chart structure**
- ✅ **Use `helm template` to validate template rendering**
- ✅ **Test with different values combinations**
- ✅ **Validate generated YAML with kubectl**

### Documentation
- ✅ **Maintain comprehensive README.md**
- ✅ **Document all configuration options**
- ✅ **Provide examples for common use cases**
- ✅ **Include troubleshooting section**

## 11. Additional Industry Best Practices

### Chart Testing and Validation
- ✅ **Use Helm Schema plugin for configuration validation**
- ✅ **Include test pods in `templates/tests/`**
- ✅ **Validate chart with `helm lint`**
- ✅ **Auto-generate documentation with helm-docs**

### Advanced Configuration
- ✅ **Use ConfigMaps for application configuration**
- ✅ **Implement proper probe configuration**
- ✅ **Support named ports in services**
- ✅ **Provide persistence volume configuration**

**Health Probe Best Practices:**
```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: http
  initialDelaySeconds: 30
  periodSeconds: 10
readinessProbe:
  httpGet:
    path: /readyz
    port: http
  initialDelaySeconds: 5
  periodSeconds: 5
```

### File Organization Standards
- ✅ **Use resource type abbreviations** (e.g., `deploy.yaml`, `svc.yaml`)
- ✅ **Separate each resource type into individual files**
- ✅ **Use 2-space YAML indentation consistently**
- ✅ **Prefix template names with chart scope**

### Versioning and Updates
- ✅ **Follow SemVer principles strictly**
- ✅ **Align appVersion with deployed application version**
- ✅ **Use versioned container images (never `latest`)**
- ✅ **Support application upgrades**

### Documentation Excellence
- ✅ **Comprehensive README.md with examples**
- ✅ **Post-installation instructions in NOTES.txt**
- ✅ **Document all parameters with clear descriptions**
- ✅ **Auto-generate docs to stay in sync**

### Secret Management Best Practices
- ✅ **Use Kubernetes Secrets for sensitive data**
- ✅ **Avoid hardcoding secrets in templates**
- ✅ **Environment variable injection for secrets**
- ✅ **Consider external secret management tools**

## Admiral Chart Compliance Checklist

### Chart Structure ✅
- [x] Chart name follows conventions (`admiral`)
- [x] Files use proper extensions (`.yaml`, `.tpl`)
- [x] Each resource in separate file
- [x] Proper file naming conventions
- [x] 2-space YAML indentation
- [x] Resource type abbreviations where appropriate

### Values Configuration ✅
- [x] camelCase naming convention
- [x] Flat structure where appropriate
- [x] String values quoted
- [x] All values documented
- [x] Clear parameter descriptions

### Templates ✅  
- [x] Namespaced template names
- [x] Proper indentation and formatting
- [x] Standard labels implemented
- [x] Helper templates for common patterns
- [x] Named ports in services

### Dependencies ✅
- [x] Version ranges used (`15.5.x`)
- [x] HTTPS repository URLs
- [x] Conditional dependencies
- [x] Source repositories linked

### Security ✅
- [x] Non-root containers
- [x] Read-only root filesystem
- [x] Security contexts defined
- [x] Secret management implemented
- [x] Versioned container images (no `latest`)

### RBAC ✅
- [x] ServiceAccount creation configurable
- [x] Proper RBAC structure
- [x] Helper templates for names

### Health and Monitoring ✅
- [x] Liveness probes configured
- [x] Readiness probes configured
- [x] Proper initialDelaySeconds
- [x] Resource requests/limits defined

### Documentation ✅
- [x] Comprehensive README.md
- [x] NOTES.txt with post-install instructions
- [x] Parameter documentation
- [x] Usage examples provided

### Testing and Quality ✅
- [x] Passes helm lint
- [x] Installs with default values
- [x] Supports upgrades
- [x] ConfigMaps for configuration

This document serves as both a reference for best practices and a compliance checklist for the Admiral Helm chart.