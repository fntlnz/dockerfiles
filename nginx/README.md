![Nginx Logo](http://i.imgur.com/DhBbBQF.png)

Latest Version: **1.9.2**

[View on GitHub](https://github.com/fntlnz/dockerfiles/tree/master/nginx)

Available versions

- 1.9.2
- 1.8.0
- 1.6.2
- 1.6.1
- 1.6.0

## Example Usage

```
docker pull fntlnz/nginx
docker run -d -v /local/log/path:/data/nginx/log -v /local/www/path:/var/www -v /local/conf/path:/usr/local/nginx/conf fntlnz/nginx -c '/usr/local/nginx/conf/nginx.conf'
```
