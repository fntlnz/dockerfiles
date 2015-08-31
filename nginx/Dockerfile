# This is just a template
# To build use the build.sh script
FROM centos:centos7

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

WORKDIR /tmp
RUN yum install -y install gcc gcc-c++ make zlib-devel pcre-devel openssl-devel wget telnet tar \
    && wget -nv -O - http://nginx.org/download/nginx-VERSION.tar.gz | tar zx \
    && cd nginx-VERSION \
    && ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --error-log-path=/dev/stdout --http-log-path=/dev/stdout --with-http_gzip_static_module --with-http_stub_status_module --with-http_ssl_module --with-pcre --with-file-aio --with-http_realip_module --without-http_scgi_module --without-http_uwsgi_module \
    && make -j \
    && make install \ 
    && rm -Rf /tmp/nginx*

WORKDIR /

# Add nginx user
RUN useradd nginx

ENTRYPOINT [ "/usr/local/nginx/sbin/nginx", "-g", "daemon off;" ]

EXPOSE 80
EXPOSE 443
