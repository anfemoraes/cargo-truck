#!/bin/bash
set -euxo pipefail

# Atualiza pacotes e instala dependencias basicas
apt-get update -y
apt-get install -y ca-certificates curl gnupg git

# Instala o Docker Engine + plugin do Docker Compose (repositorio oficial)
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  > /etc/apt/sources.list.d/docker.list

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

# Clona o repositorio da aplicacao (contem o docker-compose.yml)
APP_DIR=/opt/${project_name}
mkdir -p "$APP_DIR"
git clone ${docker_compose_repo} "$APP_DIR" || (cd "$APP_DIR" && git pull)

cd "$APP_DIR"

# Sobe a stack (db + backend + frontend) em background.
# O override de producao publica o frontend na porta 80 (ao inves da 5173 usada em dev local).
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
