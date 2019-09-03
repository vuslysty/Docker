FROM ubuntu:18.04

ENV NEXT_CLOUD_USER_NAME admin
ENV NEXT_CLOUD_PASSWORD password
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y;
RUN apt-get install -y apache2 libapache2-mod-php7.2 wget;
RUN apt-get install -y php7.2-gd php7.2-json php7.2-mysql php7.2-curl php7.2-mbstring php7.2-intl php-imagick php7.2-xml php7.2-zip;

RUN wget https://download.nextcloud.com/server/releases/nextcloud-16.0.4.tar.bz2

RUN tar -xjf nextcloud*.bz2
RUN mv nextcloud /var/www

RUN echo "Alias /nextcloud \"/var/www/nextcloud/\" \n\
\n\
DocumentRoot /var/www/nextcloud \n\
\n\
<Directory /var/www/nextcloud/>\n\
  Require all granted\n\
  Options FollowSymlinks MultiViews\n\
  AllowOverride All\n\
\n\
 <IfModule mod_dav.c>\n\
  Dav off\n\
 </IfModule>\n\
\n\
 SetEnv HOME /var/www/nextcloud\n\
 SetEnv HTTP_HOME /var/www/nextcloud\n\
\n\
 Satisfy Any\n\
\n\
</Directory>\n\
" > /etc/apache2/sites-available/nextcloud.conf

RUN a2ensite nextcloud.conf
RUN a2enmod rewrite; a2enmod headers; a2enmod env; a2enmod dir; a2enmod mime;

RUN a2dissite 000-default.conf;

RUN service apache2 restart

RUN chown -R www-data:www-data /var/www/nextcloud/
RUN apt install sudo -y

WORKDIR /var/www/nextcloud/

EXPOSE 80

CMD eval "sudo -u www-data php occ  maintenance:install --database \"mysql\" --database-host \"db\" --database-name \"nextcloud\"  --database-user \"root\" --database-pass \"$DB_ENV_MYSQL_ROOT_PASSWORD\" --admin-user \"$NEXT_CLOUD_USER_NAME\" --admin-pass \"$NEXT_CLOUD_USER_PASSWORD\"" && echo "\$CONFIG['trusted_domains'][1] = '192.168.99.*';" >> /var/www/nextcloud/config/config.php; service apache2 restart; tail -f /dev/null;
