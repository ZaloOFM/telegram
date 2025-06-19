FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y git unzip curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clone your public GitHub repo into the image
WORKDIR /app
RUN git clone https://github.com/ZaloOFM/telegram.git .

# Install PHP dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port 8080
EXPOSE 8080

# Start PHP server from /app/public
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]





