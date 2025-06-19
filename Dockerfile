FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y git unzip curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory and clone your code directly from GitHub
WORKDIR /app
RUN git clone https://github.com/ZaloOFM/telegram.git .

# Install PHP dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port
EXPOSE 8080

# Run the PHP built-in web server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]






