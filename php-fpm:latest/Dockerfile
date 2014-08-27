# PHP-FPM
# @version 5.5.16
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM centos:centos6

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

# Prerequisites
RUN yum install gcc gcc-c++ kernel-devel libxml2-devel libxslt-devel openssl-devel libcurl-devel libicu-devel readline-devel bzip2-devel libjpeg-turbo-devel libpng-devel ImageMagick-devel tar wget   -y

# Download PHP and extract
RUN wget -nv -O - http://uk1.php.net/distributions/php-5.5.16.tar.gz | tar zx

# Extensions

# ext-mongo
RUN wget -nv -O - https://github.com/mongodb/mongo-php-driver/archive/1.5.5.tar.gz | tar zx

RUN mv /mongo-php-driver-1.5.5 php-5.5.16/ext/mongo

# ext-imagick
RUN wget -nv -O - http://pecl.php.net/get/imagick-3.1.2.tgz | tar zx
RUN mv /imagick-3.1.2 php-5.5.16/ext/imagick

WORKDIR php-5.5.16

RUN rm configure
RUN ./buildconf --force
RUN ./configure  --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc/ --disable-cgi --without-pear --without-sqlite3 --with-zlib --without-pdo-sqlite --with-curl=/usr/bin/curl --with-openssl --libdir=/usr/lib64 --with-libdir=lib64 --enable-opcache --enable-fileinfo --enable-mbstring --with-readline --enable-fpm --enable-intl --enable-zip --enable-mongo --with-imagick --with-pdo-mysql --with-mysqli

RUN make
RUN make install
RUN make test

RUN ln -s /usr/local/php/bin/* /usr/local/bin

VOLUME ["/usr/local/php/etc"]

WORKDIR /
