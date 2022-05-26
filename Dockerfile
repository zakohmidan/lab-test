FROM php:7.4-apache

RUN apt-get update \
    && apt-get install -y vsftpd curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME=/root \
    TERM=xterm \
    DEBIAN_FRONTEND=noninteractive \
    STARTUPDIR=/dockerstartup 

# RUN apt update
# RUN apt install vsftpd curl -y

#COPY /etc/vsftpd.conf /etc/vsftpd.conf.backup 00000

COPY cnf/vsftpd.conf /etc/vsftpd.conf

COPY src/ /var/www/html/

COPY ./start_up/startup.sh "${STARTUPDIR}"/
RUN find "${STARTUPDIR}"/ -name '*.sh' -exec chmod a+x {} +
RUN $STARTUPDIR/startup.sh




WORKDIR /var/www
EXPOSE 8001 21
#CMD ["php","-S","0.0.0.0:8001","-t","html"]
