FROM php:8.3-fpm

# Install necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory
WORKDIR /app

# Copy application source code
COPY ./ /app

# Expose port 9000 for PHP-FPM
EXPOSE 9000
