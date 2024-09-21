FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install wget php-fpm mariadb-client -y

RUN mkdir -p /run/php /var/www/wordpress

RUN wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xf wordpress-6.5-fr_FR.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


COPY conf/config.sh /home/config.sh

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

EXPOSE 9000

CMD ["sh", "/home/config.sh"]