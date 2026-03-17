FROM alpine:3.19

# Install Nginx + PHP-FPM + PHP extensions
RUN apk add --no-cache \
    nginx \
    php81 \
    php81-fpm \
    php81-ldap \
    php81-session \
    php81-json \
    php81-mbstring \
    php81-openssl \
    php81-xml \
    php81-tokenizer \
    php81-simplexml \
    php81-phar \
    php81-gd \
    php81-curl \
    git

# Install phpLDAPadmin
RUN git clone https://github.com/leenooks/phpLDAPadmin /var/www/phpldapadmin \
    && chown -R nginx:nginx /var/www/phpldapadmin

# Copy your Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy PHP-FPM config
COPY php-fpm.conf /etc/php81/php-fpm.conf

EXPOSE 6080
CMD php-fpm81 && nginx -g 'daemon off;'
