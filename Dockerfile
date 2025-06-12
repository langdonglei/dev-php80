FROM php:8.0-fpm-alpine

EXPOSE 80

RUN apk add autoconf g++ make nginx redis

# php-redis
RUN printf '\n' | pecl install redis-6.2.0 && docker-php-ext-enable redis

# php-mssql
RUN apk add unixodbc-dev && pecl install pdo_sqlsrv-5.11.1 && docker-php-ext-enable pdo_sqlsrv

# php-mysql
RUN docker-php-ext-install pdo_mysql

COPY nginx.conf /etc/nginx/
COPY redis.conf /etc/
COPY Docker.sh /

ENTRYPOINT ["sh","/Docker.sh"]
