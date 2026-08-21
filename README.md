````markdown
# 🚛 Cargo Truck — Cloud Native Logistics Platform

## 📌 Sobre o projeto

O **Cargo Truck** é uma plataforma de gerenciamento logístico desenvolvida com foco em arquitetura moderna de software e práticas **DevOps**.

O objetivo do projeto é criar uma aplicação completa para gerenciamento de cargas, utilizando tecnologias atuais de desenvolvimento, integração contínua, infraestrutura como código e automação de servidores.

Além da aplicação web, o projeto tem como finalidade demonstrar um fluxo DevOps completo envolvendo:

- Desenvolvimento Full Stack;
- Containerização com Docker;
- Pipeline CI/CD;
- Provisionamento de infraestrutura com Terraform na AWS.

---

## 🎯 Objetivo

Construir uma solução logística onde os usuários possam:

- Cadastrar cargas;
- Visualizar cargas cadastradas;
- Consultar detalhes de uma carga;
- Atualizar informações;
- Remover cargas;
- Acompanhar o status do transporte.

O projeto também serve como demonstração prática de uma arquitetura preparada para ambientes de produção.

---

## 🏗️ Arquitetura da aplicação

```text
                    Usuário
                       │
                       ▼
                Frontend (React)
                       │
                       ▼
               API REST (Rust + Axum)
                       │
                       ▼
              PostgreSQL Database
````

### Arquitetura DevOps

```text
                 GitHub Repository
                        │
                        ▼
                  GitHub Actions
                        │
                        ▼
                   Docker Images
                        │
                        ▼
                Deploy Automatizado
                        │
                        ▼
                  Terraform (AWS)
                        │
                        ▼
                   Ambiente Cloud
```

---

## 🛠️ Tecnologias utilizadas

### Frontend

```text
React
TypeScript
Vite
Tailwind CSS
Axios
React Router
```

Responsável pela interface do usuário e pela comunicação com a API REST.

### Backend

```text
Rust
Axum
Tokio
Serde
SQLx
dotenvy
```

Responsável pela API REST, regras de negócio e processamento das cargas.

### Banco de dados

```text
PostgreSQL
SQLx Migrations
```

Os dados das cargas são persistidos no PostgreSQL.

As migrations são responsáveis por versionar o banco de dados e manter sua estrutura consistente entre diferentes ambientes.

### Infraestrutura e DevOps

```text
Docker
Docker Compose
Terraform
AWS
GitHub Actions
```

A infraestrutura principal é provisionada como código utilizando **Terraform**, incluindo:

* VPC;
* Security Group;
* Instância EC2.

Dessa forma, o ambiente pode ser reproduzido sem depender de configuração manual do servidor.

---

## 📂 Estrutura do projeto

```text
cargo-truck/
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── routes/
│   │   ├── services/
│   │   └── types/
│   │
│   └── ...
│
├── backend/
│   ├── migrations/
│   ├── src/
│   │   ├── database/
│   │   ├── handlers/
│   │   ├── models/
│   │   ├── routes/
│   │   └── main.rs
│   │
│   └── .env.example
│
├── terraform/
│
├── .github/
│   └── workflows/
│
└── README.md
```

---

# 🚀 Funcionalidades atuais

## Backend

API REST com persistência em PostgreSQL.

### Listar cargas

```http
GET /cargos
```

Retorna todas as cargas cadastradas.

### Criar carga

```http
POST /cargos
```

Exemplo de requisição:

```json
{
  "origem": "Belém",
  "destino": "São Paulo",
  "peso": 1000,
  "volume": 20,
  "status": "in_transit"
}
```

### Status disponíveis

```text
pending
in_transit
delivered
```

### Buscar carga

```http
GET /cargos/{id}
```

Retorna os dados de uma carga específica.

### Atualizar carga

```http
PUT /cargos/{id}
```

Atualiza as informações de uma carga existente.

### Remover carga

```http
DELETE /cargos/{id}
```

Remove uma carga cadastrada.

---

# 📋 Pré-requisitos

Antes de executar o projeto, certifique-se de possuir:

```text
Git
Node.js 22+
npm
Rust
Cargo
PostgreSQL
SQLx CLI
```

Para trabalhar com a infraestrutura em nuvem, também é necessário possuir:

```text
AWS CLI
Terraform
Credenciais AWS configuradas
```

---

# 💻 Executando o projeto

## 1. Clone o repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd cargo-truck
```

