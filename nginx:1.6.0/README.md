# NGINX
Version: **1.6.0**

## Usage

```
docker pull fntlnz/nginx:1.6.0
docker run -d -v /local/log/path:/var/log/nginx -v /local/www/path:/var/www -v /local/conf/path:/usr/local/nginx/conf fntlnz/nginx:latest -c '/usr/local/nginx/conf/nginx.conf'
```
