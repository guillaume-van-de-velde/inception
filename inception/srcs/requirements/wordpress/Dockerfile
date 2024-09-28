FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y \
    curl \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-xmlrpc \
    mariadb-client \
    less \
    vim \
    wget \
    libmariadb-dev-compat \
    libmariadb-dev

RUN mkdir -p /run/php /var/www/html

RUN wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh /home/config.sh

RUN chmod +x /home/config.sh

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/home/config.sh"]