---

## 2. Configure o banco de dados

Entre na pasta do backend:

```bash
cd backend
```

Crie um arquivo `.env`:

```env
DATABASE_URL=postgres://usuario:senha@localhost:5432/cargo_truck
```

Execute as migrations:

```bash
sqlx migrate run
```

Para verificar o status das migrations:

```bash
sqlx migrate info
```

---

## 3. Execute o Backend

Ainda dentro da pasta `backend`:

```bash
cargo build
```

Execute a aplicação:

```bash
cargo run
```

A API estará disponível em:

```text
http://127.0.0.1:3000
```

---

## 4. Execute o Frontend

Abra outro terminal e entre na pasta `frontend`:

```bash
cd frontend
```

Instale as dependências:

```bash
npm install
```

Execute o projeto:

```bash
npm run dev
```

A aplicação estará disponível em:

```text
http://localhost:5173
```

Caso a API esteja hospedada em outro endereço, crie um arquivo `.env.local`:

```env
VITE_API_URL=http://127.0.0.1:3000
```

---

## 5. Infraestrutura com Terraform

O Terraform é responsável pelo provisionamento da infraestrutura na AWS, incluindo:

* VPC;
* Security Group;
* Instância EC2.

Para iniciar o Terraform:

```bash
cd terraform
terraform init
```

Para visualizar o plano de execução:

```bash
terraform plan
```

Para provisionar a infraestrutura:

```bash
terraform apply
```

Para mais detalhes sobre a infraestrutura, consulte:

```text
terraform/README.md
```

---

# 🔄 Roadmap DevOps

## ✅ Aplicação

* [x] Frontend React
* [x] Backend Rust
* [x] API REST
* [x] CRUD de cargas
* [x] Integração Frontend + Backend

## ✅ Banco de Dados

* [x] PostgreSQL
* [x] SQLx Migrations
* [x] Persistência dos dados

## ✅ Containerização

* [x] Dockerfile do Frontend
* [x] Dockerfile do Backend
* [x] Docker Compose
* [x] Integração entre containers

## ✅ CI/CD

* [x] GitHub Actions
* [x] Testes automatizados
* [x] Build automático
* [x] Publicação de imagens Docker
* [x] Deploy automatizado

## ✅ Infraestrutura como Código

* [x] Terraform
* [x] Provisionamento na AWS
* [x] VPC
* [x] Security Group
* [x] EC2
* [x] Ambiente versionado e reproduzível

---

# 📊 Visão DevOps

O Cargo Truck busca aplicar princípios modernos de **DevOps** e **Cloud Native**, incluindo:

* Automação de processos;
* Integração Contínua (CI);
* Entrega Contínua (CD);
* Infraestrutura como Código (IaC);
* Containerização;
* Padronização de ambientes;
* Escalabilidade;
* Reprodutibilidade;
* Automação de deploy;
* Preparação para ambientes de produção.

Mais do que uma aplicação logística, o **Cargo Truck** funciona como um laboratório prático para demonstrar o ciclo completo de desenvolvimento, entrega e operação de software em ambientes **Cloud Native**.

---

# 👨‍💻 Equipe

* Anderson
* André Moraes
* Andressa
* Joyce
* Katherine

---

# 📄 Licença

Projeto desenvolvido para fins educacionais e de demonstração de práticas modernas de **Engenharia de Software, DevOps e Cloud Native**.

```
```
