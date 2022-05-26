FROM php:7.4-apache
RUN apt update
RUN apt install vsftpd curl -y

#COPY /etc/vsftpd.conf /etc/vsftpd.conf.backup
COPY cnf/vsftpd.conf /etc/vsftpd.conf

COPY src/ /var/www/html/
WORKDIR /var/www
EXPOSE 8001 21
CMD ["php","-S","0.0.0.0:8001","-t","html"]
