FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y wget

COPY conf/adminer.sh /home/adminer.sh

RUN chmod +x /home/adminer.sh

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

ENTRYPOINT ["/home/adminer.sh"]