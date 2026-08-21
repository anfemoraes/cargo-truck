🚛 Cargo Truck — Cloud Native Logistics Platform
📌 Sobre o projeto

O Cargo Truck é uma plataforma de gerenciamento logístico desenvolvida com foco em arquitetura moderna de software e práticas DevOps.

O objetivo do projeto é criar uma aplicação completa para gerenciamento de cargas, utilizando tecnologias atuais de desenvolvimento, integração contínua, infraestrutura como código e automação de servidores.

Além da aplicação web, o projeto tem como finalidade demonstrar um fluxo DevOps completo envolvendo:

    Desenvolvimento Full Stack;
    Containerização com Docker;
    Pipeline CI/CD;
    Provisionamento de infraestrutura com Terraform na AWS.

🎯 Objetivo

Construir uma solução logística onde usuários possam:

    Cadastrar cargas;
    Visualizar cargas cadastradas;
    Consultar detalhes;
    Atualizar informações;
    Remover cargas;
    Acompanhar o status do transporte.

O projeto também serve como demonstração prática de uma arquitetura preparada para ambientes de produção.
🏗️ Arquitetura da aplicação

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

Arquitetura DevOps:

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

🛠️ Tecnologias utilizadas
Frontend

    React
    TypeScript
    Vite
    Tailwind CSS
    Axios
    React Router

Responsável pela interface do usuário e comunicação com a API.
Backend

    Rust
    Axum
    Tokio
    Serde
    SQLx
    dotenvy

Responsável pela API REST, regras de negócio e processamento das cargas.
Banco de dados

    PostgreSQL
    SQLx Migrations

Os dados das cargas são persistidos no PostgreSQL. As migrations são responsáveis por versionar o banco de dados e manter sua estrutura consistente entre diferentes ambientes.
Infraestrutura

    Docker · Docker Compose
    Terraform (provisionamento na AWS)
    GitHub Actions (CI/CD)

Toda a infraestrutura (VPC, Security Group, instância EC2) é provisionada como código via Terraform, sem configuração manual de servidor.
📂 Estrutura do projeto

cargo-truck/

├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── routes/
│   │   ├── services/
│   │   └── types/
│
├── backend/
│   ├── migrations/
│   ├── src/
│   │   ├── database/
│   │   ├── handlers/
│   │   ├── models/
│   │   ├── routes/
│   │   └── main.rs
│   └── .env.example
│
├── terraform/
├── .github/
│   └── workflows/
│
└── README.md

🚀 Funcionalidades atuais
Backend

API REST com persistência em PostgreSQL.
Listar cargas

GET /cargos

Retorna todas as cargas cadastradas.
Criar carga

POST /cargos

Exemplo:

{
  "origem": "Belém",
  "destino": "São Paulo",
  "peso": 1000,
  "volume": 20,
  "status": "in_transit"
}

Status disponíveis:

    pending
    in_transit
    delivered

Buscar carga

GET /cargos/{id}

Atualizar carga

PUT /cargos/{id}

Remover carga

DELETE /cargos/{id}

📋 Pré-requisitos

Antes de executar o projeto, certifique-se de possuir:

    Git
    Node.js (22 ou superior)
    npm
    Rust (Cargo)
    PostgreSQL
    SQLx CLI

💻 Executando o projeto
1. Clone o repositório

git clone <URL_DO_REPOSITORIO>
cd cargo-truck

2. Configurando o banco

Crie um arquivo .env dentro da pasta backend.

DATABASE_URL=postgres://usuario:senha@localhost:5432/cargo_truck

Execute as migrations:

cd backend
sqlx migrate run

Para verificar o status das migrations:

sqlx migrate info

3. Executando o Backend

Entre na pasta:

cd backend

Compile o projeto:

cargo build

Execute a aplicação:

cargo run

API disponível em:

http://127.0.0.1:3000

4. Executando o Frontend

Em outro terminal:

cd frontend

Instale as dependências:

npm install

Execute:

npm run dev

Aplicação disponível em:

http://localhost:5173

Caso a API esteja em outro endereço, crie um arquivo .env.local:

VITE_API_URL=http://127.0.0.1:3000

5. Infraestrutura (Terraform)

Provisiona a VPC, Security Group e instância EC2 na AWS. Veja o passo a passo completo em terraform/README.md.

cd terraform
terraform init
terraform apply

🔄 Roadmap DevOps
✅ Aplicação

    Frontend React
    Backend Rust
    API REST
    CRUD de cargas
    Integração Frontend + Backend

✅ Banco de Dados

    PostgreSQL
    SQLx Migrations
    Persistência dos dados

✅ Containerização

    Dockerfile (Frontend)
    Dockerfile (Backend)
    Docker Compose
    Containers integrados

✅ CI/CD

    GitHub Actions
    Testes automatizados
    Build automático
    Publicação de imagens Docker
    Deploy automatizado

✅ Infraestrutura como Código

    Terraform
    Provisionamento na AWS (VPC, Security Group, EC2)
    Ambiente versionado e reproduzível

📊 Visão DevOps

Este projeto busca aplicar princípios modernos de DevOps, como:

    Automação de processos;
    Integração Contínua (CI);
    Entrega Contínua (CD);
    Infraestrutura como Código (IaC);
    Padronização de ambientes;
    Escalabilidade;
    Reprodutibilidade;
    Preparação para ambientes de produção.

Mais do que uma aplicação logística, o Cargo Truck é um laboratório prático para demonstrar o ciclo completo de desenvolvimento, entrega e operação de software em ambientes Cloud Native.
👨‍💻 Equipe

Anderson · André Moraes · Andressa · Joyce · Katherine
📄 Licença

Projeto desenvolvido para fins educacionais e de demonstração de práticas modernas de Engenharia de Software, DevOps e Cloud Native.
