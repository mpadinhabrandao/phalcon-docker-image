FROM php:8.4.8-fpm-alpine

# Instala dependências necessárias para compilar extensões PHP (como Phalcon)
RUN apk add --no-cache \
        bash \
        git \
        gcc \
        g++ \
        make \
        re2c \
        autoconf \
        libtool \
        pcre-dev \
        php8-pecl-psr \
        php8-dev \
        libc-dev \
        linux-headers

# Instalar phalcon via PECL (com versão específica)
RUN pecl install phalcon-5.9.3 \
    && docker-php-ext-enable phalcon

# Limpeza opcional (reduz tamanho final da imagem)
RUN apk del gcc g++ make autoconf libtool re2c php8-dev libc-dev linux-headers

# Diretório de trabalho
WORKDIR /var/www

# Porta (opcional, se quiseres mapear no docker-compose)
EXPOSE 9000

# Comando final
CMD ["php-fpm"]
