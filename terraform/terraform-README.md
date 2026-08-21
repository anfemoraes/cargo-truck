# Terraform — Cargo Truck

Provisiona a infraestrutura na AWS (VPC, Security Group, EC2) usada pelo
deploy automatizado. Está integrado ao workflow
`.github/workflows/ci-backend.yml`: a cada push em `dev`/`main`, o CI garante
que a infra existe (`terraform apply`) e depois faz o deploy via
`docker compose` na instância.

## 1. Bootstrap único: bucket S3 para o state

O Terraform precisa guardar seu "state" (o que já foi criado) em um lugar
que sobrevive entre execuções do CI. Crie o bucket **uma única vez**, na sua
máquina, antes do primeiro `apply` automatizado:

```bash
aws s3api create-bucket --bucket cargo-truck-tfstate-SEUNOME --region us-east-1
aws s3api put-bucket-versioning \
  --bucket cargo-truck-tfstate-SEUNOME \
  --versioning-configuration Status=Enabled
```

Troque `SEUNOME` por algo único (nomes de bucket S3 são globais). Depois,
edite `providers.tf` e descomente o bloco `backend "s3"`, ajustando o nome
do bucket. Rode `terraform init` localmente uma vez para migrar o state.

Sem esse passo, o CI ainda funciona (com state local por execução), mas
corre o risco de tentar recriar recursos que já existem a cada novo push.

## 2. Secrets necessários no GitHub

Em *Settings → Secrets and variables → Actions*, cadastre:

| Secret                  | Valor |
|--------------------------|-------|
| `AWS_ACCESS_KEY_ID`      | de um usuário IAM com permissão para EC2/VPC/SG |
| `AWS_SECRET_ACCESS_KEY`  | idem |
| `AWS_REGION`             | opcional, default `us-east-1` |
| `TF_SSH_PUBLIC_KEY`      | conteúdo de `cargo-truck-key.pub` |
| `TF_SSH_ALLOWED_CIDR`    | seu IP fixo para acesso manual, ex. `203.0.113.4/32` |
| `AWS_PRIVATE_KEY`        | conteúdo de `cargo-truck-key` (chave privada, sem senha) |

O IP do runner do GitHub Actions é liberado **temporariamente** a cada
deploy (autorizado antes do SSH, revogado logo depois) — não precisa abrir
a porta 22 pro mundo todo.

## 3. Uso manual (fora do CI)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## 4. Portas

O Security Group libera `80` (frontend) e `3000` (backend). O
`docker-compose.yml` publica o frontend em `5173` para desenvolvimento
local; em produção, o deploy usa `docker-compose.prod.yml` por cima para
remapear o frontend para a porta `80`.
