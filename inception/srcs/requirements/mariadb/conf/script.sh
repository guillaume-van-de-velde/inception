#!/bin/bash

service mariadb start \
    && until mysqladmin ping &>/dev/null; do \
           sleep 1; \
       done

mariadb -u root -e "CREATE DATABASE $SQL_DATABASE;
                    CREATE USER $SQL_USER IDENTIFIED BY $SQL_PASSWORD;
                    GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER IDENTIFIED BY $SQL_PASSWORD;
                    ALTER USER 'root'@'localhost' IDENTIFIED BY $SQL_PASSWORD;
                    FLUSH PRIVILEGES;"

exec "$@"

# mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
# set -e

# if [ -z "$(ls -A /var/lib/mysql)" ]; then
#     echo "Initialisation de la base de données..."

#     until mysqladmin ping >/dev/null 2>/dev/null; do
#         sleep 1
#     done

#     mariadb -u root -e "CREATE DATABASE $SQL_DATABASE;
#                         CREATE USER $SQL_USER IDENTIFIED BY $SQL_PASSWORD;
#                         GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER IDENTIFIED BY $SQL_PASSWORD;
#                         ALTER USER 'root'@'localhost' IDENTIFIED BY $SQL_PASSWORD;
#                         FLUSH PRIVILEGES;"

# fi

