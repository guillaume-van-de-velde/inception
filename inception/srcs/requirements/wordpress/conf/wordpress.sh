#!/bin/bash

set -e

cd /var/www && tar -xf wordpress-6.5-fr_FR.tar.gz -C /var/www/html --strip-components=1

cd /var/www/html

sleep 5

while ! mariadb -h mariadb -u $DB_USER -p$DB_PASSWORD -P 3306 $DB_NAME -e ";" 2>/dev/null ; do
	sleep 1
done

if ! test -f wp-config.php; then
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html
fi

if ! wp core is-installed --allow-root ; then
    wp core install --allow-root --title=$TITLE --url=svan-de-.42.fr --admin_user=$WP_ADMIN_USERNAME --admin_email=$WP_ADMIN_USERNAME@worpress.com --admin_password=$WP_ADMIN_PASSWORD
    wp user create --allow-root $WP_USER_USERNAME $WP_USER_USERNAME@wordpress.com --user_pass=$WP_USER_PASSWORD
fi

exec php-fpm7.4 -F