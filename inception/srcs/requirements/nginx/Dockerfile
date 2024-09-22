FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install nginx openssl -y


RUN mkdir -p /etc/nginx/ssl/

RUN openssl req \
    -x509 -nodes \
    -out /etc/nginx/ssl/certificate \
    -keyout /etc/nginx/ssl/private_key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=svan-de-.42.fr/UID=svan-de-"


COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/error.html /var/www/html/error.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]