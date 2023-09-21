# sealed-secrets
Kubernetes secret management via sealed-secrets

## Base Chart
https://github.com/bitnami/charts/tree/main/bitnami/sealed-secrets

## Installation
```bash
helm install sealed-secrets -n kube-system -f values.yaml oci://registry-1.docker.io/bitnamicharts/sealed-secrets
```