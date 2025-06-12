FROM php:8.0-fpm-alpine
RUN apk add autoconf g++ make nginx redis
RUN printf '\n' | pecl install redis && docker-php-ext-enable redis
RUN docker-php-ext-install pdo_mysql
EXPOSE  80
COPY nginx.conf /etc/nginx/
COPY redis.conf /etc/
COPY Docker.sh /
ENTRYPOINT ["sh","/Docker.sh"]
