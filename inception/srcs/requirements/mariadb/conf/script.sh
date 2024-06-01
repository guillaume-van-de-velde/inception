#!/bin/bash

mysqld_safe &

until mysqladmin ping &>/dev/null; do \
       sleep 1; \
done

mariadb -u root -e "CREATE DATABASE $DATABASE;
                    CREATE USER $USER IDENTIFIED BY $PASSWORD;
                    GRANT ALL PRIVILEGES ON $DATABASE.* TO $USER IDENTIFIED BY $PASSWORD;
                    FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec mysqld_safe
