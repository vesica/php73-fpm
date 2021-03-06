FROM php:7.3-fpm

# Setup Debian
RUN apt-get upgrade && apt-get update && ACCEPT_EULA=Y && apt-get install -y \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libmemcached-dev \
    libzip-dev \
    libgeoip-dev \
    libxml2-dev \
    libxslt-dev \
    libtidy-dev \
    libaio1 \
    apt-file \
    wget \
    vim \
    gnupg \
    gnupg2 \
    zip \
    git

# Install PECLs
RUN pecl channel-update pecl.php.net \
    && pecl install redis \
    && pecl install geoip-1.1.1 \
    && pecl install apcu \
    && pecl install memcached \
    && pecl install timezonedb

# Install and activate extensions
RUN docker-php-ext-install -j$(nproc) calendar iconv bcmath xml gd mbstring pdo tidy gettext intl pdo pdo_mysql mysqli simplexml tokenizer xml xsl xmlwriter zip opcache exif \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-enable redis geoip apcu memcached timezonedb

# Install Composer
RUN mkdir -p /usr/local/ssh
COPY scripts/* /usr/local/ssh/
RUN sh /usr/local/ssh/install-composer.sh
RUN mv composer.phar /usr/local/bin/composer

# Add PHPInfo file to webroot
RUN echo "<?php echo phpinfo(); ?>" > /var/www/html/phpinfo.php

# Make production ready
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
