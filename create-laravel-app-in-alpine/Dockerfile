FROM alpine:latest

RUN apk update && apk add --no-cache \
    composer \
    php83-tokenizer \
    php83-session \
    php83-xml \
    php83-xmlwriter \
    php83-simplexml \
    php83-fileinfo \
    php83-pdo \
    php83-pdo_sqlite \
    php83-sqlite3 \
    php83-pcntl \
    php83-dom \
    nodejs-lts \
    npm \
    icu-data-full

ENV PATH="/root/.composer/vendor/bin:${PATH}"

RUN composer global require laravel/installer
RUN npm install --global pnpm

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]