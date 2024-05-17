#!/bin/bash

mysqld_safe &

until mysqladmin ping &>/dev/null; do \
       sleep 1; \
done

mariadb -u root -e "CREATE DATABASE $SQL_DATABASE;
                    CREATE USER $SQL_USER IDENTIFIED BY $SQL_PASSWORD;
                    GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER IDENTIFIED BY $SQL_PASSWORD;
                    FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec mysqld_safe
