FROM debian:bullseye

RUN mkdir -p /var/www/html

COPY conf/staticpage.html /home/staticpage.html

COPY conf/staticpage.sh /home/staticpage.sh

RUN chmod +x /home/staticpage.sh

ENTRYPOINT ["/home/staticpage.sh"]