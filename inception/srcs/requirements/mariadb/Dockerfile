FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server mariadb-client -y


COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sh /home/script.sh

RUN chmod +x /home/script.sh


EXPOSE 3306

ENTRYPOINT ["/home/script.sh"]

