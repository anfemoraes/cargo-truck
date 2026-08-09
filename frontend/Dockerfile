# Estágio 1: Build da aplicação React + TypeScript + Vite usando Node.js
FROM node:20-alpine AS build

WORKDIR /app

# Copia os arquivos de dependências
COPY package*.json ./

# Instala as dependências do projeto
RUN npm ci

# Copia o restante do código-fonte e compila para produção
COPY . .
RUN npm run build

# Estágio 2: Servidor Web Nginx para servir os arquivos estáticos compilados
FROM nginx:alpine

# Copia a configuração customizada do Nginx para tratar rotas SPA
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia os arquivos compilados do estágio de build para o diretório estático do Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Expõe a porta padrão do Nginx
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]