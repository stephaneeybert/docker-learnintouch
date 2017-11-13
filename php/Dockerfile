FROM stephaneeybert/httpd:2.4.25


# Installing jpeg

WORKDIR /usr/bin/
COPY jpegsrc.v9b.tar.gz /usr/bin/
RUN gzip -d jpegsrc.v9b.tar.gz \
  && tar -xvf jpegsrc.v9b.tar \
  && ln -s jpeg-9b jpeg
WORKDIR /usr/bin/jpeg/
RUN ./configure --enable-shared \
  && make \
  && make install \
  && make clean


# Installing libpng

WORKDIR /usr/bin/
COPY libpng-1.6.29.tar.gz /usr/bin/
RUN gzip -d libpng-1.6.29.tar.gz \
  && tar -xvf libpng-1.6.29.tar \
  && ln -s libpng-1.6.29 libpng
WORKDIR /usr/bin/libpng/
RUN ./configure \
  --with-zlib-prefix=/usr
RUN make \
  && make install \
  && make clean


# Installing freetype

RUN apt-get install -y libbz2-dev

WORKDIR /usr/bin/
COPY freetype-2.8.tar.gz /usr/bin/
RUN gzip -d freetype-2.8.tar.gz \
  && tar -xvf freetype-2.8.tar \
  && ln -s freetype-2.8 freetype
WORKDIR /usr/bin/freetype/
RUN ./configure \
  --with-bzip2 \
  && make \
  && make install \
  && make clean


# Installing the mysql client for php

RUN apt-get install -y libncurses-dev

COPY mysql-5.6.30.tar.gz /usr/bin/
WORKDIR /usr/bin/
RUN gzip -d mysql-5.6.30.tar.gz \
  && tar -xvf mysql-5.6.30.tar \
  && ln -s mysql-5.6.30 mysql

WORKDIR /usr/bin/mysql/
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \ 
  && mkdir install/tmp

RUN cd /usr/bin/mysql/; cmake \
  -DCMAKE_INSTALL_PREFIX=/usr/bin/mysql/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DMYSQL_DATADIR=/usr/bin/mysql/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/usr/bin/mysql/install/boost \
  -DMYSQL_UNIX_ADDR=/usr/bin/mysql/install/tmp/mysql.sock

RUN make \
  && make install \
  && make clean


# Installing php

RUN apt-get update
RUN apt-get install -y \
  libxml2-dev libxslt-dev \
  libicu-dev \
  pkg-config \
  openssl libssl-dev libcurl4-openssl-dev

WORKDIR /usr/bin/
COPY php-5.6.20.tar.gz /usr/bin/
RUN gzip -d php-5.6.20.tar.gz \
  && tar -xvf php-5.6.20.tar \
  && ln -s php-5.6.20 php

WORKDIR /usr/bin/php/
RUN ./configure \
  --prefix=/usr/bin/php/install \
  --with-apxs2=/usr/bin/apache/bin/apxs \
  --with-config-file-path=/usr/bin/php-5.6.20/ \
  --enable-libgcc \
  --with-mysql=/usr/bin/mysql/install/ \
  --with-mysqli=/usr/bin/mysql/install/bin/mysql_config \
  --with-pdo-mysql=/usr/bin/mysql/install/ \
  --with-zlib-dir=/usr \
  --with-jpeg-dir=/usr \
  --with-png-dir=/usr \
  --with-gd \
  --enable-gd-native-ttf \
  --with-freetype-dir=/usr \
  --enable-ftp \
  --enable-xml \
  --enable-zip \
  --with-bz2 \
  --enable-wddx \
  --without-pear \
  --enable-mbstring \
  --with-openssl \
  --with-curl \
  && make \
  && make install \
  && make clean

RUN mkdir /usr/bin/php/tmp \
  && chmod 777 /usr/bin/php/tmp


# Install phpredis

RUN apt-get install -y autoconf

COPY phpredis-2.2.7.tar.gz /usr/bin
WORKDIR /usr/bin
RUN gzip -d phpredis-2.2.7.tar.gz \
  && tar -xvf phpredis-2.2.7.tar \
  && ln -s phpredis-2.2.7 phpredis
WORKDIR /usr/bin/phpredis
RUN chmod a+x /usr/bin/php/scripts/phpize \
  && sleep 1 \
  && /usr/bin/php/scripts/phpize \
  && chmod a+x /usr/bin/php/scripts/php-config \
  && ./configure --prefix=/usr/bin/redis/install --with-php-config=/usr/bin/php/scripts/php-config \
  && make \
  && make install \
  && make clean \
  && ls /usr/bin/php/install/lib/php/extensions/no-debug-zts-20131226/redis.so

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/php:5.6.20 .
# Rename the image: docker tag stephaneeybert/php:5.6.20 thalasoft.com:5000/php:5.6.20
# Push the image: docker push thalasoft.com:5000/php:5.6.20
# Run the container: docker run -d -p 81:80 --name httpd stephaneeybert/php:5.6.20
# Check that the port is open: nmap -p 81 localhost
# Open a shell in the container: docker exec -it httpd bash

