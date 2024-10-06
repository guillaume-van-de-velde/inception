FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y vsftpd

COPY conf/ftp.sh /home/ftp.sh

COPY conf/ftp.conf /home/ftp.conf

RUN chmod +x /home/ftp.sh

RUN mkdir -p /var/www/html

RUN mkdir -p /var/run/vsftpd/empty

ENTRYPOINT ["/home/ftp.sh"]