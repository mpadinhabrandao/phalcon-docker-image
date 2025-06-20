FROM php:8.4.8-fpm-alpine

# Instalar dependências para compilação de extensões
RUN apk add --no-cache \
    bash \
    git \
    gcc \
    g++ \
    make \
    autoconf \
    libtool \
    re2c \
    pcre-dev \
    linux-headers \
    php-pear

# Instalar Phalcon via PECL
RUN pecl install phalcon-5.9.3 \
    && docker-php-ext-enable phalcon

# Limpeza opcional (reduz tamanho da imagem)
RUN apk del gcc g++ make autoconf libtool re2c linux-headers

# Diretório de trabalho
WORKDIR /var/www

EXPOSE 9000

CMD ["php-fpm"]
