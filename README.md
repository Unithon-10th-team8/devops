# devops
gitops &amp; infrastructure repository

## Folder Information
- `app` - Base GitOps repository for application deployment
- `deployment` - Base GitOps repository for ArgoCD deployment
- `terraform` - Base Terraform repository for infrastructure provisioning
- `kubernetes` - Base Kubernetes repository for Kubernetes configuration

## Infrastructure
- Kubernetes (Vultr Kubernetes Engine)
- Terraform

## CI/CD Pipeline
- Trigger : Git Commit
- CI : GitHub Actions
- Container Registry : Docker Hub
- CD : ArgoCD

## Tools
### Sealed Secrets
convert environment variables to kubernetes secrets (sealed secrets)
```bash
envto --source ~/PycharmProjects/backend/secrets/.env
```