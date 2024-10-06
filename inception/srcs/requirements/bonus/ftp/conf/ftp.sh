#!/bin/bash

cat /home/ftp.conf >> /etc/vsftpd.conf

adduser "$FTP_USER" --disabled-password

sleep 1

echo "$FTP_USER":"$FTP_PASSWORD" | /usr/sbin/chpasswd

chown -R "$FTP_USER":"$FTP_USER" /var/www/html

exec vsftpd /etc/vsftpd.conf