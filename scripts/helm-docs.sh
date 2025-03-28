#!/usr/bin/env bash
set -eux
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo "$REPO_ROOT"

echo "Running Helm-Docs"
docker run \
    -v "$REPO_ROOT:/helm-docs" \
    -u $(id -u) \
    jnorwood/helm-docs:v1.14.2
