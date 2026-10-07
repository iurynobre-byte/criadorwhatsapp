# Usa a imagem oficial do Node.js 22 recomendada pelas diretrizes
FROM node:22-alpine AS builder

WORKDIR /app

# Copia arquivos de dependência
COPY package*.json ./

# Instala todas as dependências
RUN npm ci || npm install

# Copia o restante do código
COPY . .

# Compila o projeto (Vite build)
RUN npm run build

# Etapa de execução com Nginx para servir o site estático
FROM nginx:alpine

# Copia o resultado do build do Vite para a pasta do Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
