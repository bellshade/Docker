# Di project ini ialah project tentang miniserver
# Dimana membuat wordpress, phpmyadmin, dan database
# Note ini adalah cuma untuk belajar saja
# Kenyataannya annti setiap service itu dipisah

# FROM php:7.3
FROM php:7.3-apache

# Custom work directory
# WORK /app/bellshade
WORKDIR /app/bellshade

# COPY config kedalam image
COPY . .

# Install package yang dibutuhkan dan extention pgp
RUN apt update -y && apt install mariadb-server wget git unzip -y
RUN docker-php-ext-install mysql && docker-php-ext-install mysqli

# Install wordpress dan phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.zip
RUN unzip phpMyAdmin-4.9.7-all-languages.zip
RUN mv phpMyAdmin-4.9.7-all-languages /usr/share/pma
RUN rm /usr/share/pma/config.sample.inc.php
COPY /assets/config.inc.php /usr/share/pma/config.inc.php

# Command dibawawh digunakan untuk setup wordpress
RUN wget https://wordpress.org/latest.zip
RUN mv latest.zip /var/www/html/
RUN unzip /var/www/html/latest.zip
RUN mv /app/bellshade/wordpress /var/www/html
COPY /assets/wp-config.php /var/www/html/wordpress/wp-config.php

# Command dibawah  untuk setup Database & Port Image
RUN chmod 777 setup.sh
RUN ./setup.sh
EXPOSE 80 3306