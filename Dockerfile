FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y git unzip

# Copy composer from official composer image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory to the root of the project
WORKDIR /

# Copy all files to container
COPY . .

# Install PHP dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port
EXPOSE 8080

# Run the PHP server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]



