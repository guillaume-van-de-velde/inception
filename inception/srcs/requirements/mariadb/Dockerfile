FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server mariadb-client -y

COPY conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/mariadb-server.cnf

COPY conf/mariadb.sh /home/mariadb.sh

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

RUN chmod +x /home/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/home/mariadb.sh"]