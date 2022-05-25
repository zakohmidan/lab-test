FROM php:7.4-apache
RUN apt install vsftpd -y
# COPY 
COPY src/ /var/www/html/
WORKDIR /var/www
EXPOSE 8001
CMD ["php","-S","0.0.0.0:8001","-t","html"]
