# NGIИX
Latest Version: **1.8.0**

Available versions
- 1.8.0
- 1.6.2
- 1.6.1
- 1.6.0

## Example Usage

```
docker pull fntlnz/nginx
docker run -d -v /local/log/path:/data/nginx/log -v /local/www/path:/var/www -v /local/conf/path:/usr/local/nginx/conf fntlnz/nginx -c '/usr/local/nginx/conf/nginx.conf'
```
