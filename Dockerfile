# Grund-Image
FROM php:8.1-fpm

# Variablen, können in docker-compose.yml überschrieben werden
# User
ARG USER="www-run"
ARG GROUP="www-data"
ARG UID="1000"
# Node-Version
ARG VERSION="node_16.x"

# Paktete nachinstallieren
RUN apt-get update && apt-get install -y \
    build-essential lsb-release \
    git \
    curl wget \
    snapd \
    vim \
    locales \
    libpng-dev \
    jpegoptim optipng pngquant gifsicle \
    libonig-dev \
    libxml2-dev \
    zip libzip-dev \
    unzip \
    libpq-dev \
    libldap2-dev ldap-utils \
    xz-utils

# Apt-Clear bereinigen
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# PHP-Erweiterungen installieren
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd ldap intl

# Composer vom Docker-Image holen
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer --version

# Node.js installieren und updaten
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb http://deb.nodesource.com/$VERSION $(lsb_release -s -c) main" | tee /etc/apt/sources.list.d/nodesource.list
RUN echo "deb-src http://deb.nodesource.com/$VERSION $(lsb_release -s -c) main" | tee -a /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get -y install nodejs
RUN npm config set strict-ssl false
RUN npm install -g npm@latest
RUN npm cache clean -f
RUN npm install -g n
RUN n stable

# Benutzer und Gruppe anlegen
RUN useradd -G ${GROUP},root -u ${UID} -d /home/${USER} ${USER}
RUN mkdir -p /home/${USER}/.composer && \
    chown -R ${USER}:${GROUP} /home/${USER}

# Daten in das Image kopieren
COPY --chown=${USER}:${GROUP} ./www /var/www
COPY --chown=${USER}:${GROUP} ./.env /var/www/.env
RUN chmod -R 775 /var/www 

# Arbeitsverzeichnis setzen
WORKDIR /var/www

# zum Standard-Benutzer wechseln
USER ${USER}

RUN pwd
RUN ls -la /home/${USER}
RUN ls -la /var/www
RUN whoami

# Laravel einrichten
RUN composer update
RUN php artisan key:generate
RUN php artisan storage:link
RUN npm update && npm run prod