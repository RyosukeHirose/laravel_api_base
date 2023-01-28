FROM php:8.0-fpm
ARG TZ

RUN apt-get update
RUN apt-get -y install libzip-dev unzip
RUN docker-php-ext-install zip pdo pdo_mysql
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get -y install nodejs
RUN apt-get -y install git

# RUN npm install -g n
# RUN n lts
# RUN apt-get purge nodejs npm
# RUN apt-get autoremove

# cronのインストール
# RUN apt-get update && apt-get install -y \
#   busybox-static \
#   && apt-get clean

# COPY ./local/cron/batch /var/spool/cron/crontabs/root


# composerをインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
