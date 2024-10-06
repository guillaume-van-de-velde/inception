FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y wget docker.io tar

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://github.com/portainer/portainer/releases/download/2.21.2/portainer-2.21.2-linux-amd64.tar.gz

RUN tar -xzf portainer-2.21.2-linux-amd64.tar.gz

RUN rm portainer-2.21.2-linux-amd64.tar.gz

CMD ["/var/www/html/portainer/portainer", "-H", "unix:///var/run/docker.sock"]
