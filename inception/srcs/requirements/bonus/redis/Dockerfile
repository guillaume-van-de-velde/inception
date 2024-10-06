FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y redis

ENTRYPOINT ["redis-server", "--protected-mode no"]