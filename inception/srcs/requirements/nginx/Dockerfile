FROM debian:bullseye

RUN apt update -y

RUN apt upgrade -y

RUN apt install nginx -y

RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req \
    -x509 -nodes \
    -out /etc/nginx/ssl/certificate \
    -keyout /etc/nginx/ssl/private_key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=svan-de-.42.fr/UID=svan-de-"

COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./config/error.html /var/www/html/error.html

CMD ["nginx", "-g", "daemon off;"]