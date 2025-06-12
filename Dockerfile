FROM php:8.0-fpm-alpine
RUN apk add nginx redis
EXPOSE  80
COPY nginx.conf /etc/nginx/
COPY redis.conf /etc/
COPY Docker.sh /
ENTRYPOINT ["sh","/Docker.sh"]
