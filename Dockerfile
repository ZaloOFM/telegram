FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y git unzip

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Run Composer install
RUN composer install

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]
