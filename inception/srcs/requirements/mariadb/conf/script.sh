#!/bin/bash

mysql_install_db --user=mysql --ldata=/var/lib/mysql

mysqld_safe --nowatch &

until mysqladmin ping &>/dev/null; do \
       sleep 1; \
done

mariadb -u root -e "CREATE DATABASE $DATABASE;
                    CREATE USER $USER IDENTIFIED BY '$PASSWORD';
                    GRANT ALL PRIVILEGES ON $DATABASE.* TO $USER IDENTIFIED BY '$PASSWORD';
                    FLUSH PRIVILEGES;"

while true; do
    sleep 1
done