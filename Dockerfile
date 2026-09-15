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
# Expor a porta da aplicação
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "src/app.js"]
