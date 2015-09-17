![Nginx Logo](http://i.imgur.com/DhBbBQF.png)

Latest Mainline Version: **1.9.4**

Latest Stable Version: **1.8.0**

Available versions

- 1.9.4 - *latest*
- 1.9.3
- 1.9.2
- 1.9.1
- 1.9.0
- 1.8.0
- 1.7.11
- 1.7.10
- 1.7.9
- 1.6.3
- 1.6.2
- 1.6.1
- 1.6.0

## Example Usage

```
docker pull fntlnz/nginx
docker run -d -v /local/log/path:/data/nginx/log -v /local/www/path:/var/www -v /local/conf/path:/usr/local/nginx/conf fntlnz/nginx -c '/usr/local/nginx/conf/nginx.conf'
```
