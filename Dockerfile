FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y git unzip curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www

# Copy everything (including composer.json)
COPY . .

# Double check composer.json is there before install
RUN ls -la /var/www && cat /var/www/composer.json

# Install PHP dependencies
RUN composer install

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]


