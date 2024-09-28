#!/bin/bash

mysql_install_db --user=mysql --ldata=/var/lib/mysql

mysqld_safe &

until mysqladmin ping &>/dev/null; do \
       sleep 1; \
done

mariadb -u root -e "CREATE DATABASE $DB_NAME;
                    CREATE USER $DB_USER IDENTIFIED BY '$DB_PASSWORD';
                    GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER IDENTIFIED BY '$DB_PASSWORD';
                    FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec mysqld_safe