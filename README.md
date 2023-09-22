# devops
Unithon 10기 Team 8 DevOps Repository

## 폴더 구조
- `app` - ArgoCD를 통해 배포되는 쿠버네티스 애플리케이션 매니페스트 폴더
- `deployment` - ArgoCD에 배포되는 CRD 매니페스트 폴더
- `kubernetes` - 쿠버네티스 클러스터 내에 배포되는 공통 애플리케이션 Helm Values 폴더
- `terraform` - 인프라 프로비저닝을 위한 Terraform 폴더

## 인프라 구성
- Main Cloud Provider : Vultr
- CDN : Cloudflare
- DNS : Cloudflare
- CI/CD : GitHub Actions / ArgoCD
- Container Registry : Docker Hub
- Kubernetes : Vultr Kubernetes Engine
- Database : PostgreSQL (In-Cluster)
- IaC : Terraform (Local)
- Monitoring : Prometheus & Grafana
- Logging : Loki & Grafana & Promtail
- Alerting : Grafana Alertmanager
- Secret Management : Sealed Secrets
- Ingress : Nginx Ingress Controller
- TLS : Cert Manager
- Internal Authentication : Cloudflare Access

## Tools for Developers
### 로그/메트릭 확인
- 애플리케이션의 로그와 메트릭은 Grafana에서 확인할 수 있습니다.
- 주소 : https://grafana.haenu.dev
- 로그인은 GitHub 계정을 이용하면 됩니다.
- 자세한 사용법은 Notion을 확인해주세요.

### 배포 상태 확인
- 애플리케이션별 배포 상태는 ArgoCD에서 확인할 수 있습니다.
- 주소 : https://argo.haenu.dev
- 로그인은 GitHub 계정을 이용하면 됩니다.
- 자세한 사용법은 Notion을 확인해주세요.

### 데이터베이스 접속
- 데이터베이스는 PostgreSQL을 사용합니다.
- Primary 1대, Read Replica 1대로 구성되어 있습니다.
- 접속 정보는 DevOps쪽으로 요청 주시면 제공해드립니다.
- 기본 접속 정보
  - External Host (Only Primary) : `db.unithon.haenu.dev`
  - Internal Host (Primary) : `postgresql-primary.db`
  - Internal Host (Read Replica) : `postgresql-read.db`
- 외부 주소로 접속할 경우, IP Whitelist 등록이 필요합니다. DevOps쪽으로 요청 주시면 등록해드립니다.
- 클러스터 내에 배포된 앱의 경우 내부 주소로 접근하는 것을 권장합니다.

### 환경변수 관리
환경변수는 DevOps쪽으로 요청 주시면 추가해드립니다.

## Tools for DevOps
### ArgoCD
- ArgoCD에 앱을 추가할 때는 UI 이용을 지양하고, `development` 폴더에 CRD 매니페스트를 추가해주세요.
- 앱을 추가한 뒤에는 잊지 말고 git에 커밋해주세요.
- Prune 옵션은 Off 설정을 기본으로 합니다. 제한적으로 필요한 경우에만 On으로 설정해주세요.

### Terraform
- Terraform은 로컬 백엔드를 사용합니다. `.gitignore` 폴더를 참고하여 커밋되면 안되는 파일이 git에 올라가지 않도록 주의해주세요.
- Terraform은 Provider 별로 `terraform` 폴더 밑에 하위 폴더를 만들어서 관리합니다.

### Helm
- Helm은 `kubernetes` 폴더 밑에 하위 폴더를 만들어서 관리합니다.
- 앱별로 하위 폴더를 만들고, `values.yaml` 파일을 만들어서 관리합니다.
- 배포된 앱에 대해서는 어떤 차트를 사용했는지 등을 README.md에 기록해주세요.

### Sealed Secrets
- 환경변수는 Sealed Secrets를 통해 관리합니다.
- 로컬에 kubeseal을 설치하고, [dotenv-to-sealed-secrets](https://github.com/dokdo2013/dotenv-to-sealed-secrets)를 이용하면 편하게 관리할 수 있습니다.

### Internal Authentication
- Cloudflare Access를 통해 인증을 관리합니다.
- 이건 따로 IaC로 관리하지 않습니다. Cloudflare에서 직접 설정해주세요.
- 내부 접근만 허용하는 앱은 Cloudflare Access를 걸어주고, 앱 설정에서 인증 기능을 비활성화 해주세요. (중복 인증 방지)

