# cert-manager
Let's Encrypt certificates for Kubernetes Ingresses.

## Base Chart
https://github.com/bitnami/charts/tree/main/bitnami/cert-manager

## Installation
```bash
helm install cert-manager -n cert-manager -f values.yaml oci://registry-1.docker.io/bitnamicharts/cert-manager
```
