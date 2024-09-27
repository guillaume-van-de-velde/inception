#!/bin/bash

mysql_install_db --user=mysql --ldata=/var/lib/mysql

mysqld_safe --nowatch &

until mysqladmin ping &>/dev/null; do \
       sleep 1; \
done

mariadb -u root -e "CREATE DATABASE $DB_NAME;
                    CREATE USER $DB_USER IDENTIFIED BY '$DB_PASSWORD';
                    GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER IDENTIFIED BY '$DB_PASSWORD';
                    FLUSH PRIVILEGES;"

while true; do
    sleep 1
done