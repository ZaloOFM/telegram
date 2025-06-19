FROM php:8.2-cli

# Install required packages
RUN apt-get update && apt-get install -y git unzip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy code
COPY . .

# Install dependencies
RUN composer install

# Expose port
EXPOSE 8080

# Start the PHP built-in server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]
