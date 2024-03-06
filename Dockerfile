FROM benvenuti/php-composer:1.1

COPY slim-master /var/www/html

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www

RUN docker-php-ext-install mysqli 
RUN docker-php-ext-enable mysqli 

RUN composer update