# ベースイメージの指定
FROM php:fpm-buster

# 作成した設定ファイルをphpコンテナの設定ファイルにコピー
COPY ./php/php.ini /usr/local/etc/php/php.ini

# パッケージのインストール
RUN apt-get update \
    && apt-get -y install git zip unzip vim

RUN docker-php-ext-install pdo_mysql

# composerのインストール
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer

# コンテナ内で作業する際のカレントディレクトリの指定
WORKDIR /var/www/html
