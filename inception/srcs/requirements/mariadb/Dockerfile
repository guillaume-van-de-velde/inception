FROM debian:bullseye

RUN apt update -y

RUN apt upgrade -y

RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY panamapapers.sqlite3 /home/panamapapers.sqlite3

RUN mkdir -p /var/run/mysqld/
RUN chown mysql:mysql /var/run/mysqld/

# Commande par défaut à exécuter au démarrage du conteneur
#CMD ["mysqld", "--socket=/var/run/mysqld/mysqld.sock", "--port=3306"]