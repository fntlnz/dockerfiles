# Nginx
# @version 1.6.0
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM tianon/centos:latest

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

# Prerequisites
RUN yum install -y install gcc gcc-c++ make zlib-devel pcre-devel openssl-devel wget telnet tar

# Download Nginx and extract
RUN wget -nv -O - http://nginx.org/download/nginx-1.6.0.tar.gz | tar zx

WORKDIR nginx-1.6.0

RUN ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --error-log-path=/data/nginx/log/error.log --http-log-path=/data/nginx/log/access.log --with-http_gzip_static_module --with-http_stub_status_module --with-http_ssl_module --with-pcre --with-file-aio --with-http_realip_module --without-http_scgi_module --without-http_uwsgi_module

RUN make -j
RUN make install
WORKDIR /

# Add nginx
RUN useradd nginx

ENTRYPOINT [ "/usr/local/nginx/sbin/nginx", "-g", "daemon off;" ] 
EXPOSE 80
EXPOSE 443
