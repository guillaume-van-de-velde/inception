#!/bin/bash

set -e

cd /var/www && tar -xf wordpress-6.5-fr_FR.tar.gz -C /var/www/html --strip-components=1

cd /var/www/html

while ! mariadb -h mariadb -u $USER -p$PASSWORD -P 3306 $DATABASE -e ";" 2>/dev/null ; do
	sleep 1
done

if ! test -f wp-config.php; then
    wp config create --allow-root --dbname=$DATABASE --dbuser=$USER --dbpass=$PASSWORD --dbhost=mariadb:3306 --path=/var/www/html
fi

if ! wp core is-installed --allow-root ; then
    wp core install --allow-root --title=$TITLE --url=svan-de-.42.fr --admin_user=$ADMIN_USERNAME --admin_email=$ADMIN_USERNAME@worpress.com --admin_password=$ADMIN_PASSWORD
    wp user create --allow-root $USER_USERNAME $USER_USERNAME@wordpress.com --user_pass=$USER_PASSWORD
fi

exec "$@"