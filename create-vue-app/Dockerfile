FROM alpine:latest

RUN apk update && \
    apk add --no-cache nodejs-lts npm icu-data-full jq && \
    rm -rf /var/cache/apk/*

RUN npm install pnpm --global --no-fund

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]