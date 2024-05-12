FROM debian:bullseye

RUN apt update -y

RUN apt upgrade -y

RUN apt install mariadb-server mariadb-client -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sql /home/script.sql

EXPOSE 3306

RUN service mariadb start \
    && until mysqladmin ping &>/dev/null; do \
           sleep 1; \
       done \
    && mariadb -u root --socket=/run/mysqld/mysqld.sock --port=3306 < /home/script.sql