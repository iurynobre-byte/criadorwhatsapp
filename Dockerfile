FROM nginx:alpine

# Copia todos os ficheiros estáticos para o servidor Web Nginx
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
