#!/bin/bash

set -e

cd /var/www/wordpress

echo "USER: $USER"
echo "PASSWORD: $PASSWORD"
echo "DATABASE: $DATABASE"

while ! mariadb -h mariadb -u $USER -p$PASSWORD -P 3306 $DATABASE -e ";" 2>/dev/null ; do
	sleep 1
done

echo "USER2: $USER"
echo "PASSWORD2: $PASSWORD"
echo "DATABASE2: $DATABASE"

if ! test -f wp-config.php; then
    wp config create --dbname=$NAME --dbuser=$USER --dbpass=$PASSWORD --dbhost=mariadb:3306
fi

if ! wp core is-installed; then
    wp core install --title=$TITLE --url=svan-de-.42.fr --admin_user=$ADMIN_USERNAME --admin_email=$ADMIN_USERNAME@worpress.com --admin_password=$ADMIN_PASSWORD
    wp user create $USER_USERNAME $USER_USERNAME@wordpress.com --user_pass=$USER_PASSWORD
fi

exec php-fpm81 -F