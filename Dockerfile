# We select the Base image which is a PHP runtime with FastCGI Process Manager (FPM).
FROM php:8.2-fpm

ARG user
ARG uid


# Installing system dependencies
RUN apt-get update && apt-get install -y \
    coreutils \
    libzip-dev \
    libsodium-dev \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
# end here 

# Install php extensions using docker-php-ext-install
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip sodium

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# set the working directory
WORKDIR /var/www

# copy our laravel project in /var/www
COPY . /var/www


# Set Permissions for Storage and Cache
RUN mkdir -p /var/www/storage/logs && \
    chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache && \
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Copy the entrypoint script and make it executable
COPY docker-compose/entrypoint.sh /usr/local/bin/entrypoint.sh

# Grants execution permissions (chmod +x) so it can run when the container starts.
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Expose the port
EXPOSE 80

#  set the command to run the php process manager fpm
CMD ["php-fpm"]
