# Dockerfile

# Estágio 1: Build
FROM node:20-slim 

# Definir diretório de trabalho
WORKDIR /app

# Copiar ficheiros de dependências
COPY package*.json ./

# Instalar dependências (incluindo devDependencies para desenvolvimento)
RUN npm ci --omit=dev

# Copiar o resto do código
COPY . .

# Estágio 2: Produção (opcional, mas recomendado)
FROM node:18-alpine

# Instalar ferramentas úteis (opcional)
RUN apk add --no-cache curl

# Definir diretório de trabalho
WORKDIR /app

# Copiar dependências do estágio builder
COPY . .

# Expor a porta da aplicação
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "src/app.js"]
