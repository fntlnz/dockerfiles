# PHP-FPM
Version: **5.5.16**


## Usage

### Pull

```
docker pull fntlnz/php-fpm:latest
```

### Create a container

`fpm.conf` example

```
# /usr/local/php/etc/php-fpm.conf
[global]
 
pid = /var/run/php-fpm.pid
error_log = log/fpm.log
log_level = error
events.mechanism = epoll
 
include = etc/pool.d/*.conf
```

pool example

```
# /usr/local/php/etc/pool.d/sitename.conf
[sitename]
 
user = fpm
group = fpm
 
listen = /var/www/php/fpm-sitename.sock
listen.mode = 0666
 
pm = dynamic
pm.max_children = 20
pm.start_servers = 10
pm.min_spare_servers = 10
pm.max_spare_servers = 10
pm.max_requests = 100
 
chdir = /var/www/nginx/sitename/
 
security.limit_extensions = .php .phtml
 
request_terminate_timeout = 600
```

```
docker run -d -v /host/php/etc:/usr/local/php/etc -v /host/www:/var/www fntlnz/php-fpm:latest
```