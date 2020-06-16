FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN \
 echo "**** install build packages ****" && \
 apt update && \
 apt install -y software-properties-common && \
 apt update && \
 add-apt-repository ppa:ondrej/php && \
 apt update && \
 apt install -y \
    apache2 \
    php7.4 \
    libapache2-mod-php7.4 \
    php7.4-bcmath \
    php7.4-common \
    php7.4-imap \
    php7.4-mbstring \
    php7.4-xmlrpc \
    php7.4-soap \
    php7.4-gd \
    php7.4-xml \
    php7.4-intl \
    php7.4-mysql \
    php7.4-cli \
    php7.4-ldap \
    php7.4-zip \
    php7.4-curl \
    unzip \
    curl

COPY php.ini /etc/php/7.4/apache2/php.ini

RUN \
 echo "**** install akaunting ****" && \
 curl -O -J -L https://akaunting.com/download.php?version=latest && \
 mkdir -p /var/www/html/akaunting && \
 unzip Akaunting_*.zip -d /var/www/html/akaunting/ && \
 chown -R www-data:www-data /var/www/html/akaunting/ && \
 chmod -R 755 /var/www/html/akaunting/

COPY akaunting.conf /etc/apache2/sites-available/akaunting.conf

RUN \
 a2ensite akaunting && \
 a2enmod rewrite && \
 a2enmod ssl

EXPOSE 80 443

ENV APACHE_RUN_DIR=/var/run/apache2
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_LOG_DIR=/var/log/apache2

CMD ["apachectl", "-D",  "FOREGROUND"]