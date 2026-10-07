FROM node:22-alpine AS builder

WORKDIR /app

# Copia arquivos de dependência
COPY package*.json ./

# Instala as dependências usando npm install
RUN npm install

# Copia o restante do código
COPY . .

# Compila o projeto (Vite build)
RUN npm run build

# Etapa de execução com Nginx
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
